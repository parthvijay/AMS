/**
 * AirLines.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package Connection;

public class AirLines  implements java.io.Serializable {
    private java.lang.String aircraft;

    private java.lang.String alid;

    private java.lang.String capacity;

    private java.lang.String crewcount;

    private java.lang.String name;

    public AirLines() {
    }

    public AirLines(
           java.lang.String aircraft,
           java.lang.String alid,
           java.lang.String capacity,
           java.lang.String crewcount,
           java.lang.String name) {
           this.aircraft = aircraft;
           this.alid = alid;
           this.capacity = capacity;
           this.crewcount = crewcount;
           this.name = name;
    }


    /**
     * Gets the aircraft value for this AirLines.
     * 
     * @return aircraft
     */
    public java.lang.String getAircraft() {
        return aircraft;
    }


    /**
     * Sets the aircraft value for this AirLines.
     * 
     * @param aircraft
     */
    public void setAircraft(java.lang.String aircraft) {
        this.aircraft = aircraft;
    }


    /**
     * Gets the alid value for this AirLines.
     * 
     * @return alid
     */
    public java.lang.String getAlid() {
        return alid;
    }


    /**
     * Sets the alid value for this AirLines.
     * 
     * @param alid
     */
    public void setAlid(java.lang.String alid) {
        this.alid = alid;
    }


    /**
     * Gets the capacity value for this AirLines.
     * 
     * @return capacity
     */
    public java.lang.String getCapacity() {
        return capacity;
    }


    /**
     * Sets the capacity value for this AirLines.
     * 
     * @param capacity
     */
    public void setCapacity(java.lang.String capacity) {
        this.capacity = capacity;
    }


    /**
     * Gets the crewcount value for this AirLines.
     * 
     * @return crewcount
     */
    public java.lang.String getCrewcount() {
        return crewcount;
    }


    /**
     * Sets the crewcount value for this AirLines.
     * 
     * @param crewcount
     */
    public void setCrewcount(java.lang.String crewcount) {
        this.crewcount = crewcount;
    }


    /**
     * Gets the name value for this AirLines.
     * 
     * @return name
     */
    public java.lang.String getName() {
        return name;
    }


    /**
     * Sets the name value for this AirLines.
     * 
     * @param name
     */
    public void setName(java.lang.String name) {
        this.name = name;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof AirLines)) return false;
        AirLines other = (AirLines) obj;
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
            ((this.capacity==null && other.getCapacity()==null) || 
             (this.capacity!=null &&
              this.capacity.equals(other.getCapacity()))) &&
            ((this.crewcount==null && other.getCrewcount()==null) || 
             (this.crewcount!=null &&
              this.crewcount.equals(other.getCrewcount()))) &&
            ((this.name==null && other.getName()==null) || 
             (this.name!=null &&
              this.name.equals(other.getName())));
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
        if (getCapacity() != null) {
            _hashCode += getCapacity().hashCode();
        }
        if (getCrewcount() != null) {
            _hashCode += getCrewcount().hashCode();
        }
        if (getName() != null) {
            _hashCode += getName().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(AirLines.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://Connection", "AirLines"));
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
        elemField.setFieldName("capacity");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "capacity"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("crewcount");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "crewcount"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("name");
        elemField.setXmlName(new javax.xml.namespace.QName("http://Connection", "name"));
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
