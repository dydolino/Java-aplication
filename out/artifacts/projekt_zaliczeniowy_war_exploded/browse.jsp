<%@ page import="java.util.List" %>
<%@ page import="edu.Browse" %><%--
<%--
  Created by IntelliJ IDEA.
  User: Win8
  Date: 2018-06-15
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title style="text-align: center;">Potwierdzenie dodania filmu</title>
</head>
<body>

<%

//    Browse browse = new Browse();
//    browse.doPost();

    Object listaIndeksów = request.getAttribute("ids");
    List<String> ids = (List<String>) listaIndeksów;

    Object listaTytulow = request.getAttribute("titles");
    List<String> titles = (List<String>) listaTytulow;

    Object listaRezyserow = request.getAttribute("directors");
    List<String> directors = (List<String>) listaRezyserow;

    Object listaURL = request.getAttribute("urls");
    List<String> urls = (List<String>) listaURL;

    Object listaLat = request.getAttribute("years");
    List<String> years = (List<String>) listaLat;
%>



<table class="table">
    <thead>
    <div style="text-align: center;"> <form action="Rezerwacja?action=doPost" method="post">
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Tytuł</th>
        <th scope="col">Reżyser</th>
        <th scope="col">URL</th>
        <th scope="col">Rok</th>
    </tr>
    </div></thead>
    <tbody>
    <div style="text-align: center;">


        <tr>

            <%
                for(int i=0;i<titles.size();i++){
                    out.println("<tr>" + "<th scope=\"row\">" + (i+1) + "</th>" + "<td>" + ids.get(i) + "</td>" + "<td>" + titles.get(i) + "</td>" + "<td>" + directors.get(i) + "</td>" + "<td>" + urls.get(i) + "</td>" + "<td>" + years.get(i) + "</td>" + "</tr>");
                }
            %>

        </tr>

    </div></tbody>
</table>


<div style="text-align: center;"><a href="/index.jsp" style="color: #cc1111">← Wróć do strony głównej</a></div>
</body>
</html>
