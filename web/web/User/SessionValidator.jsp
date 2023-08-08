<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("Uid") == null)
        {
            response.sendRedirect("../Guest/Login.jsp");
        }
    %>