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
public class SignUpServlet extends HttpServlet {

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
        String emailPwd = Pwd.getRandomPwd();
        String sts1;
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        try {

            String sts;

            String query, page;

            String fname1, lname1, phno1, email1, gender1, btn,role="customer";
            int diposite=0;
            String paypal = null;
            fname1 = request.getParameter("fname");
            lname1 = request.getParameter("lname");
            email1 = request.getParameter("email");
            phno1 = request.getParameter("phno");
            gender1 = request.getParameter("gender");
            btn = request.getParameter("register");
            if(btn.equals("Add"))
            {
                role = "vendor";
                paypal = request.getParameter("paypal");
                if(!(request.getParameter("dip").equals("")))
                {
                    diposite = Integer.parseInt(request.getParameter("dip"));
                }
                    
            }
            
            
            HttpSession session = request.getSession();

            int atpos = email1.indexOf("@");
            int dotpos = email1.lastIndexOf(".");
            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email1.length()) {
                sts = "Invalid Email ID. Registration failed.";
                request.setAttribute("Status", sts);
                if (btn.equals("Register")) {
                    rd = request.getRequestDispatcher("register.jsp");
                    rd.forward(request, response);
                } else if (btn.equals("Add")) {
                    rd = request.getRequestDispatcher("avendor.jsp");
                    rd.forward(request, response);

                }
            }
            
            else
            {
            query = "select Email from Person_Master";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                if (email1.equals(rs.getString(1))) {
                    sts = "Email ID already registered with us. Registration failed.";
                    request.setAttribute("Status", sts);
                    if (btn.equals("Register")) {
                        rd = request.getRequestDispatcher("register.jsp");
                        rd.forward(request, response);
                    } else if (btn.equals("Add")) {
                        rd = request.getRequestDispatcher("avendor.jsp");
                        rd.forward(request, response);

                    }


                }
            }

            query = "insert into Person_Master (FName, LName, Email, PhNo, Gender, Role, Password) values ('" + fname1 + "','" + lname1 + "','" + email1 + "','" + phno1 + "','" + gender1 + "','"+role+"', HASHBYTES('MD5','" + emailPwd + "'))";
            int i = st.executeUpdate(query);
            if (i == 1) {
                sts = "Success. Check your Email for further details.";
                request.setAttribute("Status", sts);

                if (btn.equals("Register")) {
                    session.setAttribute("Username", email1);
                    session.setAttribute("PageLoad", "cprofile.jsp");
                    rd = request.getRequestDispatcher("cprofile.jsp");
                } else if (btn.equals("Add")) {
                    
                    String query3 = "insert into VendorDeposit values('"+email1+"',"+diposite+")";
                    Statement st3 = con.createStatement();
                    st3.executeUpdate(query3);
                    
                    query3 ="insert into PaymentAccInfo(EID, AccID) values('"+email1+"','"+paypal+"')";
                    Statement st4 = con.createStatement();
                    st3.executeUpdate(query3);
                    
                    sts= "Vendor added.";
                    request.setAttribute("Status", sts);
                    rd = request.getRequestDispatcher("avendor.jsp");
                }
                String[] recipients = new String[]{email1};
                String[] bccRecipients = new String[]{};
                String subject = "Welcome to Holiday Planner";
                String messageBody = "Hello " + fname1 + ",\nYour account details are as follows:\n\nUsername(Log in ID): " + email1 + "\nPassword: " + emailPwd + "\n Please change your password on your next log in for the safety purpose.\n\nThank you for signing up.";

                if (new MailUtil().sendMail(recipients, bccRecipients, subject, messageBody)) {
                    sts1 = "Submitted Successfully";
                } else {
                    sts1 = "Unable to send. Try again later.";
                }

            } else {
                sts = "Failed.";
                request.setAttribute("Status", sts);
                if(btn.equals("Register"))
                {
                rd = request.getRequestDispatcher("register.jsp");
                }
                else if(btn.equals("Add"))
                {
                 rd = request.getRequestDispatcher("avendor.jsp");
                }
            }
            rd.forward(request, response);

            }

        } catch (Exception e) {
            System.out.println(e.toString());

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
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
