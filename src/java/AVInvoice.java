/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Brijesh 
 */
public class AVInvoice {

    private String vid,vendorname, status, perInq, percentBook, date;
    private float amt;
    private int inv_id;

    public String getVendorname() {
        return vendorname;
    }

    public void setVendorname(String vendorname) {
        this.vendorname = vendorname;
    }

    
    public int getInv_id() {
        return inv_id;
    }

    public void setInv_id(int inv_id) {
        this.inv_id = inv_id;
    }

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPerInq() {
        return perInq;
    }

    public void setPerInq(String perInq) {
        this.perInq = perInq;
    }

    public String getPercentBook() {
        return percentBook;
    }

    public void setPercentBook(String percentBook) {
        this.percentBook = percentBook;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public float getAmt() {
        return amt;
    }

    public void setAmt(float amt) {
        this.amt = amt;
    }
}
