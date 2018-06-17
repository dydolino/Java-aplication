<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Win8
  Date: 2018-06-15
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Browse</title>
</head>
<body>

<%
    Object listaP = request.getAttribute("titles");
    List<String> titles = (List<String>) listaP;
%>



<table style="margin: 0px auto;">
    <thead>
    <tr>
        <th scope="col">L.P.</th>
        <th scope="col">Tytul</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">1</th>
        <td><%=titles.get(0)%>
        </td>
        </td>
    </tr>

    <tr>

        <%
            if (titles.size() > 1) {
                out.println("<th scope=\"row\">" + 2 + "</th>");
                out.println("<td>" + titles.get(1) + "</td>");
            }
            ;
        %>

    </tr>
    <tr>
        <%
            if (titles.size() > 2) {
                out.println("<th scope=\"row\">" + 3 + "</th>");
                out.println("<td>" + titles.get(2) + "</td>");
            }
            ;
        %>
    </tr>
    <tr>
        <%
            if (titles.size() > 3) {
                out.println("<th scope=\"row\">" + 4 + "</th>");
                out.println("<td>" + titles.get(3) + "</td>");

            }
            ;
        %>
    </tr>
    </tbody>
</table>


<div style="text-align: center;"><a href="/index.jsp" style="color: #cc1111">Powrót</a></div>
</body>
</html>
