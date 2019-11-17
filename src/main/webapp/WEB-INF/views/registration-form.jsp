<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</head>
<body>

<div class="container">
    <div class="row" style="margin-top: 40px">
        <div class="col-1"></div>
        <div class="col-10" style="padding-bottom: 20px"><h2>Register</h2></div>
        <div class="col-1"></div>
    </div>
    <div class="row">
        <div class="col-1"></div>
        <div class="col-6">
            <form method="post" action="/register">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" required name="username" id="username" class="form-control" placeholder="Enter username"/>
                </div>
                <div class="form-group">
                    <label for="firstName">Name</label>
                    <input type="text" required name="firstName" id="firstName" class="form-control" placeholder="Enter name"/>
                </div>
                <div class="form-group">
                    <label for="lastName">Surname</label>
                    <input type="text" required name="lastName" id="lastName" class="form-control" placeholder="Enter surname"/>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" required name="password" id="password" class="form-control" placeholder="Enter password"/>
                </div>
                <button class="btn btn-primary" type="submit">Register</button>
                <button class="btn btn-secondary" type="reset">Cancel</button>
                <sec:csrfInput/>
            </form>
        </div>
        <div class="col-5"></div>
    </div>
</div>
</body>
</html>