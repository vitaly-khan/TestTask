<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Parts list</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #cc6641;
        }

        .tg td {
            font-family: Comic Sans MS, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #cc49c0;
            color: #f8ff34;
            background-color: #dd435e;
        }

        .tg th {
            font-family: Comic Sans MS, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #4bcc00;
            color: #f8ff34;
            background-color: #c33f5a;
        }

        .tg .tg-4eph {
            background-color: #bcdd9d
        }
    </style>
</head>
<body>
<a href="<c:url value='/redirect'/>">Back</a>
<h1>Search result</h1>

<table class="tg">
    <tr>
        <th width="80">Name</th>
        <th width="120">Necessary</th>
        <th width="120">Quantity</th>
        <th width="60">Remove item</th>
    </tr>

    <tr>
        <td>${part.name}</td>
        <td><c:choose>
            <c:when test="${part.needed !=1}">No</c:when>
            <c:otherwise>Yes</c:otherwise>
        </c:choose>
        </td>
        <td>${part.quantity}</td>
        <td><a href="<c:url value='/remove/${part.id}'/>">Remove</a></td>
    </tr>
</table>
<%----%>
<%----%>
<%----%>
<%----%>
<%----%>
<%----%>
<c:url var="addAction" value="/parts/update"/>
<form:form action="${addAction}" commandName="part">
    <table>
        <c:if test="${!empty part.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="needed">
                    <spring:message text="Necessary"/>
                </form:label>
            </td>
            <td>
                <form:input path="needed"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="quantity">
                    <spring:message text="Quantity"/>
                </form:label>
            </td>
            <td>
                <form:input path="quantity"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">

                <input type="submit" value="<spring:message text="Change"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>