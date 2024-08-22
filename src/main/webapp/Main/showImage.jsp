<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Show Image</title>
    <script type="text/javascript">
    function show_image() {
        var inputFileName = document.getElementById("inputFileName").value;
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "showImageController.jsp?fileName=" + encodeURIComponent(inputFileName), true);
        xhr.responseType = 'blob';  // 바이너리 데이터를 처리하기 위해 responseType을 blob으로 설정

        xhr.send();
        console.log(`Sent request to show image: ${inputFileName}`);

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
    </script>
</head>
<body>
    <input type="text" id="inputFileName" placeholder="Enter fileName">
    <button onclick="show_image()">Show Image</button>

    <!-- 이미지를 출력할 공간 -->
    <div id="output"></div>
</body>
</html>
