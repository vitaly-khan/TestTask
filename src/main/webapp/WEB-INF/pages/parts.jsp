<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
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
<c:if test="${fullList.size() != listAll.size()}">
    <a href="<c:url value='/redirect'/>">Back</a>
</c:if>

<br/>
<br/>

<h1>Parts List</h1>
<c:if test="${!empty listParts}">
    <table class="tg">
        <tr>
            <th width="80">Name</th>
            <th width="120">Necessary</th>
            <th width="120">Quantity</th>
                <th width="60">Edit item</th>
            <th width="60">Remove item</th>
        </tr>
        <c:forEach items="${listParts}" var="part">
            <tr>
                <td>${part.name}</td>
                <td><c:choose>
                    <c:when test="${part.needed !=1}">No</c:when>
                    <c:otherwise>Yes</c:otherwise>
                </c:choose>
                </td>
                <td>${part.quantity}</td>
                    <td><a href="<c:url value='/edit/${part.id}'/>">Edit item</a></td>
                <td><a href="<c:url value='/remove/${part.id}'/>">Remove item</a></td>
            </tr>
        </c:forEach>
    </table>

    <br/>
    <br/>

    <c:if test="${listParts.size() < listAll.size()}">
        <table>
            <tr>
                <td><a href="<c:url value='/previous'/>">Previous</a></td>
                <td width="60"></td>
                <td><a href="<c:url value='/next'/>">Next</a></td>
            </tr>
        </table>
    </c:if>

    <br/>

    <table class="tg">
        <tr>
            <td width="200">Computers can be assembled</td>
            <td width="30">${countComputers}</td>
        </tr>
    </table>

</c:if>

<br/>

<table>
    <tr>
        <td><a href="<c:url value='/parts/selectNeeded'/>">Necessary</a></td>
        &nbsp;&nbsp;&nbsp;
        <td><a href="<c:url value='/parts/selectNoNeeded'/>">Optional</a></td>
    </tr>
</table>

<br/>

<h1>Fill out fields for adding or editing</h1>

<c:url var="addAction" value="/parts/add"/>
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

                <input type="submit" value="<spring:message text="Add/Edit"/>"/>
            </td>
        </tr>
    </table>
</form:form>

<h1>Search</h1>
<c:url var="searchAction" value="/parts/search"/>

<form:form action="${searchAction}" commandName="part">
    <table>
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
            <td colspan="2">

                <input type="submit" value="<spring:message text="Search"/>"/>

            </td>
        </tr>

    </table>
</form:form>

</body>
</html>