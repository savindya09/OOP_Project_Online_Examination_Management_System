<%@page import="java.sql.ResultSet"%>
<%@page import="model.QuestionModel"%>
<%
    String status = (String) session.getAttribute("loginstatuse");
    if (status == null) {

        response.sendRedirect("login.jsp");

    } else {
    if(request.getParameter("did")==null && request.getParameter("pid")==null){
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
   
    <div class="container-fluid py-4">
      
      
      <div class="row mb-4">
        <div class="col-lg-3">
          
        </div>
        <div class="col-lg-6 col-md-6">
            <a href="qa.jsp?pid=<%=request.getParameter("pid") %>&sid=<%=request.getParameter("sid") %>" style="color: #ffffff"><button type="button"  class="btn bg-gradient-dark w-100 my-4 mb-2">Back Paper</button></a>
          <div class="card">
            <div class="card-header pb-0">
              <h6>Edit Question</h6>
              
            </div>
            <div class="card-body p-0">
                <div class="card-body">
                <form action="../updateqa" method="post" role="form" class="text-start">
                     <% 
                                                         String did=request.getParameter("did");
                                            QuestionModel rule = new QuestionModel();
                                            ResultSet rs = rule.getAllQuestionOne(did);
                                            if (rs != null) {
                                                if(rs.next()) { 
                                        %>
                                        <div class="input-group input-group-outline">
                                            <input type="text" name="pid" value="<%=request.getParameter("pid") %>" style="display: none" readonly>
                                            <input type="text" name="qid" value="<%=request.getParameter("did") %>" style="display: none" readonly>
                                            <input type="text" name="sid" value="<%=request.getParameter("sid") %>" style="display: none" readonly>
                                            <input type="text" name="question" placeholder="Question" value="<%=rs.getString("question") %>" class="form-control" required>
                                        </div><br>
                                        <div class="input-group input-group-outline">
                                            <input type="text" name="aanswer" placeholder="Answer a" value="<%=rs.getString("a") %>" class="form-control" required>
                                        </div><br>
                                        <div class="input-group input-group-outline">
                                            <input type="text" name="banswer" placeholder="Answer b" value="<%=rs.getString("b") %>" class="form-control" required>
                                        </div><br>
                                        <div class="input-group input-group-outline">
                                            <input type="text" name="canswer" placeholder="Answer c" value="<%=rs.getString("c") %>" class="form-control" required>
                                        </div><br>
                                        <div class="input-group input-group-outline">
                                            <input type="text" name="danswer" placeholder="Answer d" value="<%=rs.getString("d") %>" class="form-control" required>
                                        </div><br>
                                        <div class="input-group input-group-outline">
                                            <input type="text" name="correct" placeholder="Correct" value="<%=rs.getString("correct") %>" class="form-control" required>
                                        </div>
                                        <div class="text-center">
                                            <input type="Submit" class="btn bg-gradient-primary w-100 my-4 mb-2" value="Change">
                                        </div>
                                         <% 
                                                }}
                                                %>
                                    </form>
              </div>
            </div>
          </div>
                  <form action="../deletequestion" method="post" role="form" class="text-start">
                  <input type="text" class="form-control" name="did" value="<%=request.getParameter("did") %>" style="display:none">
                  <input type="text" class="form-control" name="pid" value="<%=request.getParameter("pid") %>" style="display:none">
                  <input type="text" class="form-control" name="sid" value="<%=request.getParameter("sid") %>" style="display:none">
                  <div class="col-lg-12 col-md-12"><input type="submit" class="btn bg-gradient-danger w-100 my-3 mb-2" value="Delete Question"></div>
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
<% }} %>