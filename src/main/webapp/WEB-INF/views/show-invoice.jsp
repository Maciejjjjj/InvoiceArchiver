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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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