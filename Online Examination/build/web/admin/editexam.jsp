<%@page import="model.ExamModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.PaperModel"%>
<%@page import="model.BatchModel"%>
<%
    String status = (String) session.getAttribute("loginstatusa");
    if (status == null) {

        response.sendRedirect("login.jsp");

    } else {
        if (request.getParameter("exid") == null) {
            response.sendRedirect("exam.jsp");
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
        <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
   
            <div class="container-fluid py-4">


                <div class="row mb-4">
                    <div class="col-lg-3">

                    </div>
                    <div class="col-lg-6 col-md-6">
                        <a href="exam.jsp" style="color: #ffffff"><button type="button"  class="btn bg-gradient-dark w-100 my-4 mb-2">Back Dashboard</button></a>
                        <div class="card">
                            <div class="card-header pb-0">
                                <h6>Edit Exam</h6>

                            </div>
                            <div class="card-body p-0">
                                <div class="card-body">
                                    <form action="../updateexam" method="post" role="form" class="text-start">
                                        <%                        String id = request.getParameter("exid");
                                            ExamModel a = new ExamModel();
                                            ResultSet rs = a.dataExam(id);
                                            if (rs != null) {
                                                if (rs.next()) {
                                        %>
                                        <div class="input-group input-group-outline">
                                            <input type="text" class="form-control" name="id" value="<%=request.getParameter("exid")%>" style="display:none">
                                            <input type="text" class="form-control" placeholder="Subject" name="name" value="<%=rs.getString("name")%>">
                                        </div><br>
                                        <div class="input-group input-group-outline">
                                            <input type="datetime-local" name="date" placeholder="Date and Time" value="<%=rs.getString("datetime")%>" class="form-control" required>
                                        </div>
                                        <br>
                                        <div class="input-group input-group-outline">
                                            <input type="number" name="duration" placeholder="Duration (Min)" value="<%=rs.getString("duration")%>" class="form-control" required>
                                        </div><br>
                                        <div class="input-group input-group-outline">
                                            <select id="bid" name="bid" class="form-control" required>
                                                <%
                                                    BatchModel ab = new BatchModel();
                                                    ResultSet rsm = ab.getAllBatch();
                                                    String batchid = rs.getString("batch_id");
                                                    if (rsm != null) {
                                                        while (rsm.next()) {
                                                            String bbid = rsm.getString("id");

                                                            if (batchid.equals(bbid)) {%>
                                                            <option value="<%=rsm.getString("id")%>" selected><%=rsm.getString("name")%></option>
                                                <%  } else {

                                                %>
                                                <option value="<%=rsm.getString("id")%>"><%=rsm.getString("name")%></option>

                                                <%
                                                        }}
                                                    }
                                                %>
                                            </select>
                                        </div><br>
                                        <div class="input-group input-group-outline">
                                            <select id="bid" name="pid" class="form-control" required>
                                                <%
                                                    PaperModel abc = new PaperModel();
                                                    ResultSet rsma = abc.getAllPaper();
                                                    String paperid = rs.getString("paper_id");
                                                    if (rsma != null) {
                                                        while (rsma.next()) {
                                                            String ppid = rsma.getString("id");
                                                     if (paperid.equals(ppid)) {%>
                                                            <option value="<%=rsma.getString("id")%>" selected><%=rsma.getString("name")%></option>
                                                <%  } else {

                                                %>
                                                <option value="<%=rsma.getString("id")%>"><%=rsma.getString("name")%></option>

                                                <%
                                                        }}
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="text-center row">


                                            <div class="col-lg-12 col-md-12"><input type="submit" value="Edit" class="btn bg-gradient-primary w-100 my-4 mb-2"></div>
                                        </div>
                                        <%
                                                }
                                            }
                                        %>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <form action="../deleteexam" method="post" role="form" class="text-start">
                            <input type="text" class="form-control" name="id" value="<%=request.getParameter("exid")%>" style="display:none">
                            <div class="col-lg-12 col-md-12"><input type="submit" class="btn bg-gradient-danger w-100 my-3 mb-2" value="Delete Exam"></div>
                        </form>
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
<% }
    }%>