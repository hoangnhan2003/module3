<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/15/2022
  Time: 12:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
  <title>Simple Dictionary</title>

</head>
<body>
<h2>Vietnamese Dictionary</h2>
<form method="post" action="/TranslateApp_war_exploded/translate">
  <input type="text" name="txtSearch" placeholder="Enter your word: "/>
  <input type = "submit" id = "submit" value = "Search"/>
</form>
</body>
</html>
