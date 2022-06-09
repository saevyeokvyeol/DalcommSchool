<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>달콤스쿨 :: 달콤함을 배우다</title>
		<style type="text/css">
			
		</style>
	</head>
	<body>
		<header>
			<tiles:insertAttribute name="header"/>
		</header>
		<section>
			<tiles:insertAttribute name="content"/>
		</section>
		<footer>
			<tiles:insertAttribute name="footer"/>
		</footer>
	</body>
</html>