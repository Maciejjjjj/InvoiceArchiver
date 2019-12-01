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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

</head>
<body>
<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead"><b>List of invoices</b></span></div>
        <div class="tablecontainer">
            <table class="table table-striped">
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
                <c:forEach items="${invoicesAll}" var="invoice" varStatus="stat">
                    <tr>
                        <td>${stat.count}</td>
                        <td><b>${invoice.nip}</b></td>
                        <td>${invoice.invoiceNumber}</td>
                        <td>${invoice.dateOfIssue}</td>
                        <td>${invoice.user.login}</td>
                        <td>${invoice.file.fileName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${invoice.file != null}"><a
                                        href="<c:url value='/download-document-${invoice.user.id}-${invoice.file.id}' />"
                                        class="btn btn-success custom-width">download</a></c:when>
                                <c:otherwise>No file to download</c:otherwise>
                            </c:choose>
                        </td>
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