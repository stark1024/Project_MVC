<%-- 
    Document   : deljsp
    Created on : 9 Jun, 2017, 6:02:14 PM
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
            RequestDispatcher rd = request.getRequestDispatcher("/showjsp.jsp");
            manage m = new manage();
            int x = m.deleteData(id);
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
