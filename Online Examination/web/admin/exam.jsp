<%@page import="model.PaperModel"%>
<%@page import="model.ExamModel"%>
<%@page import="model.SubjectModel"%>
<%@page import="model.BatchModel"%>
<%@page import="model.RuleModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.ProctorModel"%>
<%
    String status = (String)session.getAttribute("loginstatusa");
    if (status==null) {

        response.sendRedirect("login.jsp");

    } else {
        String adminid = (String)session.getAttribute("aid");
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
       
            <div class="container-fluid py-4">


                <div class="row mb-4">
                    <div class="col-lg-8 col-md-6 mb-md-0 mb-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="card my-4">
                                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                        <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                                            <h6 class="text-white text-capitalize ps-3">Schedule Examination</h6>
                                        </div>
                                    </div>
                                    <div class="card-body px-0 pb-2">
                                        <div class="table-responsive p-2">
                                            <table class="align-items-center mb-0" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th class="text-uppercase text-center align-items-center text-xs font-weight-bolder opacity-7" style="width: 40%">Subject</th>
                                                        <th class="text-uppercase text-center align-items-center text-xs font-weight-bolder opacity-7" style="width: 40%">Date</th>
                                                        <th class="text-uppercase text-center text-secondary text-xs font-weight-bolder opacity-7" style="width: 20%">Setting</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                     <% 
                                            ExamModel a = new ExamModel();
                                            ResultSet rs = a.getAllExam();
                                            if (rs != null) {
                                                while(rs.next()) { 
                                        %>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex px-2 py-2">

                                                                <div class="d-flex flex-column justify-content-center">
                                                                    <p class="text-xs text-secondary mb-1"><b><%=rs.getString("name") %></b></p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex px-2 py-2">

                                                                <div class="d-flex flex-column justify-content-center">
                                                                    <p class="text-xs text-secondary mb-1"><b><%=rs.getString("datetime") %></b></p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="align-right text-center">
                                                            <a href="editexam.jsp?exid=<%=rs.getString("id") %>" class="btn btn-link text-dark userIpx-3 mb-0" data-toggle="tooltip" data-original-title="Edit Batch"><i class="material-icons text-sm me-2">edit</i>
                                                                Edit
                                                            </a>
                                                        </td>

                                                    </tr>
  <% 
                                                }}
                                                %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="card">
                            <div class="card-header pb-0">
                                <h6>Add New Examination</h6>

                            </div>
                            <div class="card-body p-0">
                                <div class="card-body">
                                    <form action="../addexam" method="post" role="form" class="text-start">
                                        <div class="input-group input-group-outline">
                                            <input type="text" name="adminid" style="display: none" value="<%=adminid %>" readonly>
                                            <input type="text" name="name" placeholder="Name" class="form-control" required>
                                        </div><br>
                                        <div class="input-group input-group-outline">
                                            <input type="datetime-local" name="date" placeholder="Date and Time" class="form-control" required>
                                        </div>
                                        <br>
                                        <div class="input-group input-group-outline">
                                            <input type="number" name="duration" placeholder="Duration (Min)" class="form-control" required>
                                        </div><br>
                                        <div class="input-group input-group-outline">
                                            <select id="bid" name="bid" class="form-control" required>
                                             <%
                                                        BatchModel ab = new BatchModel();
                                                        ResultSet rsm = ab.getAllBatch();
                                                        if (rsm != null) {
                                                            while (rsm.next()) {
                                                    %>
                                                <option value="<%=rsm.getString("id")%>"><%=rsm.getString("name")%></option>
                                            
                                            <%
                                            }}    
                                            %>
                                            </select>
                                        </div><br>
                                            <div class="input-group input-group-outline">
                                            <select id="bid" name="pid" class="form-control" required>
                                             <%
                                                        PaperModel abc = new PaperModel();
                                                        ResultSet rsma = abc.getAllPaper();
                                                        if (rsma != null) {
                                                            while (rsma.next()) {
                                                    %>
                                                <option value="<%=rsma.getString("id")%>"><%=rsma.getString("name")%></option>
                                            
                                            <%
                                            }}    
                                            %>
                                            </select>
                                        </div>
                                        <div class="text-center">
                                            <input type="Submit" class="btn bg-gradient-primary w-100 my-4 mb-2" value="Add">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="../assets/js/core/popper.min.js"></script>
            <script src="../assets/js/core/bootstrap.min.js"></script>
            <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
            <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
            <script src="../assets/js/plugins/chartjs.min.js"></script>

            <script src="../assets/js/material-dashboard.min.js?v=3.0.4"></script>
    </body>

</html>
<%
    }%>