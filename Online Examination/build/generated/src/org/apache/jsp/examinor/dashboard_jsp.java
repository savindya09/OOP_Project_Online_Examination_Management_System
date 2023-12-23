package org.apache.jsp.examinor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.CustomModel;
import model.RuleModel;
import java.sql.ResultSet;
import model.ProctorModel;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    String status = (String) session.getAttribute("loginstatuse");
    if (status == null) {

        response.sendRedirect("login.jsp");

    } else {

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <link rel=\"apple-touch-icon\" sizes=\"76x76\" href=\"../assets/img/apple-icon.png\">\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" href=\"../assets/img/favicon.png\">\n");
      out.write("        <title>\n");
      out.write("            Online Examination System\n");
      out.write("        </title>\n");
      out.write("     \n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700\" />\n");
      out.write(" \n");
      out.write("        <link href=\"../assets/css/nucleo-icons.css\" rel=\"stylesheet\" />\n");
      out.write("        <link href=\"../assets/css/nucleo-svg.css\" rel=\"stylesheet\" />\n");
      out.write("       \n");
      out.write("        <script src=\"https://kit.fontawesome.com/42d5adcbca.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("       \n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons+Round\" rel=\"stylesheet\">\n");
      out.write("        \n");
      out.write("        <link id=\"pagestyle\" href=\"../assets/css/material-dashboard.css?v=3.0.4\" rel=\"stylesheet\" />\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body class=\"g-sidenav-show  bg-gray-200\">\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "slider.jsp", out, false);
      out.write("\n");
      out.write("        <main class=\"main-content position-relative max-height-vh-100 h-100 border-radius-lg \">\n");
      out.write("           \n");
      out.write("            <div class=\"container-fluid py-5\">\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    ");
 
                                            String id = (String) session.getAttribute("eid");
                                            CustomModel c = new CustomModel();
                                            ResultSet rs = c.ExaminorSubject(id);
                                            if (rs != null) {
                                                while(rs.next()) { 
                                        
      out.write("\n");
      out.write("                    <div class=\"col-xl-3 col-sm-6 mb-xl-0 mb-4\">\n");
      out.write("                        <div class=\"card\">\n");
      out.write("                            <div class=\"card-header p-3 pt-2\">\n");
      out.write("                                \n");
      out.write("                                <div class=\"text-end pt-1\">\n");
      out.write("                                    \n");
      out.write("                                    <h4 class=\"mb-0\">");
      out.print(rs.getString("subname") );
      out.write("</h4>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <hr class=\"dark horizontal my-0\">\n");
      out.write("                            <div class=\"card-footer p-3\">\n");
      out.write("                                <a href=\"paper.jsp?sid=");
      out.print(rs.getString("subid") );
      out.write("\" style=\"color: #ffffff\"><button class=\"btn bg-gradient-info w-100  mb-2\">View papers</button></a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                                ");
 
                                }}
                                
      out.write("\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </main>\n");
      out.write("\n");
      out.write("            <script src=\"../assets/js/core/popper.min.js\"></script>\n");
      out.write("            <script src=\"../assets/js/core/bootstrap.min.js\"></script>\n");
      out.write("            <script src=\"../assets/js/plugins/perfect-scrollbar.min.js\"></script>\n");
      out.write("            <script src=\"../assets/js/plugins/smooth-scrollbar.min.js\"></script>\n");
      out.write("            <script src=\"../assets/js/plugins/chartjs.min.js\"></script>\n");
      out.write("\n");
      out.write("            <script src=\"../assets/js/material-dashboard.min.js?v=3.0.4\"></script>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");

    }
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
