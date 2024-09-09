<%@ page import="java.io.*" %>
<%@ page contentType="image/png" %>
<%
    String fileName = request.getParameter("fileName");
	fileName = fileName.replace('\n', ' ').replace('\r', ' ').trim();
	fileName = (fileName.contains("."))?fileName.replace(' ','_'):fileName.replace(' ', '_') + ".png";
    if (fileName != null && !fileName.isEmpty()) {
        String fileURL = "C://Users//dongok//eclipse-workspace_webServer//Dalle3Site//src//main//webapp//resources//generateImages//" + fileName;
        
        File file = new File(fileURL);
        System.out.println("filePath: " + fileURL);  // 디버깅용 출력
        System.out.println("fileExists: " + file.exists());  // 파일 존재 여부 출력
        System.out.println("isDirectory: " + file.isDirectory());  // 디렉토리 여부 출력


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
            System.out.println("Error: File not found.");
        }
    } else {
        response.setContentType("text/plain");
        response.getWriter().print("Error: Invalid file name.");
        System.out.println("Error: Invalid file name.");
    }
%>
