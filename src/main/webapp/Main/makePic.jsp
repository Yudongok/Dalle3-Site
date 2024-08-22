<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>RunDalle</title>
    <style>
    .image-container {
            position: relative;
            display: inline-block;
            width: 300px; /* Increased image size */
        }
    </style>
    <script type="text/javascript">
        function run_dalle() {
            var inputStyle = document.getElementById("inputStyle").value;
            var inputPrompt = document.getElementById("inputPrompt").value;
            var inputFileName = document.getElementById("inputFileName").value;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "makePicPython.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            var data = "style=" + encodeURIComponent(inputStyle) + "&prompt=" + encodeURIComponent(inputPrompt)
                + "&fileName=" + encodeURIComponent(inputFileName);
            
            xhr.send(data);
            console.log(`Sent data: ${inputStyle}, ${inputPrompt}, ${inputFileName}`);

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = xhr.responseText;
                    console.log(response);
                    // Display image if URL is returned
                    if (response) {
                        document.getElementById("output").innerHTML = '<img src="' + response + '" alt="Generated Image">';
                    } else {
                        document.getElementById("output").innerHTML = 'Image generation failed.';
                    }
                }
            };
            xhr.onerror = function() {
                console.log("An error occurred during the request.");
            };
        }

        function show_image() {
            var inputFileName = document.getElementById("inputFileName").value;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "showImage.jsp?fileName=" + encodeURIComponent(inputFileName), true);
            
            xhr.send();
            console.log(`Sent request to show image: ${inputFileName}`);

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = xhr.responseText;
                    console.log(response);
                    // ì´ë¯¸ì§ì URLì ë°íë°ì íì
                    if (response.startsWith("Error")) {
                        document.getElementById("output").innerHTML = response;
                    } else {
                        document.getElementById("output").innerHTML = '<img src="' + response + '" alt="Image">';
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
    <input type="text" id="inputStyle" placeholder="Enter style">
    <input type="text" id="inputPrompt" placeholder="Enter prompt">
    <input type="text" id="inputFileName" placeholder="Enter fileName">
    <button onclick="run_dalle()">Generate Image</button>
    <a href="./showImage.jsp" class="btn btn-primary image-container">Show Image page</a>
    <div id="output"></div> 
</body>
</html>
