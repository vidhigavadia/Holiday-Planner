/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class VGetInfoServlet extends HttpServlet {

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
            throws ServletException, IOException {
        RequestDispatcher rd;
        
        NewTrip nt = new NewTrip();
        ArrayList<NewTripDetail> ntd = new ArrayList<NewTripDetail>();
        String query;
        VTripQuote vtq;
        String btn = request.getParameter("vst");
        
        try {
            if (btn.equals("Submit Quotation")) {
                int i = Integer.parseInt(request.getParameter("tripid"));
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
                Statement st = con.createStatement();
                query = "select Trip_Name from TripMaster where T_ID=" + i;
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    request.setAttribute("tripid", i);
                    request.setAttribute("tripname", rs.getString(1));
                }
                
                
                rd = request.getRequestDispatcher("vquotetrip.jsp");
                rd.forward(request, response);
            }
            else if(btn.equals("Upload Ticket"))
            {
                String i = (request.getParameter("tripid"));
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                
                rd = request.getRequestDispatcher("uploadticket.jsp");
                rd.forward(request, response);
            }
            else if (btn.equals("Book")) {
                int i = Integer.parseInt(request.getParameter("tripid"));
                
                  DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
                
                String sts = "Failed to book.";
                HttpSession session = request.getSession();
                String email = (String) session.getAttribute("Username");
                
                query = "update TripMaster set Status='Booked', Booked_Date='"+dateFormat.format(date)+"'where T_ID=" + i;
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
                Statement st = con.createStatement();
                
                int n = st.executeUpdate(query);
                if (n == 1) {
                    sts = "Booked successfully.";
                    
                }
                request.setAttribute("Status", sts);
                rd = request.getRequestDispatcher("VBookedTripServlet");
                rd.forward(request, response);
                
            } else if (btn.equals("Invoice")) {
                int i = Integer.parseInt(request.getParameter("tripid"));
                
                HttpSession session = request.getSession();
                String email = (String) session.getAttribute("Username");
                query = "select Quotation_Price from Trip_Quotation where T_ID =" + i + " and Vendor_ID='" + email + "'";
                int total = 0, paid = 0, remaining = 0;
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(query);
                
                VCInvoice in = new VCInvoice();
                
                while (rs.next()) {
                    total = rs.getInt(1);
                    remaining = total;
                    String q2 = "select Trip_Name, Cust_ID from TripMaster where T_ID =" + i;
                    Statement st2 = con.createStatement();
                    ResultSet rs2 = st2.executeQuery(q2);
                    if (rs2.next()) {
                        in.setTid(i);
                        in.setTotal(total);
                        in.setRemaining(remaining);
                        in.setTname(rs2.getString(1));
                        in.setCid(rs2.getString(2));
                        
                    }
                    
                }
                request.setAttribute("info", in);
                rd = request.getRequestDispatcher("vatinv.jsp");
                rd.forward(request, response);
                
                
            } else if (btn.equals("Generate")) {
                String sts = "Invoicing failed.";
                HttpSession session = request.getSession();
                String email = (String) session.getAttribute("Username");
                
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                
                int i = Integer.parseInt(request.getParameter("tid"));
                int invamt = Integer.parseInt(request.getParameter("amt"));
                int total = Integer.parseInt(request.getParameter("tot"));
                
                query = " insert into Invoice_Customer(Trip_ID,Amt_Total,Amt_Invoiced,Status,Date_Time) values(" + i + "," + total + "," + invamt + ",'Invoiced','" + dateFormat.format(date) + "')";
                
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
                Statement st = con.createStatement();
                
                int res = st.executeUpdate(query);
                if (res == 1) {
                    sts = "Invice generated successfully.";
                    query = "update TripMaster set Status='Invoiced' where T_ID=" + i;
                    Statement st2 = con.createStatement();
                    st2.executeUpdate(query);
                }
                request.setAttribute("Status", sts);
                rd = request.getRequestDispatcher("VApprovedTripServlet");
                rd.forward(request, response);
                
            } else {
                int i = Integer.parseInt(request.getParameter("tripid"));
                
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
                Statement st = con.createStatement();
                query = "select * from TripMaster where T_ID=" + i;
                ResultSet rs = st.executeQuery(query);
                
                while (rs.next()) {
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
                
                query = "select * from Trip_Details where T_ID=" + i;
                rs = st.executeQuery(query);
                while (rs.next()) {
                    NewTripDetail obj = new NewTripDetail();
                    obj.setArea(rs.getString(3));
                    obj.setHtype(rs.getString(4));
                    obj.setAsdate(rs.getString(5));
                    obj.setAedate(rs.getString(6));
                    obj.setTripId(rs.getInt(2));
                    ntd.add(obj);
                    
                }

                // Code to retieve info about quotation from the logged in vendor
                HttpSession session = request.getSession();
                String email = (String) session.getAttribute("Username");
                query = "select Quotation_Price, Itinerary from Trip_Quotation where T_ID = " + i + "and Vendor_ID ='" + email + "'";
                Statement st3 = con.createStatement();
                ResultSet rs3 = st3.executeQuery(query);
                while (rs3.next()) {
                    vtq = new VTripQuote();
                    vtq.setQuotation(rs3.getInt(1));
                    vtq.setDetail(rs3.getString(2));
                    
                    request.setAttribute("Qt", vtq);
                }
                
                
                
                
                request.setAttribute("Trip", ntd);
                request.setAttribute("TripDetail", nt);
                
                rd = request.getRequestDispatcher("vtripinfo.jsp");
                rd.forward(request, response);
                
                
            }
            
        } catch (Exception e) {
            System.out.println("Hi" + e.toString());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
