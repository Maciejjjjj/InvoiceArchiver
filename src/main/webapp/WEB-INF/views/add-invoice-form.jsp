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


<div class="container">
    <div class="row" style="margin-top: 40px">
        <div class="col-1"></div>
        <div class="col-6" style="padding-bottom: 20px"><h2>Add invoice</h2></div>
        <div class="col-1"></div>
    </div>
    <div class="row">
        <div class="col-1"></div>
        <div class="col-6">
            <form method="post" action="/add-invoice">
                <div class="form-group">
                    <label for="nip">NIP</label>
                    <input type="text" required name="nip" id="nip" class="form-control" placeholder="enter NIP"
                    value="${addInvoiceRequest.nip}"/>
                </div>
                <div class="form-group">
                    <label for="invoiceNumber">Invoice number</label>
                    <input type="text" required name="invoiceNumber" id="invoiceNumber" class="form-control" placeholder="Enter invoice number"
                    value="${addInvoiceRequest.invoiceNumber}"/>
                </div>
                <div class="form-group">
                    <label for="dateOfIssue">Date of issue</label>
                    <input type="date" required name="dateOfIssue" id="dateOfIssue" class="form-control"
                    value="${addInvoiceRequest.dateOfIssue}"/>
                </div>
                <div class="form-group">
                    <label for="savedFileId"></label>
                    <input type="hidden" value="${savedFileId}" required name="savedFileId" id="savedFileId" class="form-control" />
                </div>
                <button class="btn btn-primary" type="submit">Add</button>
                <button class="btn btn-secondary" type="reset">Reset</button>
                <sec:csrfInput/>
            </form>
        </div>
        <div class="col-5"></div>
    </div>
</div>
<footer class="footer">
    <jsp:include page="/WEB-INF/views/fragments/foooter.jsp"/>
</footer>
</body>
</html>