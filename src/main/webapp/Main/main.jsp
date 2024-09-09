<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Dalle3-createPic</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }
        .header {
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1000;
            background-color: #343a40;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .nav-link {
            color: #adb5bd;
            font-weight: 500;
        }
        .nav-link:hover {
            color: #ffffff;
        }
        .nav-link.active {
            color: #ffffff;
            background-color: #495057;
        }
        .logo {
            color: #ffffff;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
        }
        .content {
            padding: 20px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 40px; /* Increased gap between images */
            margin-top: 80px; /* Adjust this value if necessary */
        }
        .image-container {
            position: relative;
            display: inline-block;
            width: 300px; /* Increased image size */
        }
        .image-container img {
            width: 100%;
            height: auto;
            transition: transform 0.3s ease;
        }
        .image-container img:hover {
            transform: scale(1.1);
        }
        .image-container .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5rem;
            font-weight: bold;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .image-container:hover .overlay {
            opacity: 1;
        }
        .banner {
            width: 100%;
            position: fixed;
            bottom: 0;
            height: 100px; /* Set the height of the banner */
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #343a40; 
        }
        .banner img {
            max-height: 100%;
            width: auto;
            display: block;
        }
        .user-info {
            color: #adb5bd;
            margin-left: auto;
            display: flex;
            align-items: center;
        }
        .user-info span {
            margin-right: 20px;
            font-weight: 500;
        }
    </style>
</head>
<body>
	<%@ include file="menu.jsp"%>
    <div class="main_image">
        <div class="content">
            <a href="./makePic.jsp" class="image-container">
                <img src="../resources/images/createImg.jpg" alt="Create">
                <div class="overlay">이미지생성</div>
            </a>
            <a href="./showImage.jsp" class="image-container">
                <img src="../resources/images/checkLog.jpeg" alt="CheckLog">
                <div class="overlay">과거이미지확인</div>
            </a>
        </div>
    </div>
</body>
</html>
