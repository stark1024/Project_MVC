<%-- 
    Document   : newjsp
    Created on : 7 Jun, 2017, 1:19:16 AM
    Author     : JARVIS
--%>

<%@page import="dao.manage"%>
<%@page import="dto.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String city = request.getParameter("city");
            student s = new student(id, name, city);
            manage m = new manage();
            int x = m.insertData(s);
            if(x==1){
        %>
                <h1>Hello World! Data has been entered.</h1>
        <%
            } else{    
        %>
        <h1><% out.println(m.getException(s).getMessage()); %></h1>
        <%
            }
        %>
        <br><br>Want to add more records?<br>
        <form action="index.html">
            <input type="submit" value="BACK" />
        </form>
        <br>What's there now?<br>
        <form action="showjsp.jsp">
            <input type="submit" value="SHOW DATA" />
        </form>
    </body>
</html>
