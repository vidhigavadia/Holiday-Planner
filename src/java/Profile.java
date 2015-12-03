/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Brijesh Admin
 */
public class Profile {

    private String email, password, fname, lname, phno, role, gender, street, city, pincode, state;

    public void setRole(String _role) {
        role = _role;
    }

    public void setPassword(String _password) {
        password = _password;
    }

    public void setFName(String _fname) {
        fname = _fname;
    }

    public void setLname(String _lname) {
        lname = _lname;
    }

    public void setPhno(String _phno) {
        phno = _phno;
    }

    public void setGender(String _gender) {
        gender = _gender;
    }

    public void setStreet(String _street) {
        street = _street;
    }

    public void setCity(String _city) {
        city = _city;
    }

    public void setPincode(String _pincode) {
        pincode = _pincode;
    }

    public void setState(String _state) {
        state = _state;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getPhno() {
        return phno;
    }

    public String getGender() {
        return gender;
    }

    public String getStreet() {
        return street;
    }

    public String getCity() {
        return city;
    }

    public String getPincode() {
        return pincode;
    }

    public String getState() {
        return state;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }
}
