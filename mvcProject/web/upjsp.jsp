<%-- 
    Document   : upjsp
    Created on : 9 Jun, 2017, 6:17:56 PM
    Author     : JARVIS
--%>

<%@page import="dto.student"%>
<%@page import="dao.manage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update JSP Page</title>
    </head>
    <body>
        <%-- <jsp:useBean id="obj" scope="request" class="dto.student" />
        <jsp:setProperty name="obj" property="*" /> --%>
        <%
            manage m = new manage();
            int id = Integer.parseInt(request.getParameter("id"));
            student s = m.getData(id);
        %>
        <form action="updatejsp.jsp">
            ID:   <input readonly type="text" name="id" value="<%=id%>" /><br>
            Name: <input type="text" name="name" value="<%=s.getName()%>" /><br>
            City: <input type="text" name="city" value="<%=s.getCity()%>" /><br>
            <input type="submit" value="Update" />
        </form>
            <%--   
        <script>
            alert("info updated");
            window.location="showjsp.jsp";
        </script>
            --%>
    </body>
</html>
