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
            <div class="col-6"><h2>Welcome to "Invoice archiver"</h2></div>
            <div class="col-5"></div>
        </div>


        <form class="form-inline mr-2 mt-3" method="get" action="/add-invoice">
            <button class="btn btn-outline-primary" type="submit">Add Invoice</button>
                                <sec:csrfInput/>
                            </form>
        <form class="form-inline mr-2 mt-3" method="get" action="/add-invoice">
            <button class="btn btn-outline-primary" type="submit">Show all your Invoices</button>
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