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
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author Brijesh Admin
 */
public class SaveNewTripServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String query, query1, query2;
        ResultSet rs;
        int tid = 0;

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();

        try {
            NewTrip nt = (NewTrip) session.getAttribute("tripInfo");
            List<NewTripDetail> ntd = (ArrayList<NewTripDetail>) session.getAttribute("tripdetail");
            Iterator it = ntd.iterator();

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();
            query = "insert into TripMaster (Trip_Name, NoAdults, NoChild, From_Place, To_Place, Cust_ID, Status, Start_Date, End_Date, Planned_Date) values('" + nt.getTripname() + "', " + nt.getNoAdult() + ", " + nt.getNoChild() + ", '" + nt.getFrom() + "', '" + nt.getTo() + "', '" + session.getAttribute("Username") + "', 'Submitted', '" + nt.getTsdate() + "', '" + nt.getTedate() + "', '" + dateFormat.format(date) + "')";
            int i = st.executeUpdate(query);
            con.close();

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con1 = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st1 = con1.createStatement();
            query1 = "select T_ID from TripMaster where Trip_Name = '" + nt.getTripname() + "'";
            rs = st1.executeQuery(query1);
            while (rs.next()) {
                tid = rs.getInt(1);
            }

            while (it.hasNext()) {
                NewTripDetail nd = (NewTripDetail) it.next();

                query2 = "insert into Trip_Details (T_ID, Area, Hotel_Type, Start_Date, End_Date) values('" + tid + "', '" + nd.getArea() + "', '" + nd.getHtype() + "', '" + nd.getAsdate() + "', '" + nd.getAedate() + "')";
                st1.executeUpdate(query2);
            }

            session.removeAttribute("tripdetail");
            session.removeAttribute("tripInfo");
            RequestDispatcher rd = request.getRequestDispatcher("SubmittedTripServlet");
            rd.forward(request, response);

            con1.close();
        } catch (Exception e) {
            System.out.println("hi" + e.toString());
        } finally {
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
            Logger.getLogger(SaveNewTripServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SaveNewTripServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SaveNewTripServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SaveNewTripServlet.class.getName()).log(Level.SEVERE, null, ex);
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
