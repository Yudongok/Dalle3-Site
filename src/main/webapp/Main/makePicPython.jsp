<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.lang.ProcessBuilder" %>

<%
	String line;
	StringBuilder output = new StringBuilder();
	String style = request.getParameter("style");
	String prompt = request.getParameter("prompt");
	String filename = request.getParameter("fileName");
	filename = filename.replace(' ', '_') + "_" + style.replace(' ', '_') + ".png"; 
	
	try{
		if(style == null || prompt == null || style.isEmpty() || prompt.isEmpty()){
			output.append("No input provided");
		}else {
			ProcessBuilder pb = new ProcessBuilder("python", "C:\\Users\\dongok\\eclipse-workspace_webServer\\Dalle3\\runDalle.py", prompt, filename);
			Process p = pb.start();
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
			while((line = reader.readLine()) != null){
				output.append(line);
			}
			reader.close();
			
		}
	}catch(Exception e){
		output.append("Error: ").append(e.getMessage());
	}
	out.print(output.toString());
	String imageURL = "/resources/generateImages/" + filename;
    
    // 이미지 URL을 클라이언트에 반환
    response.getWriter().print(imageURL);
	
	
		
%>