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

    <link rel="stylesheet" href="/webjars/bootstrap/4.1.1/css/bootstrap.css">
    <script src="/webjars/jquery/3.3.1-1/jquery.js"></script>
    <script src="/webjars/bootstrap/4.1.1/js/bootstrap.js"></script>
    <script src="/webjars/popper.js/1.14.1/umd/popper.js"></script>
</head>
<body>

<div class="container">

    <sec:authorize access="isAuthenticated()">
        <div class="row" style="margin-top: 40px; margin-bottom: 10px">
            <div class="col-1"></div>
            <div class="col-6"><h2>Pokaż fakturę</h2></div>
            <div class="col-5"></div>
        </div>

        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <form method="post" action="/show-all-invoices">
                    <div class="form-group">
                        <label for="title">Tytuł faktury:</label>
                        <input type="text" required name="title" id="title" class="form-control"
                               placeholder="Podaj tytuł ogłoszenia"/>
                    </div>
                    <div class="form-group">
                        <label for="description">Opis faktury</label>
                        <textarea name="description" id="description"
                                  class="form-control"
                                  placeholder="Uzupełnij opis ogłoszenia"></textarea>
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
        <div class="col-6"><h2>Lista ogłoszeń</h2></div>
        <div class="col-5"></div>
    </div>

    <div class="row">
        <div class="col-12" style="padding-bottom: 20px">
            <table>
                <tr>
                    <th>Lp.</th>
                    <th>NIP</th>
                    <th>Invoice number</th>
                    <th>Data dodania</th>
                </tr>
                <c:forEach items="${invoices}" var="invoice" varStatus="stat">
                    <tr>
                        <td>${stat.count}</td>
                        <td><b>${invoices.title}</b></td>
                        <td>${invoices.description}</td>
                        <td>${invoices.user.username}</td>
                        <td>${invoices.posted}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</div>
</body>
</html>