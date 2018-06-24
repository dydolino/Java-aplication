<%--
  Created by IntelliJ IDEA.
  User: Win8
  Date: 2018-06-15
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title style="text-align: center;">Filmy</title>
</head>
<body>
<div style="text-align: center;"><h1>Wypożyczalnia filmów</h1></div>
<div style="text-align: center;"><a href="/add.jsp" style="color: #cc1111">Dodaj film do bazy</a></div>
<div style="text-align: center;"><form method="post" action="browse">
    <input type="submit" value="Przegladaj">
</form></div>
<div style="text-align: center;"><a href="/browse" style="color: #cc1111">Przeglądaj filmy</a></div>
</body>
</html>
