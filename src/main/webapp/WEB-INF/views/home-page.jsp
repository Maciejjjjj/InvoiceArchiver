<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <title>Invoice Archiver</title>


</head>
<body>
<jsp:include page="fragments/main-menu.jsp"/>


<div class="container">

    <sec:authorize access="isAuthenticated()">
        <div class="row" style="margin-top: 10px; margin-bottom: 10px">
            <div class="col-1"></div>
            <div class="col-5"><h2>Welcome to "Invoice Archiver"</h2></div>
            <div class="col-5"></div>
        </div>
        <p>"Archive your invoices using OCR"</p>

        <form class="form-inline mr-3 mt-3" method="get" action="/upload">
            <button class="btn btn-primary" type="submit">Add Invoice</button>
                                <sec:csrfInput/>
        </form>
        <form class="form-inline mr-3 mt-3" method="get" action="/show-all-invoices">
            <button class="btn btn-info" type="submit">Show all your Invoices</button>
            <sec:csrfInput/>
        </form>


            </div>

        </div>
    </sec:authorize>



        </div>
    </div>

</div>
<footer class="footer">
    <jsp:include page="/WEB-INF/views/fragments/foooter.jsp"/>
</footer>
</body>
</html>