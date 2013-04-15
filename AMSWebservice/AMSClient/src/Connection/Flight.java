/**
 * Flight.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package Connection;

public class Flight  implements java.io.Serializable {
    private java.lang.String aircraft;

    private java.lang.String alid;

    private java.lang.String arrvdate;

    private java.lang.String arrvtime;

    private java.lang.String deptdate;

    private java.lang.String depttime;

    private java.lang.String destination;

    private java.lang.String source;

    private java.lang.String status;

    public Flight() {
    }

    public Flight(
           java.lang.String aircraft,
           java.lang.String alid,
           java.lang.String arrvdate,
           java.lang.String arrvtime,
           java.lang.String deptdate,
           java.lang.String depttime,
           java.lang.String destination,
           java.lang.String source,
           java.lang.String status) {
           this.aircraft = aircraft;
           this.alid = alid;
           this.arrvdate = arrvdate;
           this.arrvtime = arrvtime;
           this.deptdate = deptdate;
           this.depttime = depttime;
           this.destination = destination;
           this.source = source;
           this.status = status;
    }


    /**
     * Gets the aircraft value for this Flight.
     * 
     * @return aircraft
     */
    public java.lang.String getAircraft() {
        return aircraft;
    }


    /**
     * Sets the aircraft value for this Flight.
     * 
     * @param aircraft
     */
    public void setAircraft(java.lang.String aircraft) {
        this.aircraft = aircraft;
    }


    /**
     * Gets the alid value for this Flight.
     * 
     * @return alid
     */
    public java.lang.String getAlid() {
        return alid;
    }


    /**
     * Sets the alid value for this Flight.
     * 
     * @param alid
     */
    public void setAlid(java.lang.String alid) {
        this.alid = alid;
    }


    /**
     * Gets the arrvdate value for this Flight.
     * 
     * @return arrvdate
     */
    public java.lang.String getArrvdate() {
        return arrvdate;
    }


    /**
     * Sets the arrvdate value for this Flight.
     * 
     * @param arrvdate
     */
    public void setArrvdate(java.lang.String arrvdate) {
        this.arrvdate = arrvdate;
    }


    /**
     * Gets the arrvtime value for this Flight.
     * 
     * @return arrvtime
     */
    public java.lang.String getArrvtime() {
        return arrvtime;
    }


    /**
     * Sets the arrvtime value for this Flight.
     * 
     * @param arrvtime
     */
    public void setArrvtime(java.lang.String arrvtime) {
        this.arrvtime = arrvtime;
    }


    /**
     * Gets the deptdate value for this Flight.
     * 
     * @return deptdate
     */
    public java.lang.String getDeptdate() {
        return deptdate;
    }


    /**
     * Sets the deptdate value for this Flight.
     * 
     * @param deptdate
     */
    public void setDeptdate(java.lang.String deptdate) {
        this.deptdate = deptdate;
    }


    /**
     * Gets the depttime value for this Flight.
     * 
     * @return depttime
     */
    public java.lang.String getDepttime() {
        return depttime;
    }


    /**
     * Sets the depttime value for this Flight.
     * 
     * @param depttime
     */
    public void setDepttime(java.lang.String depttime) {
        this.depttime = depttime;
    }


    /**
     * Gets the destination value for this Flight.
     * 
     * @return destination
     */
    public java.lang.String getDestination() {
        return destination;
    }


    /**
     * Sets the destination value for this Flight.
     * 
     * @param destination
     */
    public void setDestination(java.lang.String destination) {
        this.destination = destination;
    }


    /**
     * Gets the source value for this Flight.
     * 
     * @return source
     */
    public java.lang.String getSource() {
        return source;
    }


    /**
     * Sets the source value for this Flight.
     * 
     * @param source
     */
    public void setSource(java.lang.String source) {
        this.source = source;
    }


    /**
     * Gets the status value for this Flight.
     * 
     * @return status
     */
    public java.lang.String getStatus() {
        return status;
    }


    /**
     * Sets the status value for this Flight.
     * 
     * @param status
     */
    public void setStatus(java.lang.String status) {
        this.status = status;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Flight)) return false;
        Flight other = (Flight) obj;
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
            ((this.arrvdate==null && other.getArrvdate()==null) || 
             (this.arrvdate!=null &&
              this.arrvdate.equals(other.getArrvdate()))) &&
            ((this.arrvtime==null && other.getArrvtime()==null) || 
             (this.arrvtime!=null &&
              this.arrvtime.equals(other.getArrvtime()))) &&
            ((this.deptdate==null && other.getDeptdate()==null) || 
             (this.deptdate!=null &&
              this.deptdate.equals(other.getDeptdate()))) &&
            ((this.depttime==null && other.getDepttime()==null) || 
             (this.depttime!=null &&
              this.depttime.equals(other.getDepttime()))) &&
            ((this.destination==null && other.getDestination()==null) || 
             (this.destination!=null &&
              this.destination.equals(other.getDestination()))) &&
            ((this.source==null && other.getSource()==null) || 
             (this.source!=null &&
              this.source.equals(other.getSource()))) &&
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
        if (getAircraft() != null) {
            _hashCode += getAircraft().hashCode();
        }
        if (getAlid() != null) {
            _hashCode += getAlid().hashCode();
        }
        if (getArrvdate() != null) {
            _hashCode += getArrvdate().hashCode();
        }
        if (getArrvtime() != null) {
            _hashCode += getArrvtime().hashCode();
        }
        if (getDeptdate() != null) {
            _hashCode += getDeptdate().hashCode();
        }
        if (getDepttime() != null) {
            _hashCode += getDepttime().hashCode();
        }
        if (getDestination() != null) {
            _hashCode += getDestination().hashCode();
        }
        if (getSource() != null) {
            _hashCode += getSource().hashCode();
        }
        if (getStatus() != null) {
            _hashCode += getStatus().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Flight.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Connection", "Flight"));
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
        elemField.setFieldName("arrvdate");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "arrvdate"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("arrvtime");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "arrvtime"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("deptdate");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "deptdate"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("depttime");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "depttime"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("destination");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "destination"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("source");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "source"));
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
