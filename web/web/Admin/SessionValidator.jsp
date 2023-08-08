<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("Aid") == null)
        {
            response.sendRedirect("../Guest/Login.jsp");
        }
    %>