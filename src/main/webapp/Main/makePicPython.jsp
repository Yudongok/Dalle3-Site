<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.lang.ProcessBuilder" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FilenameFilter" %>
<%@ page import = "java.sql.*"  %>

<%
    String line;
    StringBuilder output = new StringBuilder();
    String style = request.getParameter("style");
    String prompt = request.getParameter("prompt");
    String filename = request.getParameter("fileName");
    
    String DB_URL = "jdbc:mysql://localhost:3306/Dalle3";
    String USER = "root";
    String PASSWORD = "1234";
    
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        statement = connection.createStatement();
        
        String query = "SELECT MAX(id) AS latestId FROM imagesInfo";
        resultSet = statement.executeQuery(query);
        
        int nextId = 1;  // Default ID if no record exists
        if (resultSet.next()) {
            int latestId = resultSet.getInt("latestId");
            nextId = latestId + 1;
            System.out.println("latestId: " + latestId);
            System.out.println("nextId: " + nextId);
            filename = filename.replace(' ', '_') + "_" + prompt.replace(' ', '_') + (latestId + 1) + ".png";
            System.out.println("makePicPython filename:" + filename);
        }

        // Python 스크립트 실행
        ProcessBuilder pb = new ProcessBuilder("python", "C:\\Users\\dongok\\eclipse-workspace_webServer\\Dalle3\\runDalle.py", prompt, filename);
        Process p = pb.start();
        BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream(), "UTF-8"));
        
        String result = null;
        while ((line = reader.readLine()) != null) {
            result = line;  // Python 스크립트의 최종 출력을 저장
            System.out.println("result" + result);
        }
        reader.close();
        
        if (result != null && !result.isEmpty()) {
            // 파이프 구분자를 기준으로 결과 분리
            String[] results = result.split("\\|");  // 구분자를 |로 변경
            if (results.length == 5) {
                String generatedFilename = results[0];
                String webImageUrl = results[1];
                String originalPrompt = results[2];
                String revisedPrompt = results[3];
                String imageUrl = results[4];
                
                // 데이터베이스에 삽입
                String insertQuery = "INSERT INTO imagesInfo (id, fileName, prompt, revisedPrompt, localImageStorage, ImageURL) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setInt(1, nextId);
                preparedStatement.setString(2, generatedFilename);
                preparedStatement.setString(3, originalPrompt);
                preparedStatement.setString(4, revisedPrompt);
                preparedStatement.setString(5, webImageUrl);
                preparedStatement.setString(6, imageUrl);
                preparedStatement.executeUpdate();
                System.out.println("nextId: " + nextId);
                System.out.println("generatedFilename: " + generatedFilename);
                System.out.println("originalPrompt: " + originalPrompt);
                System.out.println("revisedPrompt: " + revisedPrompt);
                System.out.println("webImageUrl: " + webImageUrl);
                System.out.println("imageURl: " + imageUrl);
                
                // 결과 출력
                response.getWriter().print(filename);
            } else {
                output.append("Error: Invalid result format from Python script.");
            }
        } else {
            output.append("No output from Python script.");
        }
        
    } catch (SQLException e) {
        System.out.println("Error: "+ e.getMessage());
    } catch (Exception e) {
        output.append("Error: ").append(e.getMessage());
    } finally {
        // 리소스 해제
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }
%>
