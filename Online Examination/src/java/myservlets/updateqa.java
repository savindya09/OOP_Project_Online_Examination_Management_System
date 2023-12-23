/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlets;

import common.SystemVarList;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.QuestionModel;

/**
 *
 * @author Sam
 */
@WebServlet(name = "updateqa", urlPatterns = {"/updateqa"})
public class updateqa extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String q = request.getParameter("question");
        String a = request.getParameter("aanswer");
        String b = request.getParameter("banswer");
        String c = request.getParameter("canswer");
        String d = request.getParameter("danswer");
        String correct = request.getParameter("correct");
        String pid = request.getParameter("pid");
        String qid = request.getParameter("qid");
        String sid = request.getParameter("sid");
        QuestionModel s = new QuestionModel();
        int ab;
        ab = s.updateQuestion(qid,q,a,b,c,d,correct);
        if (ab == SystemVarList.LOGIN_SUCCESS) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Added Sucess');");
            out.println("location='examinor/qa.jsp?pid="+pid+"&sid="+sid+"';");
            out.println("</script>");

        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Incorrect');");
            out.println("location='examinor/qa.jsp?pid="+pid+"&sid="+sid+"';");
            out.println("</script>");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
