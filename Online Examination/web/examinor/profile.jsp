<%@page import="model.ExaminorModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.ProctorModel"%>
<%@page import="common.proctordata"%>
<%
    String status = (String) session.getAttribute("loginstatuse");
    if (status == null) {

        response.sendRedirect("login.jsp");

    } else {
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
        <main class="main-content position-relative max-height-vh-100 h-50 border-radius-lg ">

            <div class="container-fluid px-2 px-md-4">
                <div class="page-header min-height-100 border-radius-xl mt-4">

                </div>
                <div class="card card-body mx-3 mx-md-4 mt-n6">

                    <div class="row">
                        <div class="col-12 col-xl-6">
                            <div class="card card-plain h-100">
                                <div class="card-header pb-0 p-3">
                                    <div class="row">
                                        <div class="col-md-8 d-flex align-items-center">
                                            <h6 class="mb-0">Profile Details</h6>
                                        </div>
                                        <div class="card-body  p-2">
                                            <form action="../examinorupdate" method="post" role="form" class="text-start">
                                        <% 
                                            String id = (String) session.getAttribute("eid");
                                            ExaminorModel a = new ExaminorModel();
                                            ResultSet rs = a.dataExaminor(id);
                                            if (rs != null) {
                                                if(rs.next()) { 
                                        %>
                                        
                                                <div class="input-group input-group-outline my-3">
                                                    <input type="text" name="id" value="<%=id %>" style="display:none">
                                                    <input type="text" class="form-control" name="name" placeholder="Name" value="<%=rs.getString("name") %>">
                                                </div>
                                                <div class="input-group input-group-outline my-3">
                                                    <input type="email" class="form-control" placeholder="Email" value="<%=rs.getString("email") %>" readonly>
                                                </div>
                                                <div class="input-group input-group-outline my-3">
                                                    <input type="tel" class="form-control" name="mobile" placeholder="mobile" value="<%=rs.getString("mobile") %>">
                                                </div>
                                                <div class="text-center">
                                                    <input type="Submit" class="btn bg-gradient-primary w-100 my-4 mb-2" value="Change" >
                                                </div>
                                            
                                                <% 
                                                }}
                                                %>
                                                </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-xl-6">
                            <div class="card card-plain h-100">
                                <div class="card-header pb-0 p-3">
                                    <div class="row">
                                        <div class="col-md-8 d-flex align-items-center">
                                            <h6 class="mb-0">Password Change</h6>
                                        </div>
                                        <div class="card-body  p-3">
                                            <form action="../examinorupdatepassword" method="post" role="form" class="text-start">
                                                <div class="input-group input-group-outline mb-3">
                                                    <input type="text" name="id" value="<%=id %>" style="display:none">
                                                    <input type="password" name="npassword" placeholder="New Password" class="form-control" required>
                                                </div>
                                                <div class="input-group input-group-outline mb-3">
                                                    <input type="password" name="cpassword" placeholder="Confirm New Password" class="form-control" required>
                                                </div>
                                                <div class="text-center">
                                                    <input type="Submit" class="btn bg-gradient-primary w-100 my-4 mb-2" value="Change Password" >
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
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
<% }%>