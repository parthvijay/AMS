/**
 * Staff.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package Connection;

public class Staff  implements java.io.Serializable {
    private java.lang.String alid;

    private java.lang.String hiredate;

    private java.lang.String position;

    private java.lang.String sid;

    private java.lang.String status;

    public Staff() {
    }

    public Staff(
           java.lang.String alid,
           java.lang.String hiredate,
           java.lang.String position,
           java.lang.String sid,
           java.lang.String status) {
           this.alid = alid;
           this.hiredate = hiredate;
           this.position = position;
           this.sid = sid;
           this.status = status;
    }


    /**
     * Gets the alid value for this Staff.
     * 
     * @return alid
     */
    public java.lang.String getAlid() {
        return alid;
    }


    /**
     * Sets the alid value for this Staff.
     * 
     * @param alid
     */
    public void setAlid(java.lang.String alid) {
        this.alid = alid;
    }


    /**
     * Gets the hiredate value for this Staff.
     * 
     * @return hiredate
     */
    public java.lang.String getHiredate() {
        return hiredate;
    }


    /**
     * Sets the hiredate value for this Staff.
     * 
     * @param hiredate
     */
    public void setHiredate(java.lang.String hiredate) {
        this.hiredate = hiredate;
    }


    /**
     * Gets the position value for this Staff.
     * 
     * @return position
     */
    public java.lang.String getPosition() {
        return position;
    }


    /**
     * Sets the position value for this Staff.
     * 
     * @param position
     */
    public void setPosition(java.lang.String position) {
        this.position = position;
    }


    /**
     * Gets the sid value for this Staff.
     * 
     * @return sid
     */
    public java.lang.String getSid() {
        return sid;
    }


    /**
     * Sets the sid value for this Staff.
     * 
     * @param sid
     */
    public void setSid(java.lang.String sid) {
        this.sid = sid;
    }


    /**
     * Gets the status value for this Staff.
     * 
     * @return status
     */
    public java.lang.String getStatus() {
        return status;
    }


    /**
     * Sets the status value for this Staff.
     * 
     * @param status
     */
    public void setStatus(java.lang.String status) {
        this.status = status;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Staff)) return false;
        Staff other = (Staff) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.alid==null && other.getAlid()==null) || 
             (this.alid!=null &&
              this.alid.equals(other.getAlid()))) &&
            ((this.hiredate==null && other.getHiredate()==null) || 
             (this.hiredate!=null &&
              this.hiredate.equals(other.getHiredate()))) &&
            ((this.position==null && other.getPosition()==null) || 
             (this.position!=null &&
              this.position.equals(other.getPosition()))) &&
            ((this.sid==null && other.getSid()==null) || 
             (this.sid!=null &&
              this.sid.equals(other.getSid()))) &&
            ((this.status==null && other.getStatus()==null) || 
             (this.status!=null &&
              this.status.equals(other.getStatus())));
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
        if (getAlid() != null) {
            _hashCode += getAlid().hashCode();
        }
        if (getHiredate() != null) {
            _hashCode += getHiredate().hashCode();
        }
        if (getPosition() != null) {
            _hashCode += getPosition().hashCode();
        }
        if (getSid() != null) {
            _hashCode += getSid().hashCode();
        }
        if (getStatus() != null) {
            _hashCode += getStatus().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Staff.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Connection", "Staff"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("alid");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "alid"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("hiredate");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "hiredate"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("position");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "position"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("sid");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "sid"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("status");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "status"));
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
