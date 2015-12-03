/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brijesh Admin
 */
public class DownloadServlet extends HttpServlet {

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
        try {
            String sts = "Tickets downloaded.";
            String filename = request.getParameter("tripid") + ".zip";
            /* TODO output your page here. You may use following sample code. */
            File file = new File("F:\\vifer\\Project Doc\\8th sem project\\Full project\\HolidayPlanner\\HolidayPlanner\\Tickets" + filename);

            if (!file.exists()) {

                sts = "Tickets are not available. Contact vendor.";

            } else {


                ServletContext ctx = getServletContext();

                InputStream fis = new FileInputStream(file);

                String mimeType = ctx.getMimeType(file.getAbsolutePath());

                response.setContentType(mimeType != null ? mimeType : "application/octet-stream");

                response.setContentLength((int) file.length());

                response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

                ServletOutputStream os = response.getOutputStream();

                byte[] bufferData = new byte[1024];

                int read = 0;

                while ((read = fis.read(bufferData)) != -1) {

                    os.write(bufferData, 0, read);

                }

                os.flush();

                os.close();

                fis.close();
            }
            request.setAttribute("Status", sts);
            RequestDispatcher rd = request.getRequestDispatcher("BookedTripServlet");
            rd.forward(request, response);

        } catch (Exception e) {
            //  out.println(e.toString());
        } finally {
            //  out.close();
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
