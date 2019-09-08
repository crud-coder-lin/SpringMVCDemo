<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	//页面加载完成之后
	$(function(){
		//给删除的超链接注册一个单击事件	 
		$(".delHref").click(function(){
			
			//提示用户是否删除
			if(!confirm("您确定要删除这条记录吗?")){
				return false;
			}
			
			//获取超链接中href属性的值
			var hrefValue = $(this).attr("href");
			//将href属性的值赋值给form表单的action属性
			$("#delForm").attr("action",hrefValue);
			//提交form表单
			$("#delForm").submit();
			//终止超链接的执行
			return false;
		});
	});
	
</script>
</head>
<body>
	<h1 align="center">员工列表</h1>
	<table border="1" align="center" width="70%">
		<tr>
			<th>ID</th>
			<th>LastName</th>
			<th>Email</th>
			<th>Gender</th>
			<th>DepartmentName</th>
			<th>Operation</th>
		</tr>
		<c:forEach items="${emps}" var="emp">
			<tr align="center">
				<td>${emp.id }</td>
				<td>${emp.lastName }</td>
				<td>${emp.email }</td>
				<td>${emp.gender == 1?"男":"女" }</td>
				<td>${emp.department.departmentName }</td>
				<td>
					<a href="${pageContext.request.contextPath }/emp/${emp.id }">Edit</a>
					<a class="delHref" href="${pageContext.request.contextPath }/emp/${emp.id }">Delete</a>
				</td>
			</tr>		
		</c:forEach>
	</table>
	<form id="delForm" action="" method="post">
		<input type="hidden" name="_method" value="delete">
	</form>
	
	<h2 align="center">
		<a href="${pageContext.request.contextPath }/emp">添加员工</a>
	</h2>
</body>
</html>