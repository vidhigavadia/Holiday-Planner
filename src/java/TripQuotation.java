/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Brijesh Admin
 */
public class TripQuotation {

    private int id = 0, T_ID = 0, quotedPrice = 0;
    private String vendorId = "", itinerary = "", vendorname = "", vendorphno = "";

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getT_ID() {
        return T_ID;
    }

    public String getVendorname() {
        return vendorname;
    }

    public void setVendorname(String vendorname) {
        this.vendorname = vendorname;
    }

    public String getVendorphno() {
        return vendorphno;
    }

    public void setVendorphno(String vendorphno) {
        this.vendorphno = vendorphno;
    }

    public void setT_ID(int T_ID) {
        this.T_ID = T_ID;
    }

    public int getQuotedPrice() {
        return quotedPrice;
    }

    public void setQuotedPrice(int quotedPrice) {
        this.quotedPrice = quotedPrice;
    }

    public String getVendorId() {
        return vendorId;
    }

    public void setVendorId(String vendorId) {
        this.vendorId = vendorId;
    }

    public String getItinerary() {
        return itinerary;
    }

    public void setItinerary(String itinerary) {
        this.itinerary = itinerary;
    }
}
