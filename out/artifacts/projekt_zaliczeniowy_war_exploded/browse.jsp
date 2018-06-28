<%@ page import="java.util.List" %>
<%@ page import="Others.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Przegląd filmów</title>
    <style>
        table {
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        th {
            cursor: pointer;
        }

        th, td {
            text-align: left;
            padding: 16px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2
        }
    </style>
</head>
<body>

<%
    Object listaIndeksów = request.getAttribute("ids");
    List<Integer> ids = (List<Integer>) listaIndeksów;

    Object listaTytulow = request.getAttribute("titles");
    List<String> titles = (List<String>) listaTytulow;

    Object listaRezyserow = request.getAttribute("directors");
    List<String> directors = (List<String>) listaRezyserow;

    Object listaURL = request.getAttribute("urls");
    List<String> urls = (List<String>) listaURL;

    Object listaLat = request.getAttribute("years");
    List<String> years = (List<String>) listaLat;
%>
<div style="text-align: center;">
<p><strong>Kliknij nagłówek kolumny tabeli, by posortować.</strong></p>
<p>Kliknięcie po raz pierwszy - sortowanie rosnąco.</p>
<p>Kliknięcie po raz drugi - sortowanie malejąco.</p>
</div>
<table id="table">
    <thead>
    <tr>
        <th onclick="sortTable(0)" scope="col">ID</th>
        <th onclick="sortTable(1)" scope="col">Title</th>
        <th onclick="sortTable(2)" scope="col">Director</th>
        <th onclick="sortTable(3)" scope="col">URL</th>
        <th onclick="sortTable(4)" scope="col">Year</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (int i = 0; i< titles.size(); i++){
    %>
    <tr>
        <td><%=ids.get(i)%></td> <td><%=titles.get(i)%></td> <td><%=directors.get(i)%></td><td><%=urls.get(i)%></td><td><%=years.get(i)%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<script>
    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("table");
        switching = true;
        //Set the sorting direction to ascending:
        dir = "asc";
        /*Make a loop that will continue until
        no switching has been done:*/
        while (switching) {
            //start by saying: no switching is done:
            switching = false;
            rows = table.getElementsByTagName("TR");
            /*Loop through all table rows (except the
            first, which contains table headers):*/
            for (i = 1; i < (rows.length - 1); i++) {
                //start by saying there should be no switching:
                shouldSwitch = false;
                /*Get the two elements you want to compare,
                one from current row and one from the next:*/
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                /*check if the two rows should switch place,
                based on the direction, asc or desc:*/
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        //if so, mark as a switch and break the loop:
                        shouldSwitch= true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        //if so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                /*If a switch has been marked, make the switch
                and mark that a switch has been done:*/
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                //Each time a switch is done, increase this count by 1:
                switchcount ++;
            } else {
                /*If no switching has been done AND the direction is "asc",
                set the direction to "desc" and run the while loop again.*/
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }
</script>
<div style="text-align: center;"><form method="post" action="/index.jsp">
    <input type="submit" value="← Wróć do strony głównej">
</form></div>

</body>
</html>
