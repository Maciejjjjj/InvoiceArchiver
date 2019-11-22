<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="/webjars/bootstrap/4.1.1/css/bootstrap.css">
    <script src="/webjars/jquery/3.3.1-1/jquery.js"></script>
    <script src="/webjars/bootstrap/4.1.1/js/bootstrap.js"></script>
    <script src="/webjars/popper.js/1.14.1/umd/popper.js"></script>
</head>
<body>
<jsp:include page="fragments/main-menu.jsp"></jsp:include>
<div class="container">

    <sec:authorize access="isAuthenticated()">
        <div class="row" style="margin-top: 40px; margin-bottom: 10px">
            <div class="col-1"></div>
            <div class="col-6"><h2>Dodaj ogłoszenie</h2></div>
            <div class="col-5"></div>
        </div>

        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="container">
                    <div class="row" style="margin-top: 40px">
                        <div class="col-1"></div>
                        <div class="col-10" style="padding-bottom: 20px"><h2>Log-in</h2></div>
                        <div class="col-1"></div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-6">
                            <c:if test="${param['error'] != null}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Wrong data!
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                            <form method="post" action="/login">
                                <div class="form-group">
                                    <label for="login">Username</label>
                                    <input type="text" required name="username" id="login" class="form-control" placeholder="Enter username"/>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" required name="password" id="password" class="form-control" placeholder="Enter password"/>
                                </div>
                                <button class="btn btn-primary" type="submit">Login</button>
                                <button class="btn btn-secondary" type="reset">Cancel</button>
                                <sec:csrfInput/>
                            </form>

                            <form method="post" action="/register">
                                <div class="form-group">
                                    <label for="login">Username</label>
                                    <input type="text" required name="login" id="login" class="form-control" placeholder="Enter username"/>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" required name="password" id="password" class="form-control" placeholder="Enter password"/>
                                </div>
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" required name="name" id="name" class="form-control" placeholder="Enter name"/>
                                </div>
                                <div class="form-group">
                                    <label for="surname">Surname</label>
                                    <input type="text" required name="surname" id="surname" class="form-control" placeholder="Enter surname"/>
                                </div>
                                <button class="btn btn-primary" type="submit">Register</button>
                                <button class="btn btn-secondary" type="reset">Cancel</button>
                                <sec:csrfInput/>
                            </form>
            </div>
            <div class="col-2"></div>
        </div>
    </sec:authorize>


        </div>
    </div>

</div>
</body>
</html>