<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 22.10.2019
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
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
</head>
<body>

<div class="container">

    <sec:authorize access="isAuthenticated()">
        <div class="row" style="margin-top: 40px; margin-bottom: 10px">
            <div class="col-1"></div>
            <div class="col-10" style="padding-bottom: 20px"><h2>List of invoices</h2></div>
            <div class="col-1"></div>
        </div>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-6">
                <form method="post" action="/show-all-invoices">
                    <div class="form-group">
                        <label for="nip">NIP</label>
                        <input type="text" required name="nip" id="nip" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="invoiceNumber">Invoice number</label>
                        <input type="text" required name="invoiceNumber" id="invoiceNumber" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="dateOfIssue">Date of issue</label>
                        <input type="date" required name="dateOfIssue" id="dateOfIssue" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="userId">User</label>
                        <input type="text" required name="userId" id="userId" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="fileId">File</label>
                        <input type="text" required name="fileId" id="fileId" class="form-control" />
                    </div>
                    <button class="btn btn-primary" type="submit">Dodaj</button>
                    <button class="btn btn-secondary" type="reset">Wyczyść dane</button>
                    <sec:csrfInput/>
                </form>
            </div>
            <div class="col-2"></div>
        </div>
    </sec:authorize>

    <div class="row" style="margin-top: 40px; margin-bottom: 10px">
        <div class="col-1"></div>
        <div class="col-6"><h2>List of invoices</h2></div>
        <div class="col-5"></div>
    </div>

    <div class="row">
        <div class="col-12" style="padding-bottom: 20px">
            <table>
                <tr>
                    <th>Lp.</th>
                    <th>NIP</th>
                    <th>Invoice number</th>
                    <th>Date of issue</th>
                    <th>User</th>
                    <th>File</th>
                </tr>
                <c:forEach items="${invoicesAll}" var="invoices" varStatus="stat">
                    <tr>
                        <td>${stat.count}</td>
                        <td><b>${invoices.nip}</b></td>
                        <td>${invoices.invoiceNumber}</td>
                        <td>${invoices.dateOfIssue}</td>
                        <td>${invoices.user.login}</td>
                        <td>${invoices.file.fileName}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</div>
</body>
</html>