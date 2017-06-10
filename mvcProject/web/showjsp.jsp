<%-- 
    Document   : showjsp
    Created on : 8 Jun, 2017, 10:12:55 PM
    Author     : JARVIS
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dto.student"%>
<%@page import="dao.manage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page: Show Data</title>
    </head>
    <body>
        <%
            try {
            ResultSet rs = new manage().showData();
        %>
            <h1>Hello World! Here is your data.</h1>
                <br>
                <table border="5" width="15" cellspacing="5" cellpadding="5">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>City</th>
                            <th colspan="2">Operations</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        while(rs.next()){
                                out.print("<tr>"
                            +"<td>"+rs.getInt("id")+"</td>"
                            +"<td>"+rs.getString("name")+"</td>"
                            +"<td>"+rs.getString("city")+"</td>"
                            +"<td><a href=\"upjsp.jsp?id="+rs.getInt("id")+"\">update</a></td>"
                            +"<td><a href=\"deljsp.jsp?id="+rs.getInt("id")+"\">delete</a></td>"
                        +"</tr>");
                            }
                        %>
                    </tbody>
                </table>
                <br><br>Want to add new data?<br>
            <form action="index.html">
                <input type="submit" value="Add More Data" />
            </form>
        <%
            } catch(Exception e){
        %>
        <h1><% out.println(e.getMessage()); %></h1>
        <%
            }
        %>
    </body>
</html>
