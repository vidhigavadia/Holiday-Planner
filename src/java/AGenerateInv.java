/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brijesh Admin
 */
public class AGenerateInv extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd;
        String query,sts="Invoicing failed.";
        String sdate,edate,vid;
        int total_inq, total_bkamt,cp_inq,cp_bkamt,total;
        
         
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Date date = new Date();
        
        try {
            sdate = request.getParameter("sdate");
            edate = request.getParameter("edate");
            vid = request.getParameter("vid");
            total_inq =Integer.parseInt(request.getParameter("tni"));
            cp_inq = Integer.parseInt(request.getParameter("c1"));
            total_bkamt =Integer.parseInt(request.getParameter("ctbt"));
            cp_bkamt = Integer.parseInt(request.getParameter("c2"));
            total = ((total_bkamt*cp_bkamt)/100) + (total_inq*cp_inq);
            query = "insert into Invoice_Vendor(Vendor_ID,Invoice_Status,Amt_Invoiced,Date_Time,PerInq,PercentBook,sdate,edate,total_inq,total_bkamt) values('"+vid+"','Invoiced',"+total+",'"+dateFormat.format(date)+"',"+cp_inq+","+cp_bkamt+",'"+sdate+"','"+edate+"',"+total_inq+","+total_bkamt+")";
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con1 = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st1 = con1.createStatement();
            int i = st1.executeUpdate(query);
            if(i == 1)
            {
                sts = "Vendor Invoiced.";
            }
            
            request.setAttribute("Status", sts);
            rd = request.getRequestDispatcher("ainvoicegenerate.jsp");
            rd.forward(request, response);
            
           
        } 
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        finally {            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AGenerateInv.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AGenerateInv.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AGenerateInv.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AGenerateInv.class.getName()).log(Level.SEVERE, null, ex);
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
