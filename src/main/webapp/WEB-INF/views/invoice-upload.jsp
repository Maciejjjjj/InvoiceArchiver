<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
            integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
            integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.min.js" crossorigin="anonymous"></script>
    <title>Upload invoice</title>
</head>
<body>
<jsp:include page="fragments/main-menu.jsp"/>
<div class="container">

<div class="container">
    <div class="row" style="margin-top: 40px">
        <div class="col-1"></div>
        <div class="col-10" style="padding-bottom: 20px">
            <div class="upload-header">
                <h2>Upload invoice</h2>
            </div>
        </div>
        <div class="col-1"></div>
    </div>
    <div class="row" style="margin-top: 40px">
        <div class="col-1"></div>
        <div class="col-6" style="padding-bottom: 20px">
            <div class="upload-container">
                <div class="upload-content">
                    <div class="single-upload">
                        Add invoice to upload
                        <form method="post" action="/upload" enctype="multipart/form-data" name="singleUploadForm">
                            <div class="custom-file">
                                <label class="custom-file-label" for="file">Choose file</label>
                                <input id="file" type="file" name="file" required class="custom-file-input"/>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <sec:csrfInput/>
                            <div class="upload-response">
                                <div id="singleFileUploadError"></div>
                                <div id="singleFileUploadSuccess"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-5"></div>
    </div>
</div>
<script>
    bsCustomFileInput.init()
</script>
    <footer class="fixed-bottom" style="position: absolute;
            height: 100px;
            bottom: 10px;
            width: 100%;">
        <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
    </footer>

</body>
</html>