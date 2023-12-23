<%@page import="model.PaperModel"%>
<%@page import="model.CustomModel"%>
<%@page import="model.RuleModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.ProctorModel"%>
<%
    String status = (String) session.getAttribute("loginstatuse");
    if (status == null) {

        response.sendRedirect("login.jsp");

    } else {
        if(request.getParameter("sid")==null){
        response.sendRedirect("dashboard.jsp");
    }else{
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
        <title>
            Online Examination System
        </title>
     
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
     
        <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
       
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">

        <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.0.4" rel="stylesheet" />
    </head>

    <body class="g-sidenav-show  bg-gray-200">
        <jsp:include page="slider.jsp"/>
        <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
          
            <div class="container-fluid py-5">
                <a href="dashboard.jsp" style="color: #ffffff"><button class="btn bg-gradient-dark w-100  mb-2">Back Dashboard</button></a>
                <a href="addnewpaper.jsp?sid=<%=request.getParameter("sid") %>" style="color: #ffffff"><button class="btn bg-gradient-primary w-100  mb-2">Add New Paper</button></a>
                            
                <div class="row">
                    <% 
                                            String id = request.getParameter("sid");
                                            PaperModel c = new PaperModel();
                                            ResultSet rs = c.PaperData(id);
                                            if (rs != null) {
                                                while(rs.next()) { 
                                        %>
                    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4 py-3">
                        <div class="card">
                            <div class="card-header p-3 pt-2">
                                
                                <div class="text-end pt-1">
                                    
                                    <h4 class="mb-0"><%=rs.getString("name") %></h4>
                                    <p class="text-sm mb-0 text-capitalize">Question Count: <b><%=rs.getString("qcount") %></b></p>
                                </div>
                            </div>
                            <hr class="dark horizontal my-0">
                            <div class="card-footer p-3">
                                <a href="editpaper.jsp?pid=<%=rs.getString("id") %>&pname=<%=rs.getString("name") %>&pcount=<%=rs.getString("qcount") %>&sid=<%=request.getParameter("sid") %>" style="color: #ffffff"><button class="btn bg-gradient-secondary w-100  mb-2">Edit Paper Details</button></a>
                                <a href="qa.jsp?pid=<%=rs.getString("id") %>&sid=<%=request.getParameter("sid") %>" style="color: #ffffff"><button class="btn bg-gradient-info w-100  mb-2">Manage Q&A</button></a>
                            </div>
                        </div>
                    </div>
                                <% 
                                }}
                                %>
                    
                </div>
            </div>
        </main>

            <script src="../assets/js/core/popper.min.js"></script>
            <script src="../assets/js/core/bootstrap.min.js"></script>
            <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
            <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
            <script src="../assets/js/plugins/chartjs.min.js"></script>

            <script src="../assets/js/material-dashboard.min.js?v=3.0.4"></script>
    </body>

</html>
<%
    }}%>