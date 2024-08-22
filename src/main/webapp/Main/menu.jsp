<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <title>menuBar</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }

        .header {
            width: 100%;
            height: 60px; /* Fixed height for the header */
            position: fixed;
            top: 0;
            z-index: 1000;
            background-color: #343a40;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center; /* Vertically center the content */
            padding: 0 20px; /* Add horizontal padding */
        }

        .nav-link {
            color: #adb5bd;
            font-weight: 500;
            padding: 5px 10px; /* Adjusted padding */
            font-size: 0.9rem; /* Reduced font size */
            font-family: "Noto Sans KR", sans-serif;
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
            font-size: 1.2rem; /* Reduced font size */
            font-weight: bold;
            text-decoration: none;
            margin: 0; /* Removed margin */
            display: flex;
            align-items: center; /* Vertically center the logo content */
        }

        .user-info {
            color: #adb5bd;
            margin-left: auto;
            display: flex;
            align-items: center;
            font-size: 0.9rem; /* Reduced font size */
            font-family: "Noto Sans KR", sans-serif;
        }

        .user-info span {
            margin-right: 10px; /* Reduced margin */
            font-weight: 500;
            font-family: "Noto Sans KR", sans-serif;
        }

        .logout-button {
            padding: 5px 10px; /* Adjusted padding */
            font-size: 0.9rem; /* Reduced font size */
        }

        .content-container {
            margin-top: 80px; /* Adjusted margin to make room for the fixed header */
            display: flex;
            justify-content: space-around; /* Center the ladder game horizontally */
            align-items: flex-start; /* Center the ladder game vertically */
            height: calc(100vh - 140px); /* Full height minus header and timer */
        }
    </style>
</head>
<body>
<header class="pb-3 mb-4 border-bottom header">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="<c:url value='/main.jsp' />" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-decoration-none logo">
                <svg width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                    <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
                    <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
                </svg>
                <span class="fs-4 ms-2">Home</span>
            </a>
            
            <ul class="nav nav-pills">
                <li class="nav-item"><a href="./main.jsp" class="nav-link">메인</a></li>
                <li class="nav-item"><a href="<c:url value='/checkLog.jsp' />" class="nav-link">로그확인</a></li>
            </ul>
        </div>
    </div>
</header>
</body>
</html>
