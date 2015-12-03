/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brijesh Admin
 */
public class GetInfoServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        NewTrip nt = new NewTrip();
        ArrayList<NewTripDetail> ntd = new ArrayList<NewTripDetail>();
        String query;
        RequestDispatcher rd;
        
        try {
           
            int i =Integer.parseInt(request.getParameter("tripid"));
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName="+DBPara.dbname+";username="+DBPara.uname+";password="+DBPara.pwd+";");
            Statement st = con.createStatement();
            
            query = "select * from TripMaster where T_ID="+i;
            ResultSet rs = st.executeQuery(query);
            
            while(rs.next())
            {
                nt.setTripId(rs.getInt(1));
                nt.setTripname(rs.getString(2));
                nt.setNoAdult(rs.getInt(3));
                nt.setNoChild(rs.getInt(4));
                nt.setFrom(rs.getString(5));
                nt.setTo(rs.getString(6));
                nt.setCustID(rs.getString(7));
                nt.setVendorID(rs.getString(8));
                nt.setTsdate(rs.getString(9));
                nt.setTedate(rs.getString(10));
                nt.setStatus(rs.getString(11));
                nt.setPdate(rs.getString(12));
                nt.setBdate(rs.getString(13));
                nt.setAdate(rs.getString(14));
                
            }
          
            query = "select * from Trip_Details where T_ID="+i;
            rs = st.executeQuery(query);
            while(rs.next())
            {
                NewTripDetail obj = new NewTripDetail();
                obj.setArea(rs.getString(3));
                obj.setHtype(rs.getString(4));
                obj.setAsdate(rs.getString(5));
                obj.setAedate(rs.getString(6));
                obj.setTripId(rs.getInt(2));
                ntd.add(obj);
                
            }
            
            request.setAttribute("Trip", ntd);
            request.setAttribute("TripDetail", nt);
                   
            rd = request.getRequestDispatcher("tripinformation.jsp");
            rd.forward(request, response);
            
            
            
        } 
        catch(Exception e)
        {
            System.out.println("Hi"+e.toString());
            rd = request.getRequestDispatcher("trip.jsp");
            rd.forward(request, response);
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
            Logger.getLogger(GetInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GetInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(GetInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GetInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
