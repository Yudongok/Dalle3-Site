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
        #loading{
        	display: none;
        	width: 300px;
        	height: 300px;
        }
    </style>
    <script type="text/javascript">
        function run_dalle() {
            var inputStyle = document.getElementById("inputStyle").value;
            var inputPrompt = document.getElementById("inputPrompt").value;
            var inputFileName = document.getElementById("inputFileName").value;
            
            document.getElementById("loading").style.display = 'block';
            document.getElementById("output").innerHTML = '';

            // 첫 번째 요청: 이미지 생성 요청
            var xhr1 = new XMLHttpRequest();
            xhr1.open("POST", "makePicPython.jsp", true);
            xhr1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            var data = "style=" + encodeURIComponent(inputStyle) + "&prompt=" + encodeURIComponent(inputPrompt)
                + "&fileName=" + encodeURIComponent(inputFileName);
            
            xhr1.send(data);
            console.log(`Sent data: ${inputStyle}, ${inputPrompt}, ${inputFileName}`);

            xhr1.onreadystatechange = function () {
                if (xhr1.readyState === 4 && xhr1.status === 200) {
                    var response = xhr1.responseText;
                    console.log(response);
                    
                    if (response) {
                    	// loading animation hide
                    	document.getElementById("loading").style.display = 'none';
                    	
                        // 이미지 생성이 성공적으로 완료된 후에 이미지 표시 요청 수행
                        show_image(response);
                    } else {
                    	document.getElementById("loading").style.display = 'none';
                        document.getElementById("output").innerHTML = 'Image generation failed.';
                    }
                }
            };
            xhr1.onerror = function() {
            	document.getElementById("loading").style.display = 'none';
                console.log("An error occurred during the image generation request.");
            };
        }

        function show_image(fileName) {
            // 두 번째 요청: 이미지 표시 요청
            var xhr2 = new XMLHttpRequest();
            xhr2.open("GET", "showImageController.jsp?fileName=" + encodeURIComponent(fileName), true);
            xhr2.responseType = 'blob';  // 바이너리 데이터를 처리하기 위해 responseType을 blob으로 설정

            xhr2.send();
            console.log(fileName);
			
            xhr2.onreadystatechange = function () {
            	console.log("Status: " + xhr2.status);
           		console.log("Content-Type: " + xhr2.getResponseHeader("Content-Type"));

                if (xhr2.readyState === 4 && xhr2.status === 200) {
                    var response = xhr2.response;
                    console.log(response);

                    if (response) {
                        var imgURL = URL.createObjectURL(response);
                        console.log(imgURL);
                        document.getElementById("output").innerHTML = '<img src="' + imgURL + '" alt="Generated Image">';
                    } else {
                        document.getElementById("output").innerHTML = 'Error: Could not load image.';
                    }
                }
            };
            xhr2.onerror = function() {
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
    <div>
    	<img id="loading" src="../resources/images/loading.gif" alt="Loading...">
    </div>
</body>
</html>
