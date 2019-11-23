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

<<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>List of invoices</title>
    <link href="<c:url value='/resources/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/resources/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of invoices </span></div>
        <div class="tablecontainer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>No.</th>
                    <th>NIP</th>
                    <th>Invoice number</th>
                    <th>Date of issue</th>
                    <th>User</th>
                    <th>File</th>
                </tr>
                <thead>
                <tbody>
                <c:forEach items="${invoicesAll}" var="invoices" varStatus="stat">
                    <tr>
                        <td>${stat.count}</td>
                        <td><b>${invoices.nip}</b></td>
                        <td>${invoices.invoiceNumber}</td>
                        <td>${invoices.dateOfIssue}</td>
                        <td>${invoices.user.login}</td>
                        <td>${invoices.file.fileName}</td>
                        <td><a href="<c:url value='/download-document-${user.id}-${doc.id}' />" class="btn btn-success custom-width">download</a></td>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</body>
</html>