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
    <script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.min.js"
            crossorigin="anonymous"></script>
    <title>Upload invoice</title>
</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 40px">
        <div class="col-1"></div>
        <div class="col-10" style="padding-bottom: 20px">
            <div class="upload-header">
                <h2> Upload invoice <span class="badge badge-secondary">New</span></h2>
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
                            <div class="form-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="validCheck" required>
                                    <label class="form-check-label" for="validCheck">
                                        Agree to terms and conditions
                                    </label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <sec:csrfInput/>
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

</body>
</html>