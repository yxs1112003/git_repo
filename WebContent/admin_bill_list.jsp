<%-- <%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.entity.User"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
	<div class="menu">
		<form method="post" action="QueryAdminServlet">
			商品名称：<input type="text" name="productName" class="input-text"
				value="${productName}" />&nbsp;&nbsp;&nbsp;&nbsp; 是否付款：
			<!--<select
				name="havePay">
				<option value="">请选择</option>
				<option value="1">已付款</option>
				<option value="0">未付款</option>
				</select>
				  -->
			<select name="havePay">
				<option value="">-请选择-</option>
				<option value="0" <c:if test="${'0' eq havePay}">selected</c:if>>未付款</option>
				<option value="1" <c:if test="${'1' eq havePay}">selected</c:if>>已付款</option>
			</select> &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="submit"
				value="组合查询" class="button" />
		</form>
	</div>
	<div class="main">
		<div class="optitle clearfix">
			<em><input type="button" name="button" value="添加数据"
				class="input-button" onclick="location.href='modify.jsp'" /></em>
			<div class="title">用户管理&gt;&gt;</div>
		</div>
		<div class="content">
			<table class="list">
				<tr>
					<td>身份证号</td>
					<td>姓名</td>
					<td>姓名拼音</td>
					<td>性别</td>
					<td>出生日期</td>
					<td>政治面貌</td>
					<td>电话</td>
					<td>工作</td>
					<td>籍贯</td>
					<td>家庭住址</td>
					<td>工作地址</td>
					<td>与户主关系</td>
				</tr>
				<c:forEach var="bill" items="${billList}">
					<tr>
						<td><c:out value="${bill.billId}"></c:out></td>
						<td><c:out value="${bill.commodityName}"></c:out></td>
						<td><c:out value="${bill.commodityQuantity}"></c:out></td>
						<td><c:out value="${bill.commodityUnit}"></c:out></td>
						<td><c:out value="${bill.sumPrice}"></c:out></td>
						<td><c:out value="${bill.havePay}"></c:out></td>
						<td><c:out value="${bill.providerId}"></c:out></td>
						<td><c:out value="${bill.commodityDesc}"></c:out></td>
						<td><a
							href='ProviderInitServlet?billId=${bill.billId}&commodityName=${bill.commodityName}&commodityQuantity=${bill.commodityQuantity}&commodityUnit=${bill.commodityUnit}&sumPrice=${bill.sumPrice}&havePay=${bill.havePay}&providerId=${bill.providerId}&commodityDesc=${bill.commodityDesc}
							'>修改</a>
							<a href='DeleteAdminServlet?billId=${bill.billId}'>删除</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div>
		<!-- 
		<c:forEach var="i" begin="1" end="${pageCount}">
			<c:out value="<a href=QueryAdminServlet?pageNow=${i}>[${i}]</a>"></c:out>
		</c:forEach>
	 -->

		<c:forEach var="pageNow" begin="1" end="${pageCount}">
			<c:if
				test="${fn:length(productName) == 0 && fn:length(havePay) == 0 }">
				<a
					href="<c:out value="QueryAdminServlet?pageNow=${pageNow}"></c:out>">[${pageNow}]</a>
			</c:if>
			<c:if
				test="${fn:length(productName) != 0 && fn:length(havePay) == 0 }">
				<a
					href="<c:out value="QueryAdminServlet?pageNow=${pageNow}&productName=${productName}"></c:out>">[${pageNow}]</a>
			</c:if>
			<c:if
				test="${fn:length(productName) == 0 && fn:length(havePay) != 0 }">
				<a
					href="<c:out value="QueryAdminServlet?pageNow=${pageNow}&havePay=${havePay}"></c:out>">[${pageNow}]</a>
			</c:if>
			<c:if
				test="${fn:length(productName) != 0 && fn:length(havePay) != 0 }">
				<a
					href="<c:out value="QueryAdminServlet?pageNow=${pageNow}&productName=${productName}&havePay=${havePay}"></c:out>">[${pageNow}]</a>
			</c:if>
		</c:forEach>

	</div>
</body>
</html>
