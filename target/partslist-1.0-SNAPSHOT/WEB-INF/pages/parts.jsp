<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="<c:url value="/res/style.css"/>" rel="stylesheet" type="text/css"/>
    <link rel="icon" type="image/png" href="<c:url value="/res/favicon.ico"/>" />
    <title>Parts list</title>
</head>
<body>
<table class="style">
    <caption class="heading">Parts list</caption>
    <caption class="filter">
        <form action="<c:url value="/"/>">
            <input type="hidden" name="page" value="${page}">
            <input type="hidden" name="required" value="${required}">
            <input type="search" name="search" placeholder="Title" value="${search}" maxlength="100" title="Search by title">
            <input type="submit" value="" title="Click to search"><span class="icon icon-find"></span>
        </form>
        <div>
            <span class="sign">Filter:&emsp;</span>
            <c:set value="selected" var="selected"/>
            <c:set value="" var="unselected"/>
            <c:url value="/" var="url">
                <c:param name="page" value="${page}"/>
                <c:if test="${!empty search}">
                    <c:param name="search" value="${search}"/>
                </c:if>
            </c:url>
            <a class="${empty required ? selected : unselected}" href="${url}" title="All parts">
                <span class="icon icon-all"></span>
            </a>
            <c:url value="/" var="url">
                <c:param name="page" value="1"/>
                <c:param name="required" value="true"/>
                <c:if test="${!empty search}">
                    <c:param name="search" value="${search}"/>
                </c:if>
            </c:url>
            <a class="${required == true ? selected : unselected}" href="${url}" title="Only required parts">
                <span class="icon icon-required"></span>
            </a>
            <c:url value="/" var="url">
                <c:param name="page" value="1"/>
                <c:param name="required" value="false"/>
                <c:if test="${!empty search}">
                    <c:param name="search" value="${search}"/>
                </c:if>
            </c:url>
            <a class="${required == false ? selected : unselected}" href="${url}" title="Only optional parts">
                <span class="icon icon-optional"></span>
            </a>
        </div>
    </caption>
    <tr>
        <th class="left-side">№</th>
        <th style="width: 100%">Title</th>
        <th>Required</th>
        <th>Quantity</th>
        <th colspan="2" class="right-side">Action</th>
    </tr>
    <c:if test="${partsCount > 0}">
        <c:forEach var="part" items="${parts}" varStatus="i">
            <tr>
                <td class="left-side">${i.index + 1 + (page - 1) * 10}</td>
                <td class="title">${part.title}</td>
                <td>
                    <c:if test="${part.required == true}">
                        <span class="icon icon-required" title="required part"></span>
                    </c:if>
                </td>
                <c:set value="null-quantity" var="zero"/>
                <c:set value="" var="quantity"/>
                <td class="${part.quantity == 0 ? zero : quantity}">${part.quantity}</td>
                <td>
                    <a href="/edit/${part.id}" title="Edit this part">
                        <span class="icon icon-edit"></span>
                    </a>
                </td>
                <td class="right-side">
                    <a href="/delete/${part.id}" title="Delete this part">
                        <span class="icon icon-delete"></span>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${partsCount == 0}">
        <tr>
            <td colspan="7" style="font-size: 150%" class="left-side right-side">
                <c:if test="${allPartsCount == 0}">
                    the list is empty but you can add a new part
                </c:if>
                <c:if test="${allPartsCount != 0}">
                    No data found for such parameters
                </c:if>
            </td>
        </tr>
    </c:if>
    <tr>
        <td colspan="7" class="left-side link right-side">
            <a style="margin-right: 70px; font-size: 100%" href="<c:url value="/add"/>" title="click to add a new part">
                <span class="icon icon-add"></span>Add new part
            </a>
            <c:if test="${pagesCount > 1}">
                <c:set value="disabled" var="disabled"/>
                <c:set value="" var="active"/>
                <c:url value="/" var="url">
                    <c:param name="page" value="1"/>
                    <c:if test="${!empty required}">
                        <c:param name="required" value="${required}"/>
                    </c:if>
                    <c:if test="${!empty search}">
                        <c:param name="search" value="${search}"/>
                    </c:if>
                </c:url>
                <a class="${page == 1 ? disabled : active}" href="${url}">
                    &nbsp<span class="icon icon-first"></span>&nbsp
                </a>
                <c:url value="/" var="url">
                    <c:param name="page" value="${page - 1}"/>
                    <c:if test="${!empty required}">
                        <c:param name="required" value="${required}"/>
                    </c:if>
                    <c:if test="${!empty search}">
                        <c:param name="search" value="${search}"/>
                    </c:if>
                </c:url>
                <a class="${page == 1 ? disabled : active}" href="${url}">
                    &nbsp<span class="icon icon-prev"></span>&nbsp
                </a>
                <c:forEach begin="1" end="${pagesCount}" step="1" varStatus="i">
                    <c:url value="/" var="url">
                        <c:param name="page" value="${i.index}"/>
                        <c:if test="${!empty required}">
                            <c:param name="required" value="${required}"/>
                        </c:if>
                        <c:if test="${!empty search}">
                            <c:param name="search" value="${search}"/>
                        </c:if>
                    </c:url>
                    <c:set value="current-page" var="current"/>
                    <c:set value="" var="perspective"/>
                    <a class="${page == i.index ? current : perspective}" href="${url}">${i.index}</a>
                </c:forEach>
                <c:url value="/" var="url">
                    <c:param name="page" value="${page + 1}"/>
                    <c:if test="${!empty required}">
                        <c:param name="required" value="${required}"/>
                    </c:if>
                    <c:if test="${!empty search}">
                        <c:param name="search" value="${search}"/>
                    </c:if>
                </c:url>
                <a class="${page == pagesCount ? disabled : active}" href="${url}">
                    &nbsp<span class="icon icon-next"></span>&nbsp
                </a>
                <c:url value="/" var="url">
                    <c:param name="page" value="${pagesCount}"/>
                    <c:if test="${!empty required}">
                        <c:param name="required" value="${required}"/>
                    </c:if>
                    <c:if test="${!empty search}">
                        <c:param name="search" value="${search}"/>
                    </c:if>
                </c:url>
                <a class="${page == pagesCount ? disabled : active}" href="${url}">
                    &nbsp<span class="icon icon-last"></span>&nbsp
                </a>
            </c:if>
            <span style="margin-left: 70px; font-size: 120%"> ${partsCount} Found</span>
        </td>
    </tr>
    <caption class="sign" align="bottom">
        <span style="float: left; margin-left: 30px;">Computers it is possible to collect: ${computersCount}</span>
        <span style="float: right; margin-right: 30px;">Details total: ${allPartsCount}</span>
    </caption>
</table>
</body>
</html>