
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

<body class="bg-gray-200">
  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">

        <nav class="navbar navbar-expand-lg blur border-radius-xl top-0 z-index-3 shadow position-absolute my-3 py-2 start-0 end-0 mx-4">
          <div class="container-fluid ps-2 pe-0">
            
            <div class="collapse navbar-collapse" id="navigation">
              <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center me-2 active" aria-current="page" href="login.jsp" >
                   
                  
                    <i class="fa fa-chart-pie opacity-6 text-dark me-1"></i>
                    Admin
                  </a>
                </li>
                <li class="nav-item">
                     <a class="nav-link me-2" href="../examinor/login.jsp">
                    
                    <i class="fa fa-user opacity-6 text-dark me-1"></i>
                    Examinor
                  </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link me-2" href="../proctor/login.jsp">
                    <i class="fas fa-key opacity-6 text-dark me-1"></i>
                    Proctor
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link me-2" href="../student/login.jsp">
                    <i class="fas fa-user-circle opacity-6 text-dark me-1"></i>
                   Student
                  </a>
                </li>
              </ul>
              
            </div>
          </div>
        </nav>
    
      </div>
    </div>
  </div>
  <main class="main-content  mt-0">
    <div class="page-header align-items-start min-vh-100" style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
      <span class="mask bg-gradient-dark opacity-6"></span>
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom">
              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                  <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">Sign in - Admin</h4>
                  
                </div>
              </div>
              <div class="card-body">
                <form action="../adminlogin" method="post" role="form" class="text-start">
                  <div class="input-group input-group-outline my-3">
                    <input type="email" name="email" class="form-control" placeholder="Email">
                  </div>
                  <div class="input-group input-group-outline mb-3">
                    <input type="password" name="password" class="form-control" placeholder="Password">
                  </div>
                  <div class="text-center">
                      <input type="Submit" class="btn bg-gradient-primary w-100 my-4 mb-2" value="Sign in" >
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </main>

</body>

</html>