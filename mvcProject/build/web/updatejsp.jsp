<%-- 
    Document   : updatejsp
    Created on : 10 Jun, 2017, 9:38:48 PM
    Author     : JARVIS
--%>

<%@page import="dto.student"%>
<%@page import="dao.manage"%>
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
            RequestDispatcher rd = request.getRequestDispatcher("/showjsp.jsp");
            manage m = new manage();
            student obj = new student(id, name, city);
            int x = m.updateData(obj);
            if(x==1){
                rd.forward(request, response);
            } else{
        %>
        <h1><% out.println("ERROR"); %></h1>
        <%
            }
        %>
    </body>
</html>
