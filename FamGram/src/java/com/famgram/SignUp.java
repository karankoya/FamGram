/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.famgram;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Karan Koya
 */
public class SignUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("INSIDE SIGNUP");
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mca_db","root","")) {
                out.println("after conn");
                try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO UserTBL(user_name,email,user_pass,famcode,profile_pic) values(?,?,?,?,?)")) {
                    String name = request.getParameter("name");
                    String pwd = request.getParameter("pwd");
                    String email = request.getParameter("email");
                    String imgPath = request.getParameter("image");
                    Random rd = new Random();
                    out.println("after parameter");
                    int famcode;
                    famcode = rd.nextInt(99999);
                    out.println("after famcode");
                    InputStream in;
                    File image = new File(imgPath);
                    in = new FileInputStream(image);
                    out.println("before checking");
                    try (Statement stmt1 = conn.createStatement()) {
                        String query = "SELECT user_name from UserTBL where user_name = '"+name+"'";
                        ResultSet rs = stmt1.executeQuery(query);
                        
                        out.println("OUTSIDE IF");
                        if(rs.next() == true)
                        {
                            out.println("ELEMENT EXISTS");
                            response.sendRedirect("index.html");
                        }
                        else
                        {
                            out.println("ELEMENT NOT EXISTS");
                            try{
                                stmt.setString(1,name);
                                stmt.setString(2, email);
                                stmt.setString(3,pwd);
                                stmt.setInt(4, famcode);
                                stmt.setBinaryStream(5, in, (int) image.length());
                                int flag = stmt.executeUpdate();
                                if(flag > 0)
                                {
                                    HttpSession hs = request.getSession();
                                    hs.setAttribute("user_name", name);
                                    response.sendRedirect("feed.jsp");
                                }
                                out.println("Data Stored");
                                }
                            catch(Exception e)
                            {
                                out.println("ERROR");
                            }
                        }
                        out.println("CLOSING CONNECTION");
                    }
                    catch(SQLException e){
                        out.println("Couldn't check data");
                    }
                }
                catch(SQLException e){
                    out.println("couldn't send data");
            }
                
            }
            catch(SQLException e){
                out.println("couldn't connect to db");
            }
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
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
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
