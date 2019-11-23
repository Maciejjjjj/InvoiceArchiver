<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Upload invoice</title>
</head>
<body>
<div class="upload-container">
    <div class="upload-header">
        <h2>Upload invoice</h2>
    </div>
    <div class="upload-content">
        <div class="single-upload">
            <h3>Add invoice to upload</h3>
            <form method="post" action="/upload" id="singleUploadForm" name="singleUploadForm">
                <input id="singleFileUploadInput" type="file" name="file" class="file-input" required />
                <button type="submit" class="primary submit-btn">Submit</button>
            </form>
            <div class="upload-response">
                <div id="singleFileUploadError"></div>
                <div id="singleFileUploadSuccess"></div>
            </div>
            <sec:csrfInput/>
        </div>
    </div>
</div>
</body>
</html>