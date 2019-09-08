<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工操作页面</title>
</head>
<body>
	<c:if test="${empty emp.id}" var="flag">
		<h1>添增员工</h1>
	</c:if>
	<c:if test="${!flag}">
		
		<h1>修改员工</h1>
	</c:if>
 	
	<form:form action="${pageContext.request.contextPath}/emp" method="post" modelAttribute="emp">
	   <!-- 修改时，需要两个隐藏域 -->
	    <c:if test="${!flag}">
	    	<form:hidden path="id" />
	    	<!-- 这里不能使用Spring的form标签，因为modelAttribute属性emp中没有_method属性 -->
	    	<%-- </form:hidden path="_method"/> --%>
	    	<input type="hidden" name="_method" value="put">
	    </c:if>
	    LastName:<form:input path="LastName"/><br><br>
	    Email:<form:input path="email"/><br><br>
		Gender:<form:radiobuttons path="gender" items="${genders}"/><br><br>
		Department:
			<form:select path="department.id" items="${depts}" itemValue="id" itemLabel="departmentName">
			</form:select>
		<input type="submit" value="提交">
	
	</form:form> 

	
	
	<h1>添增员工</h1>
	<form action="${pageContext.request.contextPath}/emp" method="post">	
		LastName:<input type="text" name="LastName"><br><br>
		Email:<input type="text" name="email"><br><br>
		Gender:<input type="radio" name="gender" value="1" checked="checked">男
				<input type="radio" name="gender" value="0">女<br><br>
		Department:
		<select name="department.id">
			<c:forEach items="${depts}" var="dept">
			<option value="${dept.id}">
				${dept.departmentName}
			</option>
			</c:forEach>
		</select>
		<input type="submit" value="提交">
	</form>

</body>
</html>