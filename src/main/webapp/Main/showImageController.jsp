<%@ page import="java.io.*" %>
<%@ page contentType="image/png" %>
<%
    String fileName = request.getParameter("fileName");
    if (fileName != null && !fileName.isEmpty()) {
        String fileURL = "C://Users//dongok//eclipse-workspace_webServer//Dalle3Site//src//main//webapp//resources//generateImages//" + fileName;
        
        File file = new File(fileURL);
        out.println("filePath: " + fileURL); // 디버깅용 출력

        if (file.exists() && !file.isDirectory()) {
            response.setContentType("image/png"); // 올바른 MIME 타입 설정
            try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
                byte[] buffer = new byte[1024];
                int bytesRead;

                while ((bytesRead = fis.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
            }
        } else {
            response.setContentType("text/plain");
            response.getWriter().print("Error: File not found.");
        }
    } else {
        response.setContentType("text/plain");
        response.getWriter().print("Error: Invalid file name.");
    }
%>
