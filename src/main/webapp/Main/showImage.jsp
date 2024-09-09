<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<title>Show Image</title>
    <script type="text/javascript">
    // 이미지 표시 함수
    function show_image(fileName) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "showImageController.jsp?fileName=" + encodeURIComponent(fileName), true);
        xhr.responseType = 'blob';

        xhr.send();
        console.log(fileName);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = xhr.response;
                console.log(response);

                if (response) {
                    var imgURL = URL.createObjectURL(response);
                    console.log(imgURL);
                    document.getElementById("output").innerHTML = '<img src="' + imgURL + '" alt="Image">';
                } else {
                    document.getElementById("output").innerHTML = 'Error: Could not load image.';
                }
            }
        };
        xhr.onerror = function() {
            console.log("An error occurred during the request.");
        };
    }

    // Enter 키 이벤트를 처리하는 함수
    function handleKeyPress(event) {
        if (event.keyCode === 13) {
            var inputFileName = document.getElementById("inputFileName").value;
            show_image(inputFileName);
        }
    }
    </script>
</head>
<body>
    <%
        // 서버의 루트 경로에서 임시 경로를 제거하고 실제 개발 경로로 설정
        String rootPath = application.getRealPath("/");
        String imagePath = "C:/Users/dongok/eclipse-workspace_webServer/Dalle3Site/src/main/webapp/resources/generateImages/";
        /* out.println("<p>Image Path: " + imagePath + "</p>");  // 디버깅을 위해 imagePath 출력 */

        File imageDir = new File(imagePath);
        List<String> imageList = new ArrayList<>();

        if(imageDir.exists() && imageDir.isDirectory()) {
            File[] files = imageDir.listFiles();
            if(files != null) {
                for(File file : files) {
                    String fileName = file.getName().toLowerCase();
                    if(fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") ||
                       fileName.endsWith(".png") || fileName.endsWith(".gif")) {
                        imageList.add(file.getName());
                    }
                }
            }
        }
    %>
    <ul>
        <%
            for(String imageName : imageList) {
        %>
                <li>
                    <a href="#" onclick="show_image('<%= imageName %>')"><%= imageName %></a>
                </li>
        <%
            }
        %>
    </ul>
    <input type="text" id="inputFileName" placeholder="Enter fileName" onkeyup="handleKeyPress(event)">
    <button onclick="show_image(document.getElementById('inputFileName').value)">Show Image</button>
    <div id="output"></div>
</body>
</html>
