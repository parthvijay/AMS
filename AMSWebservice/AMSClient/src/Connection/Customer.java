/**
 * Customer.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package Connection;

public class Customer  implements java.io.Serializable {
    private java.lang.String aircraft;

    private java.lang.String alid;

    private java.lang.String cid;

    private java.lang.String date;

    private java.lang.String nationality;

    private java.lang.String passport;

    private java.lang.String status;

    private java.lang.String ticketnum;

    public Customer() {
    }

    public Customer(
           java.lang.String aircraft,
           java.lang.String alid,
           java.lang.String cid,
           java.lang.String date,
           java.lang.String nationality,
           java.lang.String passport,
           java.lang.String status,
           java.lang.String ticketnum) {
           this.aircraft = aircraft;
           this.alid = alid;
           this.cid = cid;
           this.date = date;
           this.nationality = nationality;
           this.passport = passport;
           this.status = status;
           this.ticketnum = ticketnum;
    }


    /**
     * Gets the aircraft value for this Customer.
     * 
     * @return aircraft
     */
    public java.lang.String getAircraft() {
        return aircraft;
    }


    /**
     * Sets the aircraft value for this Customer.
     * 
     * @param aircraft
     */
    public void setAircraft(java.lang.String aircraft) {
        this.aircraft = aircraft;
    }


    /**
     * Gets the alid value for this Customer.
     * 
     * @return alid
     */
    public java.lang.String getAlid() {
        return alid;
    }


    /**
     * Sets the alid value for this Customer.
     * 
     * @param alid
     */
    public void setAlid(java.lang.String alid) {
        this.alid = alid;
    }


    /**
     * Gets the cid value for this Customer.
     * 
     * @return cid
     */
    public java.lang.String getCid() {
        return cid;
    }


    /**
     * Sets the cid value for this Customer.
     * 
     * @param cid
     */
    public void setCid(java.lang.String cid) {
        this.cid = cid;
    }


    /**
     * Gets the date value for this Customer.
     * 
     * @return date
     */
    public java.lang.String getDate() {
        return date;
    }


    /**
     * Sets the date value for this Customer.
     * 
     * @param date
     */
    public void setDate(java.lang.String date) {
        this.date = date;
    }


    /**
     * Gets the nationality value for this Customer.
     * 
     * @return nationality
     */
    public java.lang.String getNationality() {
        return nationality;
    }


    /**
     * Sets the nationality value for this Customer.
     * 
     * @param nationality
     */
    public void setNationality(java.lang.String nationality) {
        this.nationality = nationality;
    }


    /**
     * Gets the passport value for this Customer.
     * 
     * @return passport
     */
    public java.lang.String getPassport() {
        return passport;
    }


    /**
     * Sets the passport value for this Customer.
     * 
     * @param passport
     */
    public void setPassport(java.lang.String passport) {
        this.passport = passport;
    }


    /**
     * Gets the status value for this Customer.
     * 
     * @return status
     */
    public java.lang.String getStatus() {
        return status;
    }


    /**
     * Sets the status value for this Customer.
     * 
     * @param status
     */
    public void setStatus(java.lang.String status) {
        this.status = status;
    }


    /**
     * Gets the ticketnum value for this Customer.
     * 
     * @return ticketnum
     */
    public java.lang.String getTicketnum() {
        return ticketnum;
    }


    /**
     * Sets the ticketnum value for this Customer.
     * 
     * @param ticketnum
     */
    public void setTicketnum(java.lang.String ticketnum) {
        this.ticketnum = ticketnum;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Customer)) return false;
        Customer other = (Customer) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.aircraft==null && other.getAircraft()==null) || 
             (this.aircraft!=null &&
              this.aircraft.equals(other.getAircraft()))) &&
            ((this.alid==null && other.getAlid()==null) || 
             (this.alid!=null &&
              this.alid.equals(other.getAlid()))) &&
            ((this.cid==null && other.getCid()==null) || 
             (this.cid!=null &&
              this.cid.equals(other.getCid()))) &&
            ((this.date==null && other.getDate()==null) || 
             (this.date!=null &&
              this.date.equals(other.getDate()))) &&
            ((this.nationality==null && other.getNationality()==null) || 
             (this.nationality!=null &&
              this.nationality.equals(other.getNationality()))) &&
            ((this.passport==null && other.getPassport()==null) || 
             (this.passport!=null &&
              this.passport.equals(other.getPassport()))) &&
            ((this.status==null && other.getStatus()==null) || 
             (this.status!=null &&
              this.status.equals(other.getStatus()))) &&
            ((this.ticketnum==null && other.getTicketnum()==null) || 
             (this.ticketnum!=null &&
              this.ticketnum.equals(other.getTicketnum())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getAircraft() != null) {
            _hashCode += getAircraft().hashCode();
        }
        if (getAlid() != null) {
            _hashCode += getAlid().hashCode();
        }
        if (getCid() != null) {
            _hashCode += getCid().hashCode();
        }
        if (getDate() != null) {
            _hashCode += getDate().hashCode();
        }
        if (getNationality() != null) {
            _hashCode += getNationality().hashCode();
        }
        if (getPassport() != null) {
            _hashCode += getPassport().hashCode();
        }
        if (getStatus() != null) {
            _hashCode += getStatus().hashCode();
        }
        if (getTicketnum() != null) {
            _hashCode += getTicketnum().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Customer.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Connection", "Customer"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("aircraft");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "aircraft"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("alid");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "alid"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cid");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "cid"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("date");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "date"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nationality");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "nationality"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("passport");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "passport"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("status");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "status"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("ticketnum");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "ticketnum"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
