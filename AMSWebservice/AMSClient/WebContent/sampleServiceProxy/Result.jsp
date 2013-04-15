<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="sampleServiceProxyid" scope="session" class="Connection.ServiceProxy" />
<%
if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
sampleServiceProxyid.setEndpoint(request.getParameter("endpoint"));
%>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        java.lang.String getEndpoint2mtemp = sampleServiceProxyid.getEndpoint();
if(getEndpoint2mtemp == null){
%>
<%=getEndpoint2mtemp %>
<%
}else{
        String tempResultreturnp3 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getEndpoint2mtemp));
        %>
        <%= tempResultreturnp3 %>
        <%
}
break;
case 5:
        gotMethod = true;
        String endpoint_0id=  request.getParameter("endpoint8");
            java.lang.String endpoint_0idTemp = null;
        if(!endpoint_0id.equals("")){
         endpoint_0idTemp  = endpoint_0id;
        }
        sampleServiceProxyid.setEndpoint(endpoint_0idTemp);
break;
case 10:
        gotMethod = true;
        Connection.Service getService10mtemp = sampleServiceProxyid.getService();
if(getService10mtemp == null){
%>
<%=getService10mtemp %>
<%
}else{
        if(getService10mtemp!= null){
        String tempreturnp11 = getService10mtemp.toString();
        %>
        <%=tempreturnp11%>
        <%
        }}
break;
case 13:
        gotMethod = true;
        String firstname_1id=  request.getParameter("firstname16");
            java.lang.String firstname_1idTemp = null;
        if(!firstname_1id.equals("")){
         firstname_1idTemp  = firstname_1id;
        }
        String ssn_2id=  request.getParameter("ssn18");
            java.lang.String ssn_2idTemp = null;
        if(!ssn_2id.equals("")){
         ssn_2idTemp  = ssn_2id;
        }
        java.lang.String register13mtemp = sampleServiceProxyid.register(firstname_1idTemp,ssn_2idTemp);
if(register13mtemp == null){
%>
<%=register13mtemp %>
<%
}else{
        String tempResultreturnp14 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(register13mtemp));
        %>
        <%= tempResultreturnp14 %>
        <%
}
break;
case 20:
        gotMethod = true;
        String sid_3id=  request.getParameter("sid23");
            java.lang.String sid_3idTemp = null;
        if(!sid_3id.equals("")){
         sid_3idTemp  = sid_3id;
        }
        java.lang.String deleteEmployee20mtemp = sampleServiceProxyid.deleteEmployee(sid_3idTemp);
if(deleteEmployee20mtemp == null){
%>
<%=deleteEmployee20mtemp %>
<%
}else{
        String tempResultreturnp21 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(deleteEmployee20mtemp));
        %>
        <%= tempResultreturnp21 %>
        <%
}
break;
case 25:
        gotMethod = true;
        String alid_4id=  request.getParameter("alid28");
            java.lang.String alid_4idTemp = null;
        if(!alid_4id.equals("")){
         alid_4idTemp  = alid_4id;
        }
        String status_5id=  request.getParameter("status30");
            java.lang.String status_5idTemp = null;
        if(!status_5id.equals("")){
         status_5idTemp  = status_5id;
        }
        Connection.Staff[] getAllEmployee25mtemp = sampleServiceProxyid.getAllEmployee(alid_4idTemp,status_5idTemp);
if(getAllEmployee25mtemp == null){
%>
<%=getAllEmployee25mtemp %>
<%
}else{
        String tempreturnp26 = null;
        if(getAllEmployee25mtemp != null){
        java.util.List listreturnp26= java.util.Arrays.asList(getAllEmployee25mtemp);
        tempreturnp26 = listreturnp26.toString();
        }
        %>
        <%=tempreturnp26%>
        <%
}
break;
case 32:
        gotMethod = true;
        String position_7id=  request.getParameter("position47");
            java.lang.String position_7idTemp = null;
        if(!position_7id.equals("")){
         position_7idTemp  = position_7id;
        }
        String status_8id=  request.getParameter("status49");
            java.lang.String status_8idTemp = null;
        if(!status_8id.equals("")){
         status_8idTemp  = status_8id;
        }
        String sid_9id=  request.getParameter("sid51");
            java.lang.String sid_9idTemp = null;
        if(!sid_9id.equals("")){
         sid_9idTemp  = sid_9id;
        }
        String alid_10id=  request.getParameter("alid53");
            java.lang.String alid_10idTemp = null;
        if(!alid_10id.equals("")){
         alid_10idTemp  = alid_10id;
        }
        String hiredate_11id=  request.getParameter("hiredate55");
            java.lang.String hiredate_11idTemp = null;
        if(!hiredate_11id.equals("")){
         hiredate_11idTemp  = hiredate_11id;
        }
        %>
        <jsp:useBean id="Connection1Staff_6id" scope="session" class="Connection.Staff" />
        <%
        Connection1Staff_6id.setPosition(position_7idTemp);
        Connection1Staff_6id.setStatus(status_8idTemp);
        Connection1Staff_6id.setSid(sid_9idTemp);
        Connection1Staff_6id.setAlid(alid_10idTemp);
        Connection1Staff_6id.setHiredate(hiredate_11idTemp);
        Connection.Staff updateEmployee32mtemp = sampleServiceProxyid.updateEmployee(Connection1Staff_6id);
if(updateEmployee32mtemp == null){
%>
<%=updateEmployee32mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">position:</TD>
<TD>
<%
if(updateEmployee32mtemp != null){
java.lang.String typeposition35 = updateEmployee32mtemp.getPosition();
        String tempResultposition35 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeposition35));
        %>
        <%= tempResultposition35 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">status:</TD>
<TD>
<%
if(updateEmployee32mtemp != null){
java.lang.String typestatus37 = updateEmployee32mtemp.getStatus();
        String tempResultstatus37 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestatus37));
        %>
        <%= tempResultstatus37 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">sid:</TD>
<TD>
<%
if(updateEmployee32mtemp != null){
java.lang.String typesid39 = updateEmployee32mtemp.getSid();
        String tempResultsid39 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typesid39));
        %>
        <%= tempResultsid39 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">alid:</TD>
<TD>
<%
if(updateEmployee32mtemp != null){
java.lang.String typealid41 = updateEmployee32mtemp.getAlid();
        String tempResultalid41 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typealid41));
        %>
        <%= tempResultalid41 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">hiredate:</TD>
<TD>
<%
if(updateEmployee32mtemp != null){
java.lang.String typehiredate43 = updateEmployee32mtemp.getHiredate();
        String tempResulthiredate43 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typehiredate43));
        %>
        <%= tempResulthiredate43 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 57:
        gotMethod = true;
        String position_13id=  request.getParameter("position62");
            java.lang.String position_13idTemp = null;
        if(!position_13id.equals("")){
         position_13idTemp  = position_13id;
        }
        String status_14id=  request.getParameter("status64");
            java.lang.String status_14idTemp = null;
        if(!status_14id.equals("")){
         status_14idTemp  = status_14id;
        }
        String sid_15id=  request.getParameter("sid66");
            java.lang.String sid_15idTemp = null;
        if(!sid_15id.equals("")){
         sid_15idTemp  = sid_15id;
        }
        String alid_16id=  request.getParameter("alid68");
            java.lang.String alid_16idTemp = null;
        if(!alid_16id.equals("")){
         alid_16idTemp  = alid_16id;
        }
        String hiredate_17id=  request.getParameter("hiredate70");
            java.lang.String hiredate_17idTemp = null;
        if(!hiredate_17id.equals("")){
         hiredate_17idTemp  = hiredate_17id;
        }
        %>
        <jsp:useBean id="Connection1Staff_12id" scope="session" class="Connection.Staff" />
        <%
        Connection1Staff_12id.setPosition(position_13idTemp);
        Connection1Staff_12id.setStatus(status_14idTemp);
        Connection1Staff_12id.setSid(sid_15idTemp);
        Connection1Staff_12id.setAlid(alid_16idTemp);
        Connection1Staff_12id.setHiredate(hiredate_17idTemp);
        java.lang.String createEmployee57mtemp = sampleServiceProxyid.createEmployee(Connection1Staff_12id);
if(createEmployee57mtemp == null){
%>
<%=createEmployee57mtemp %>
<%
}else{
        String tempResultreturnp58 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(createEmployee57mtemp));
        %>
        <%= tempResultreturnp58 %>
        <%
}
break;
case 72:
        gotMethod = true;
        String cid_18id=  request.getParameter("cid75");
            java.lang.String cid_18idTemp = null;
        if(!cid_18id.equals("")){
         cid_18idTemp  = cid_18id;
        }
        java.lang.String getCustTravelInfo72mtemp = sampleServiceProxyid.getCustTravelInfo(cid_18idTemp);
if(getCustTravelInfo72mtemp == null){
%>
<%=getCustTravelInfo72mtemp %>
<%
}else{
        String tempResultreturnp73 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getCustTravelInfo72mtemp));
        %>
        <%= tempResultreturnp73 %>
        <%
}
break;
case 77:
        gotMethod = true;
        String cid_19id=  request.getParameter("cid80");
            java.lang.String cid_19idTemp = null;
        if(!cid_19id.equals("")){
         cid_19idTemp  = cid_19id;
        }
        java.lang.String getCompleterCustomerDetails77mtemp = sampleServiceProxyid.getCompleterCustomerDetails(cid_19idTemp);
if(getCompleterCustomerDetails77mtemp == null){
%>
<%=getCompleterCustomerDetails77mtemp %>
<%
}else{
        String tempResultreturnp78 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getCompleterCustomerDetails77mtemp));
        %>
        <%= tempResultreturnp78 %>
        <%
}
break;
case 82:
        gotMethod = true;
        String cid_20id=  request.getParameter("cid85");
            java.lang.String cid_20idTemp = null;
        if(!cid_20id.equals("")){
         cid_20idTemp  = cid_20id;
        }
        java.lang.String getCustomerById82mtemp = sampleServiceProxyid.getCustomerById(cid_20idTemp);
if(getCustomerById82mtemp == null){
%>
<%=getCustomerById82mtemp %>
<%
}else{
        String tempResultreturnp83 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getCustomerById82mtemp));
        %>
        <%= tempResultreturnp83 %>
        <%
}
break;
case 87:
        gotMethod = true;
        String alid_21id=  request.getParameter("alid90");
            java.lang.String alid_21idTemp = null;
        if(!alid_21id.equals("")){
         alid_21idTemp  = alid_21id;
        }
        String date_22id=  request.getParameter("date92");
            java.lang.String date_22idTemp = null;
        if(!date_22id.equals("")){
         date_22idTemp  = date_22id;
        }
        Connection.Flight[] getAllFlights87mtemp = sampleServiceProxyid.getAllFlights(alid_21idTemp,date_22idTemp);
if(getAllFlights87mtemp == null){
%>
<%=getAllFlights87mtemp %>
<%
}else{
        String tempreturnp88 = null;
        if(getAllFlights87mtemp != null){
        java.util.List listreturnp88= java.util.Arrays.asList(getAllFlights87mtemp);
        tempreturnp88 = listreturnp88.toString();
        }
        %>
        <%=tempreturnp88%>
        <%
}
break;
case 94:
        gotMethod = true;
        String alid_23id=  request.getParameter("alid115");
            java.lang.String alid_23idTemp = null;
        if(!alid_23id.equals("")){
         alid_23idTemp  = alid_23id;
        }
        String date_24id=  request.getParameter("date117");
            java.lang.String date_24idTemp = null;
        if(!date_24id.equals("")){
         date_24idTemp  = date_24id;
        }
        String aircraft_25id=  request.getParameter("aircraft119");
            java.lang.String aircraft_25idTemp = null;
        if(!aircraft_25id.equals("")){
         aircraft_25idTemp  = aircraft_25id;
        }
        Connection.Flight getCustomerFlight94mtemp = sampleServiceProxyid.getCustomerFlight(alid_23idTemp,date_24idTemp,aircraft_25idTemp);
if(getCustomerFlight94mtemp == null){
%>
<%=getCustomerFlight94mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">source:</TD>
<TD>
<%
if(getCustomerFlight94mtemp != null){
java.lang.String typesource97 = getCustomerFlight94mtemp.getSource();
        String tempResultsource97 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typesource97));
        %>
        <%= tempResultsource97 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">alid:</TD>
<TD>
<%
if(getCustomerFlight94mtemp != null){
java.lang.String typealid99 = getCustomerFlight94mtemp.getAlid();
        String tempResultalid99 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typealid99));
        %>
        <%= tempResultalid99 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">status:</TD>
<TD>
<%
if(getCustomerFlight94mtemp != null){
java.lang.String typestatus101 = getCustomerFlight94mtemp.getStatus();
        String tempResultstatus101 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestatus101));
        %>
        <%= tempResultstatus101 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">depttime:</TD>
<TD>
<%
if(getCustomerFlight94mtemp != null){
java.lang.String typedepttime103 = getCustomerFlight94mtemp.getDepttime();
        String tempResultdepttime103 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedepttime103));
        %>
        <%= tempResultdepttime103 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">deptdate:</TD>
<TD>
<%
if(getCustomerFlight94mtemp != null){
java.lang.String typedeptdate105 = getCustomerFlight94mtemp.getDeptdate();
        String tempResultdeptdate105 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedeptdate105));
        %>
        <%= tempResultdeptdate105 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">arrvtime:</TD>
<TD>
<%
if(getCustomerFlight94mtemp != null){
java.lang.String typearrvtime107 = getCustomerFlight94mtemp.getArrvtime();
        String tempResultarrvtime107 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typearrvtime107));
        %>
        <%= tempResultarrvtime107 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">arrvdate:</TD>
<TD>
<%
if(getCustomerFlight94mtemp != null){
java.lang.String typearrvdate109 = getCustomerFlight94mtemp.getArrvdate();
        String tempResultarrvdate109 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typearrvdate109));
        %>
        <%= tempResultarrvdate109 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">aircraft:</TD>
<TD>
<%
if(getCustomerFlight94mtemp != null){
java.lang.String typeaircraft111 = getCustomerFlight94mtemp.getAircraft();
        String tempResultaircraft111 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeaircraft111));
        %>
        <%= tempResultaircraft111 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">destination:</TD>
<TD>
<%
if(getCustomerFlight94mtemp != null){
java.lang.String typedestination113 = getCustomerFlight94mtemp.getDestination();
        String tempResultdestination113 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedestination113));
        %>
        <%= tempResultdestination113 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 121:
        gotMethod = true;
        String nationality_27id=  request.getParameter("nationality126");
            java.lang.String nationality_27idTemp = null;
        if(!nationality_27id.equals("")){
         nationality_27idTemp  = nationality_27id;
        }
        String ticketnum_28id=  request.getParameter("ticketnum128");
            java.lang.String ticketnum_28idTemp = null;
        if(!ticketnum_28id.equals("")){
         ticketnum_28idTemp  = ticketnum_28id;
        }
        String date_29id=  request.getParameter("date130");
            java.lang.String date_29idTemp = null;
        if(!date_29id.equals("")){
         date_29idTemp  = date_29id;
        }
        String alid_30id=  request.getParameter("alid132");
            java.lang.String alid_30idTemp = null;
        if(!alid_30id.equals("")){
         alid_30idTemp  = alid_30id;
        }
        String status_31id=  request.getParameter("status134");
            java.lang.String status_31idTemp = null;
        if(!status_31id.equals("")){
         status_31idTemp  = status_31id;
        }
        String cid_32id=  request.getParameter("cid136");
            java.lang.String cid_32idTemp = null;
        if(!cid_32id.equals("")){
         cid_32idTemp  = cid_32id;
        }
        String aircraft_33id=  request.getParameter("aircraft138");
            java.lang.String aircraft_33idTemp = null;
        if(!aircraft_33id.equals("")){
         aircraft_33idTemp  = aircraft_33id;
        }
        String passport_34id=  request.getParameter("passport140");
            java.lang.String passport_34idTemp = null;
        if(!passport_34id.equals("")){
         passport_34idTemp  = passport_34id;
        }
        %>
        <jsp:useBean id="Connection1Customer_26id" scope="session" class="Connection.Customer" />
        <%
        Connection1Customer_26id.setNationality(nationality_27idTemp);
        Connection1Customer_26id.setTicketnum(ticketnum_28idTemp);
        Connection1Customer_26id.setDate(date_29idTemp);
        Connection1Customer_26id.setAlid(alid_30idTemp);
        Connection1Customer_26id.setStatus(status_31idTemp);
        Connection1Customer_26id.setCid(cid_32idTemp);
        Connection1Customer_26id.setAircraft(aircraft_33idTemp);
        Connection1Customer_26id.setPassport(passport_34idTemp);
        boolean updateCustomer121mtemp = sampleServiceProxyid.updateCustomer(Connection1Customer_26id);
        String tempResultreturnp122 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updateCustomer121mtemp));
        %>
        <%= tempResultreturnp122 %>
        <%
break;
case 142:
        gotMethod = true;
        String cid_35id=  request.getParameter("cid145");
            java.lang.String cid_35idTemp = null;
        if(!cid_35id.equals("")){
         cid_35idTemp  = cid_35id;
        }
        Connection.Customer[] getBookingsOfACustomer142mtemp = sampleServiceProxyid.getBookingsOfACustomer(cid_35idTemp);
if(getBookingsOfACustomer142mtemp == null){
%>
<%=getBookingsOfACustomer142mtemp %>
<%
}else{
        String tempreturnp143 = null;
        if(getBookingsOfACustomer142mtemp != null){
        java.util.List listreturnp143= java.util.Arrays.asList(getBookingsOfACustomer142mtemp);
        tempreturnp143 = listreturnp143.toString();
        }
        %>
        <%=tempreturnp143%>
        <%
}
break;
case 147:
        gotMethod = true;
        String alid_36id=  request.getParameter("alid150");
            java.lang.String alid_36idTemp = null;
        if(!alid_36id.equals("")){
         alid_36idTemp  = alid_36id;
        }
        String date_37id=  request.getParameter("date152");
            java.lang.String date_37idTemp = null;
        if(!date_37id.equals("")){
         date_37idTemp  = date_37id;
        }
        java.lang.String getAllCustomers147mtemp = sampleServiceProxyid.getAllCustomers(alid_36idTemp,date_37idTemp);
if(getAllCustomers147mtemp == null){
%>
<%=getAllCustomers147mtemp %>
<%
}else{
        String tempResultreturnp148 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getAllCustomers147mtemp));
        %>
        <%= tempResultreturnp148 %>
        <%
}
break;
case 154:
        gotMethod = true;
        String nationality_39id=  request.getParameter("nationality177");
            java.lang.String nationality_39idTemp = null;
        if(!nationality_39id.equals("")){
         nationality_39idTemp  = nationality_39id;
        }
        String ticketnum_40id=  request.getParameter("ticketnum179");
            java.lang.String ticketnum_40idTemp = null;
        if(!ticketnum_40id.equals("")){
         ticketnum_40idTemp  = ticketnum_40id;
        }
        String date_41id=  request.getParameter("date181");
            java.lang.String date_41idTemp = null;
        if(!date_41id.equals("")){
         date_41idTemp  = date_41id;
        }
        String alid_42id=  request.getParameter("alid183");
            java.lang.String alid_42idTemp = null;
        if(!alid_42id.equals("")){
         alid_42idTemp  = alid_42id;
        }
        String status_43id=  request.getParameter("status185");
            java.lang.String status_43idTemp = null;
        if(!status_43id.equals("")){
         status_43idTemp  = status_43id;
        }
        String cid_44id=  request.getParameter("cid187");
            java.lang.String cid_44idTemp = null;
        if(!cid_44id.equals("")){
         cid_44idTemp  = cid_44id;
        }
        String aircraft_45id=  request.getParameter("aircraft189");
            java.lang.String aircraft_45idTemp = null;
        if(!aircraft_45id.equals("")){
         aircraft_45idTemp  = aircraft_45id;
        }
        String passport_46id=  request.getParameter("passport191");
            java.lang.String passport_46idTemp = null;
        if(!passport_46id.equals("")){
         passport_46idTemp  = passport_46id;
        }
        %>
        <jsp:useBean id="Connection1Customer_38id" scope="session" class="Connection.Customer" />
        <%
        Connection1Customer_38id.setNationality(nationality_39idTemp);
        Connection1Customer_38id.setTicketnum(ticketnum_40idTemp);
        Connection1Customer_38id.setDate(date_41idTemp);
        Connection1Customer_38id.setAlid(alid_42idTemp);
        Connection1Customer_38id.setStatus(status_43idTemp);
        Connection1Customer_38id.setCid(cid_44idTemp);
        Connection1Customer_38id.setAircraft(aircraft_45idTemp);
        Connection1Customer_38id.setPassport(passport_46idTemp);
        Connection.Flight newReservation154mtemp = sampleServiceProxyid.newReservation(Connection1Customer_38id);
if(newReservation154mtemp == null){
%>
<%=newReservation154mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">source:</TD>
<TD>
<%
if(newReservation154mtemp != null){
java.lang.String typesource157 = newReservation154mtemp.getSource();
        String tempResultsource157 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typesource157));
        %>
        <%= tempResultsource157 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">alid:</TD>
<TD>
<%
if(newReservation154mtemp != null){
java.lang.String typealid159 = newReservation154mtemp.getAlid();
        String tempResultalid159 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typealid159));
        %>
        <%= tempResultalid159 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">status:</TD>
<TD>
<%
if(newReservation154mtemp != null){
java.lang.String typestatus161 = newReservation154mtemp.getStatus();
        String tempResultstatus161 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestatus161));
        %>
        <%= tempResultstatus161 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">depttime:</TD>
<TD>
<%
if(newReservation154mtemp != null){
java.lang.String typedepttime163 = newReservation154mtemp.getDepttime();
        String tempResultdepttime163 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedepttime163));
        %>
        <%= tempResultdepttime163 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">deptdate:</TD>
<TD>
<%
if(newReservation154mtemp != null){
java.lang.String typedeptdate165 = newReservation154mtemp.getDeptdate();
        String tempResultdeptdate165 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedeptdate165));
        %>
        <%= tempResultdeptdate165 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">arrvtime:</TD>
<TD>
<%
if(newReservation154mtemp != null){
java.lang.String typearrvtime167 = newReservation154mtemp.getArrvtime();
        String tempResultarrvtime167 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typearrvtime167));
        %>
        <%= tempResultarrvtime167 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">arrvdate:</TD>
<TD>
<%
if(newReservation154mtemp != null){
java.lang.String typearrvdate169 = newReservation154mtemp.getArrvdate();
        String tempResultarrvdate169 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typearrvdate169));
        %>
        <%= tempResultarrvdate169 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">aircraft:</TD>
<TD>
<%
if(newReservation154mtemp != null){
java.lang.String typeaircraft171 = newReservation154mtemp.getAircraft();
        String tempResultaircraft171 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeaircraft171));
        %>
        <%= tempResultaircraft171 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">destination:</TD>
<TD>
<%
if(newReservation154mtemp != null){
java.lang.String typedestination173 = newReservation154mtemp.getDestination();
        String tempResultdestination173 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedestination173));
        %>
        <%= tempResultdestination173 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 193:
        gotMethod = true;
        String nationality_48id=  request.getParameter("nationality198");
            java.lang.String nationality_48idTemp = null;
        if(!nationality_48id.equals("")){
         nationality_48idTemp  = nationality_48id;
        }
        String ticketnum_49id=  request.getParameter("ticketnum200");
            java.lang.String ticketnum_49idTemp = null;
        if(!ticketnum_49id.equals("")){
         ticketnum_49idTemp  = ticketnum_49id;
        }
        String date_50id=  request.getParameter("date202");
            java.lang.String date_50idTemp = null;
        if(!date_50id.equals("")){
         date_50idTemp  = date_50id;
        }
        String alid_51id=  request.getParameter("alid204");
            java.lang.String alid_51idTemp = null;
        if(!alid_51id.equals("")){
         alid_51idTemp  = alid_51id;
        }
        String status_52id=  request.getParameter("status206");
            java.lang.String status_52idTemp = null;
        if(!status_52id.equals("")){
         status_52idTemp  = status_52id;
        }
        String cid_53id=  request.getParameter("cid208");
            java.lang.String cid_53idTemp = null;
        if(!cid_53id.equals("")){
         cid_53idTemp  = cid_53id;
        }
        String aircraft_54id=  request.getParameter("aircraft210");
            java.lang.String aircraft_54idTemp = null;
        if(!aircraft_54id.equals("")){
         aircraft_54idTemp  = aircraft_54id;
        }
        String passport_55id=  request.getParameter("passport212");
            java.lang.String passport_55idTemp = null;
        if(!passport_55id.equals("")){
         passport_55idTemp  = passport_55id;
        }
        %>
        <jsp:useBean id="Connection1Customer_47id" scope="session" class="Connection.Customer" />
        <%
        Connection1Customer_47id.setNationality(nationality_48idTemp);
        Connection1Customer_47id.setTicketnum(ticketnum_49idTemp);
        Connection1Customer_47id.setDate(date_50idTemp);
        Connection1Customer_47id.setAlid(alid_51idTemp);
        Connection1Customer_47id.setStatus(status_52idTemp);
        Connection1Customer_47id.setCid(cid_53idTemp);
        Connection1Customer_47id.setAircraft(aircraft_54idTemp);
        Connection1Customer_47id.setPassport(passport_55idTemp);
        java.lang.String createCustomer193mtemp = sampleServiceProxyid.createCustomer(Connection1Customer_47id);
if(createCustomer193mtemp == null){
%>
<%=createCustomer193mtemp %>
<%
}else{
        String tempResultreturnp194 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(createCustomer193mtemp));
        %>
        <%= tempResultreturnp194 %>
        <%
}
break;
case 214:
        gotMethod = true;
        String sid_56id=  request.getParameter("sid217");
            java.lang.String sid_56idTemp = null;
        if(!sid_56id.equals("")){
         sid_56idTemp  = sid_56id;
        }
        Connection.Flight[] getAssignedFlights214mtemp = sampleServiceProxyid.getAssignedFlights(sid_56idTemp);
if(getAssignedFlights214mtemp == null){
%>
<%=getAssignedFlights214mtemp %>
<%
}else{
        String tempreturnp215 = null;
        if(getAssignedFlights214mtemp != null){
        java.util.List listreturnp215= java.util.Arrays.asList(getAssignedFlights214mtemp);
        tempreturnp215 = listreturnp215.toString();
        }
        %>
        <%=tempreturnp215%>
        <%
}
break;
case 219:
        gotMethod = true;
        String cid_57id=  request.getParameter("cid244");
            java.lang.String cid_57idTemp = null;
        if(!cid_57id.equals("")){
         cid_57idTemp  = cid_57id;
        }
        Connection.Person getPersonCustomer219mtemp = sampleServiceProxyid.getPersonCustomer(cid_57idTemp);
if(getPersonCustomer219mtemp == null){
%>
<%=getPersonCustomer219mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">state:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typestate222 = getPersonCustomer219mtemp.getState();
        String tempResultstate222 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestate222));
        %>
        <%= tempResultstate222 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">zip:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typezip224 = getPersonCustomer219mtemp.getZip();
        String tempResultzip224 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typezip224));
        %>
        <%= tempResultzip224 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">ssn:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typessn226 = getPersonCustomer219mtemp.getSsn();
        String tempResultssn226 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typessn226));
        %>
        <%= tempResultssn226 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">city:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typecity228 = getPersonCustomer219mtemp.getCity();
        String tempResultcity228 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecity228));
        %>
        <%= tempResultcity228 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">pid:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typepid230 = getPersonCustomer219mtemp.getPid();
        String tempResultpid230 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepid230));
        %>
        <%= tempResultpid230 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstname:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typefirstname232 = getPersonCustomer219mtemp.getFirstname();
        String tempResultfirstname232 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstname232));
        %>
        <%= tempResultfirstname232 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastname:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typelastname234 = getPersonCustomer219mtemp.getLastname();
        String tempResultlastname234 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastname234));
        %>
        <%= tempResultlastname234 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">phone:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typephone236 = getPersonCustomer219mtemp.getPhone();
        String tempResultphone236 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typephone236));
        %>
        <%= tempResultphone236 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">email:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typeemail238 = getPersonCustomer219mtemp.getEmail();
        String tempResultemail238 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeemail238));
        %>
        <%= tempResultemail238 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">address:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typeaddress240 = getPersonCustomer219mtemp.getAddress();
        String tempResultaddress240 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeaddress240));
        %>
        <%= tempResultaddress240 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">dob:</TD>
<TD>
<%
if(getPersonCustomer219mtemp != null){
java.lang.String typedob242 = getPersonCustomer219mtemp.getDob();
        String tempResultdob242 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedob242));
        %>
        <%= tempResultdob242 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 246:
        gotMethod = true;
        String state_59id=  request.getParameter("state251");
            java.lang.String state_59idTemp = null;
        if(!state_59id.equals("")){
         state_59idTemp  = state_59id;
        }
        String zip_60id=  request.getParameter("zip253");
            java.lang.String zip_60idTemp = null;
        if(!zip_60id.equals("")){
         zip_60idTemp  = zip_60id;
        }
        String ssn_61id=  request.getParameter("ssn255");
            java.lang.String ssn_61idTemp = null;
        if(!ssn_61id.equals("")){
         ssn_61idTemp  = ssn_61id;
        }
        String city_62id=  request.getParameter("city257");
            java.lang.String city_62idTemp = null;
        if(!city_62id.equals("")){
         city_62idTemp  = city_62id;
        }
        String pid_63id=  request.getParameter("pid259");
            java.lang.String pid_63idTemp = null;
        if(!pid_63id.equals("")){
         pid_63idTemp  = pid_63id;
        }
        String firstname_64id=  request.getParameter("firstname261");
            java.lang.String firstname_64idTemp = null;
        if(!firstname_64id.equals("")){
         firstname_64idTemp  = firstname_64id;
        }
        String lastname_65id=  request.getParameter("lastname263");
            java.lang.String lastname_65idTemp = null;
        if(!lastname_65id.equals("")){
         lastname_65idTemp  = lastname_65id;
        }
        String phone_66id=  request.getParameter("phone265");
            java.lang.String phone_66idTemp = null;
        if(!phone_66id.equals("")){
         phone_66idTemp  = phone_66id;
        }
        String email_67id=  request.getParameter("email267");
            java.lang.String email_67idTemp = null;
        if(!email_67id.equals("")){
         email_67idTemp  = email_67id;
        }
        String address_68id=  request.getParameter("address269");
            java.lang.String address_68idTemp = null;
        if(!address_68id.equals("")){
         address_68idTemp  = address_68id;
        }
        String dob_69id=  request.getParameter("dob271");
            java.lang.String dob_69idTemp = null;
        if(!dob_69id.equals("")){
         dob_69idTemp  = dob_69id;
        }
        %>
        <jsp:useBean id="Connection1Person_58id" scope="session" class="Connection.Person" />
        <%
        Connection1Person_58id.setState(state_59idTemp);
        Connection1Person_58id.setZip(zip_60idTemp);
        Connection1Person_58id.setSsn(ssn_61idTemp);
        Connection1Person_58id.setCity(city_62idTemp);
        Connection1Person_58id.setPid(pid_63idTemp);
        Connection1Person_58id.setFirstname(firstname_64idTemp);
        Connection1Person_58id.setLastname(lastname_65idTemp);
        Connection1Person_58id.setPhone(phone_66idTemp);
        Connection1Person_58id.setEmail(email_67idTemp);
        Connection1Person_58id.setAddress(address_68idTemp);
        Connection1Person_58id.setDob(dob_69idTemp);
        boolean updatePersonDetails246mtemp = sampleServiceProxyid.updatePersonDetails(Connection1Person_58id);
        String tempResultreturnp247 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updatePersonDetails246mtemp));
        %>
        <%= tempResultreturnp247 %>
        <%
break;
case 273:
        gotMethod = true;
        String tid_70id=  request.getParameter("tid276");
            java.lang.String tid_70idTemp = null;
        if(!tid_70id.equals("")){
         tid_70idTemp  = tid_70id;
        }
        String date_71id=  request.getParameter("date278");
            java.lang.String date_71idTemp = null;
        if(!date_71id.equals("")){
         date_71idTemp  = date_71id;
        }
        java.lang.String getActiveReservation273mtemp = sampleServiceProxyid.getActiveReservation(tid_70idTemp,date_71idTemp);
if(getActiveReservation273mtemp == null){
%>
<%=getActiveReservation273mtemp %>
<%
}else{
        String tempResultreturnp274 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getActiveReservation273mtemp));
        %>
        <%= tempResultreturnp274 %>
        <%
}
break;
case 280:
        gotMethod = true;
        String ticketNumber_72id=  request.getParameter("ticketNumber283");
            java.lang.String ticketNumber_72idTemp = null;
        if(!ticketNumber_72id.equals("")){
         ticketNumber_72idTemp  = ticketNumber_72id;
        }
        String radioString_73id=  request.getParameter("radioString285");
            java.lang.String radioString_73idTemp = null;
        if(!radioString_73id.equals("")){
         radioString_73idTemp  = radioString_73id;
        }
        String date_74id=  request.getParameter("date287");
            java.lang.String date_74idTemp = null;
        if(!date_74id.equals("")){
         date_74idTemp  = date_74id;
        }
        java.lang.String modifyReservation280mtemp = sampleServiceProxyid.modifyReservation(ticketNumber_72idTemp,radioString_73idTemp,date_74idTemp);
if(modifyReservation280mtemp == null){
%>
<%=modifyReservation280mtemp %>
<%
}else{
        String tempResultreturnp281 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(modifyReservation280mtemp));
        %>
        <%= tempResultreturnp281 %>
        <%
}
break;
case 289:
        gotMethod = true;
        String ticketNumber_75id=  request.getParameter("ticketNumber292");
            java.lang.String ticketNumber_75idTemp = null;
        if(!ticketNumber_75id.equals("")){
         ticketNumber_75idTemp  = ticketNumber_75id;
        }
        String status_76id=  request.getParameter("status294");
            java.lang.String status_76idTemp = null;
        if(!status_76id.equals("")){
         status_76idTemp  = status_76id;
        }
        String date_77id=  request.getParameter("date296");
            java.lang.String date_77idTemp = null;
        if(!date_77id.equals("")){
         date_77idTemp  = date_77id;
        }
        java.lang.String cancelReservation289mtemp = sampleServiceProxyid.cancelReservation(ticketNumber_75idTemp,status_76idTemp,date_77idTemp);
if(cancelReservation289mtemp == null){
%>
<%=cancelReservation289mtemp %>
<%
}else{
        String tempResultreturnp290 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(cancelReservation289mtemp));
        %>
        <%= tempResultreturnp290 %>
        <%
}
break;
case 298:
        gotMethod = true;
        String source_79id=  request.getParameter("source303");
            java.lang.String source_79idTemp = null;
        if(!source_79id.equals("")){
         source_79idTemp  = source_79id;
        }
        String alid_80id=  request.getParameter("alid305");
            java.lang.String alid_80idTemp = null;
        if(!alid_80id.equals("")){
         alid_80idTemp  = alid_80id;
        }
        String status_81id=  request.getParameter("status307");
            java.lang.String status_81idTemp = null;
        if(!status_81id.equals("")){
         status_81idTemp  = status_81id;
        }
        String depttime_82id=  request.getParameter("depttime309");
            java.lang.String depttime_82idTemp = null;
        if(!depttime_82id.equals("")){
         depttime_82idTemp  = depttime_82id;
        }
        String deptdate_83id=  request.getParameter("deptdate311");
            java.lang.String deptdate_83idTemp = null;
        if(!deptdate_83id.equals("")){
         deptdate_83idTemp  = deptdate_83id;
        }
        String arrvtime_84id=  request.getParameter("arrvtime313");
            java.lang.String arrvtime_84idTemp = null;
        if(!arrvtime_84id.equals("")){
         arrvtime_84idTemp  = arrvtime_84id;
        }
        String arrvdate_85id=  request.getParameter("arrvdate315");
            java.lang.String arrvdate_85idTemp = null;
        if(!arrvdate_85id.equals("")){
         arrvdate_85idTemp  = arrvdate_85id;
        }
        String aircraft_86id=  request.getParameter("aircraft317");
            java.lang.String aircraft_86idTemp = null;
        if(!aircraft_86id.equals("")){
         aircraft_86idTemp  = aircraft_86id;
        }
        String destination_87id=  request.getParameter("destination319");
            java.lang.String destination_87idTemp = null;
        if(!destination_87id.equals("")){
         destination_87idTemp  = destination_87id;
        }
        %>
        <jsp:useBean id="Connection1Flight_78id" scope="session" class="Connection.Flight" />
        <%
        Connection1Flight_78id.setSource(source_79idTemp);
        Connection1Flight_78id.setAlid(alid_80idTemp);
        Connection1Flight_78id.setStatus(status_81idTemp);
        Connection1Flight_78id.setDepttime(depttime_82idTemp);
        Connection1Flight_78id.setDeptdate(deptdate_83idTemp);
        Connection1Flight_78id.setArrvtime(arrvtime_84idTemp);
        Connection1Flight_78id.setArrvdate(arrvdate_85idTemp);
        Connection1Flight_78id.setAircraft(aircraft_86idTemp);
        Connection1Flight_78id.setDestination(destination_87idTemp);
        boolean flightExistence298mtemp = sampleServiceProxyid.flightExistence(Connection1Flight_78id);
        String tempResultreturnp299 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(flightExistence298mtemp));
        %>
        <%= tempResultreturnp299 %>
        <%
break;
case 321:
        gotMethod = true;
        String oAlid_88id=  request.getParameter("oAlid324");
            java.lang.String oAlid_88idTemp = null;
        if(!oAlid_88id.equals("")){
         oAlid_88idTemp  = oAlid_88id;
        }
        String oAircraft_89id=  request.getParameter("oAircraft326");
            java.lang.String oAircraft_89idTemp = null;
        if(!oAircraft_89id.equals("")){
         oAircraft_89idTemp  = oAircraft_89id;
        }
        String oDeptdate_90id=  request.getParameter("oDeptdate328");
            java.lang.String oDeptdate_90idTemp = null;
        if(!oDeptdate_90id.equals("")){
         oDeptdate_90idTemp  = oDeptdate_90id;
        }
        String source_92id=  request.getParameter("source332");
            java.lang.String source_92idTemp = null;
        if(!source_92id.equals("")){
         source_92idTemp  = source_92id;
        }
        String alid_93id=  request.getParameter("alid334");
            java.lang.String alid_93idTemp = null;
        if(!alid_93id.equals("")){
         alid_93idTemp  = alid_93id;
        }
        String status_94id=  request.getParameter("status336");
            java.lang.String status_94idTemp = null;
        if(!status_94id.equals("")){
         status_94idTemp  = status_94id;
        }
        String depttime_95id=  request.getParameter("depttime338");
            java.lang.String depttime_95idTemp = null;
        if(!depttime_95id.equals("")){
         depttime_95idTemp  = depttime_95id;
        }
        String deptdate_96id=  request.getParameter("deptdate340");
            java.lang.String deptdate_96idTemp = null;
        if(!deptdate_96id.equals("")){
         deptdate_96idTemp  = deptdate_96id;
        }
        String arrvtime_97id=  request.getParameter("arrvtime342");
            java.lang.String arrvtime_97idTemp = null;
        if(!arrvtime_97id.equals("")){
         arrvtime_97idTemp  = arrvtime_97id;
        }
        String arrvdate_98id=  request.getParameter("arrvdate344");
            java.lang.String arrvdate_98idTemp = null;
        if(!arrvdate_98id.equals("")){
         arrvdate_98idTemp  = arrvdate_98id;
        }
        String aircraft_99id=  request.getParameter("aircraft346");
            java.lang.String aircraft_99idTemp = null;
        if(!aircraft_99id.equals("")){
         aircraft_99idTemp  = aircraft_99id;
        }
        String destination_100id=  request.getParameter("destination348");
            java.lang.String destination_100idTemp = null;
        if(!destination_100id.equals("")){
         destination_100idTemp  = destination_100id;
        }
        %>
        <jsp:useBean id="Connection1Flight_91id" scope="session" class="Connection.Flight" />
        <%
        Connection1Flight_91id.setSource(source_92idTemp);
        Connection1Flight_91id.setAlid(alid_93idTemp);
        Connection1Flight_91id.setStatus(status_94idTemp);
        Connection1Flight_91id.setDepttime(depttime_95idTemp);
        Connection1Flight_91id.setDeptdate(deptdate_96idTemp);
        Connection1Flight_91id.setArrvtime(arrvtime_97idTemp);
        Connection1Flight_91id.setArrvdate(arrvdate_98idTemp);
        Connection1Flight_91id.setAircraft(aircraft_99idTemp);
        Connection1Flight_91id.setDestination(destination_100idTemp);
        boolean updateFlightDetails321mtemp = sampleServiceProxyid.updateFlightDetails(oAlid_88idTemp,oAircraft_89idTemp,oDeptdate_90idTemp,Connection1Flight_91id);
        String tempResultreturnp322 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updateFlightDetails321mtemp));
        %>
        <%= tempResultreturnp322 %>
        <%
break;
case 350:
        gotMethod = true;
        String name_101id=  request.getParameter("name353");
            java.lang.String name_101idTemp = null;
        if(!name_101id.equals("")){
         name_101idTemp  = name_101id;
        }
        String airline_102id=  request.getParameter("airline355");
            java.lang.String airline_102idTemp = null;
        if(!airline_102id.equals("")){
         airline_102idTemp  = airline_102id;
        }
        Connection.DisplayStaff[] searchEmployees350mtemp = sampleServiceProxyid.searchEmployees(name_101idTemp,airline_102idTemp);
if(searchEmployees350mtemp == null){
%>
<%=searchEmployees350mtemp %>
<%
}else{
        String tempreturnp351 = null;
        if(searchEmployees350mtemp != null){
        java.util.List listreturnp351= java.util.Arrays.asList(searchEmployees350mtemp);
        tempreturnp351 = listreturnp351.toString();
        }
        %>
        <%=tempreturnp351%>
        <%
}
break;
case 357:
        gotMethod = true;
        String sid_103id=  request.getParameter("sid360");
            java.lang.String sid_103idTemp = null;
        if(!sid_103id.equals("")){
         sid_103idTemp  = sid_103id;
        }
        String state_105id=  request.getParameter("state364");
            java.lang.String state_105idTemp = null;
        if(!state_105id.equals("")){
         state_105idTemp  = state_105id;
        }
        String zip_106id=  request.getParameter("zip366");
            java.lang.String zip_106idTemp = null;
        if(!zip_106id.equals("")){
         zip_106idTemp  = zip_106id;
        }
        String sid_107id=  request.getParameter("sid368");
            java.lang.String sid_107idTemp = null;
        if(!sid_107id.equals("")){
         sid_107idTemp  = sid_107id;
        }
        String alid_108id=  request.getParameter("alid370");
            java.lang.String alid_108idTemp = null;
        if(!alid_108id.equals("")){
         alid_108idTemp  = alid_108id;
        }
        String status_109id=  request.getParameter("status372");
            java.lang.String status_109idTemp = null;
        if(!status_109id.equals("")){
         status_109idTemp  = status_109id;
        }
        String city_110id=  request.getParameter("city374");
            java.lang.String city_110idTemp = null;
        if(!city_110id.equals("")){
         city_110idTemp  = city_110id;
        }
        String position_111id=  request.getParameter("position376");
            java.lang.String position_111idTemp = null;
        if(!position_111id.equals("")){
         position_111idTemp  = position_111id;
        }
        String firstname_112id=  request.getParameter("firstname378");
            java.lang.String firstname_112idTemp = null;
        if(!firstname_112id.equals("")){
         firstname_112idTemp  = firstname_112id;
        }
        String lastname_113id=  request.getParameter("lastname380");
            java.lang.String lastname_113idTemp = null;
        if(!lastname_113id.equals("")){
         lastname_113idTemp  = lastname_113id;
        }
        String phone_114id=  request.getParameter("phone382");
            java.lang.String phone_114idTemp = null;
        if(!phone_114id.equals("")){
         phone_114idTemp  = phone_114id;
        }
        String email_115id=  request.getParameter("email384");
            java.lang.String email_115idTemp = null;
        if(!email_115id.equals("")){
         email_115idTemp  = email_115id;
        }
        String hiredate_116id=  request.getParameter("hiredate386");
            java.lang.String hiredate_116idTemp = null;
        if(!hiredate_116id.equals("")){
         hiredate_116idTemp  = hiredate_116id;
        }
        String address_117id=  request.getParameter("address388");
            java.lang.String address_117idTemp = null;
        if(!address_117id.equals("")){
         address_117idTemp  = address_117id;
        }
        String dob_118id=  request.getParameter("dob390");
            java.lang.String dob_118idTemp = null;
        if(!dob_118id.equals("")){
         dob_118idTemp  = dob_118id;
        }
        String airline_119id=  request.getParameter("airline392");
            java.lang.String airline_119idTemp = null;
        if(!airline_119id.equals("")){
         airline_119idTemp  = airline_119id;
        }
        %>
        <jsp:useBean id="Connection1DisplayStaff_104id" scope="session" class="Connection.DisplayStaff" />
        <%
        Connection1DisplayStaff_104id.setState(state_105idTemp);
        Connection1DisplayStaff_104id.setZip(zip_106idTemp);
        Connection1DisplayStaff_104id.setSid(sid_107idTemp);
        Connection1DisplayStaff_104id.setAlid(alid_108idTemp);
        Connection1DisplayStaff_104id.setStatus(status_109idTemp);
        Connection1DisplayStaff_104id.setCity(city_110idTemp);
        Connection1DisplayStaff_104id.setPosition(position_111idTemp);
        Connection1DisplayStaff_104id.setFirstname(firstname_112idTemp);
        Connection1DisplayStaff_104id.setLastname(lastname_113idTemp);
        Connection1DisplayStaff_104id.setPhone(phone_114idTemp);
        Connection1DisplayStaff_104id.setEmail(email_115idTemp);
        Connection1DisplayStaff_104id.setHiredate(hiredate_116idTemp);
        Connection1DisplayStaff_104id.setAddress(address_117idTemp);
        Connection1DisplayStaff_104id.setDob(dob_118idTemp);
        Connection1DisplayStaff_104id.setAirline(airline_119idTemp);
        java.lang.String updateEmployeeDetails357mtemp = sampleServiceProxyid.updateEmployeeDetails(sid_103idTemp,Connection1DisplayStaff_104id);
if(updateEmployeeDetails357mtemp == null){
%>
<%=updateEmployeeDetails357mtemp %>
<%
}else{
        String tempResultreturnp358 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updateEmployeeDetails357mtemp));
        %>
        <%= tempResultreturnp358 %>
        <%
}
break;
case 394:
        gotMethod = true;
        String state_121id=  request.getParameter("state399");
            java.lang.String state_121idTemp = null;
        if(!state_121id.equals("")){
         state_121idTemp  = state_121id;
        }
        String zip_122id=  request.getParameter("zip401");
            java.lang.String zip_122idTemp = null;
        if(!zip_122id.equals("")){
         zip_122idTemp  = zip_122id;
        }
        String ssn_123id=  request.getParameter("ssn403");
            java.lang.String ssn_123idTemp = null;
        if(!ssn_123id.equals("")){
         ssn_123idTemp  = ssn_123id;
        }
        String city_124id=  request.getParameter("city405");
            java.lang.String city_124idTemp = null;
        if(!city_124id.equals("")){
         city_124idTemp  = city_124id;
        }
        String pid_125id=  request.getParameter("pid407");
            java.lang.String pid_125idTemp = null;
        if(!pid_125id.equals("")){
         pid_125idTemp  = pid_125id;
        }
        String firstname_126id=  request.getParameter("firstname409");
            java.lang.String firstname_126idTemp = null;
        if(!firstname_126id.equals("")){
         firstname_126idTemp  = firstname_126id;
        }
        String lastname_127id=  request.getParameter("lastname411");
            java.lang.String lastname_127idTemp = null;
        if(!lastname_127id.equals("")){
         lastname_127idTemp  = lastname_127id;
        }
        String phone_128id=  request.getParameter("phone413");
            java.lang.String phone_128idTemp = null;
        if(!phone_128id.equals("")){
         phone_128idTemp  = phone_128id;
        }
        String email_129id=  request.getParameter("email415");
            java.lang.String email_129idTemp = null;
        if(!email_129id.equals("")){
         email_129idTemp  = email_129id;
        }
        String address_130id=  request.getParameter("address417");
            java.lang.String address_130idTemp = null;
        if(!address_130id.equals("")){
         address_130idTemp  = address_130id;
        }
        String dob_131id=  request.getParameter("dob419");
            java.lang.String dob_131idTemp = null;
        if(!dob_131id.equals("")){
         dob_131idTemp  = dob_131id;
        }
        %>
        <jsp:useBean id="Connection1Person_120id" scope="session" class="Connection.Person" />
        <%
        Connection1Person_120id.setState(state_121idTemp);
        Connection1Person_120id.setZip(zip_122idTemp);
        Connection1Person_120id.setSsn(ssn_123idTemp);
        Connection1Person_120id.setCity(city_124idTemp);
        Connection1Person_120id.setPid(pid_125idTemp);
        Connection1Person_120id.setFirstname(firstname_126idTemp);
        Connection1Person_120id.setLastname(lastname_127idTemp);
        Connection1Person_120id.setPhone(phone_128idTemp);
        Connection1Person_120id.setEmail(email_129idTemp);
        Connection1Person_120id.setAddress(address_130idTemp);
        Connection1Person_120id.setDob(dob_131idTemp);
        java.lang.String createPerson394mtemp = sampleServiceProxyid.createPerson(Connection1Person_120id);
if(createPerson394mtemp == null){
%>
<%=createPerson394mtemp %>
<%
}else{
        String tempResultreturnp395 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(createPerson394mtemp));
        %>
        <%= tempResultreturnp395 %>
        <%
}
break;
case 421:
        gotMethod = true;
        String newpassword_132id=  request.getParameter("newpassword424");
            java.lang.String newpassword_132idTemp = null;
        if(!newpassword_132id.equals("")){
         newpassword_132idTemp  = newpassword_132id;
        }
        String pid_133id=  request.getParameter("pid426");
            java.lang.String pid_133idTemp = null;
        if(!pid_133id.equals("")){
         pid_133idTemp  = pid_133id;
        }
        boolean changePassword421mtemp = sampleServiceProxyid.changePassword(newpassword_132idTemp,pid_133idTemp);
        String tempResultreturnp422 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(changePassword421mtemp));
        %>
        <%= tempResultreturnp422 %>
        <%
break;
case 428:
        gotMethod = true;
        String username_134id=  request.getParameter("username431");
            java.lang.String username_134idTemp = null;
        if(!username_134id.equals("")){
         username_134idTemp  = username_134id;
        }
        String password_135id=  request.getParameter("password433");
            java.lang.String password_135idTemp = null;
        if(!password_135id.equals("")){
         password_135idTemp  = password_135id;
        }
        java.lang.String login428mtemp = sampleServiceProxyid.login(username_134idTemp,password_135idTemp);
if(login428mtemp == null){
%>
<%=login428mtemp %>
<%
}else{
        String tempResultreturnp429 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(login428mtemp));
        %>
        <%= tempResultreturnp429 %>
        <%
}
break;
case 435:
        gotMethod = true;
        String sid_136id=  request.getParameter("sid448");
            java.lang.String sid_136idTemp = null;
        if(!sid_136id.equals("")){
         sid_136idTemp  = sid_136id;
        }
        Connection.Staff getEmployee435mtemp = sampleServiceProxyid.getEmployee(sid_136idTemp);
if(getEmployee435mtemp == null){
%>
<%=getEmployee435mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">position:</TD>
<TD>
<%
if(getEmployee435mtemp != null){
java.lang.String typeposition438 = getEmployee435mtemp.getPosition();
        String tempResultposition438 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeposition438));
        %>
        <%= tempResultposition438 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">status:</TD>
<TD>
<%
if(getEmployee435mtemp != null){
java.lang.String typestatus440 = getEmployee435mtemp.getStatus();
        String tempResultstatus440 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestatus440));
        %>
        <%= tempResultstatus440 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">sid:</TD>
<TD>
<%
if(getEmployee435mtemp != null){
java.lang.String typesid442 = getEmployee435mtemp.getSid();
        String tempResultsid442 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typesid442));
        %>
        <%= tempResultsid442 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">alid:</TD>
<TD>
<%
if(getEmployee435mtemp != null){
java.lang.String typealid444 = getEmployee435mtemp.getAlid();
        String tempResultalid444 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typealid444));
        %>
        <%= tempResultalid444 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">hiredate:</TD>
<TD>
<%
if(getEmployee435mtemp != null){
java.lang.String typehiredate446 = getEmployee435mtemp.getHiredate();
        String tempResulthiredate446 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typehiredate446));
        %>
        <%= tempResulthiredate446 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 450:
        gotMethod = true;
        String alid_137id=  request.getParameter("alid471");
            java.lang.String alid_137idTemp = null;
        if(!alid_137id.equals("")){
         alid_137idTemp  = alid_137id;
        }
        String date_138id=  request.getParameter("date473");
            java.lang.String date_138idTemp = null;
        if(!date_138id.equals("")){
         date_138idTemp  = date_138id;
        }
        Connection.Flight updateFlight450mtemp = sampleServiceProxyid.updateFlight(alid_137idTemp,date_138idTemp);
if(updateFlight450mtemp == null){
%>
<%=updateFlight450mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">source:</TD>
<TD>
<%
if(updateFlight450mtemp != null){
java.lang.String typesource453 = updateFlight450mtemp.getSource();
        String tempResultsource453 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typesource453));
        %>
        <%= tempResultsource453 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">alid:</TD>
<TD>
<%
if(updateFlight450mtemp != null){
java.lang.String typealid455 = updateFlight450mtemp.getAlid();
        String tempResultalid455 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typealid455));
        %>
        <%= tempResultalid455 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">status:</TD>
<TD>
<%
if(updateFlight450mtemp != null){
java.lang.String typestatus457 = updateFlight450mtemp.getStatus();
        String tempResultstatus457 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestatus457));
        %>
        <%= tempResultstatus457 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">depttime:</TD>
<TD>
<%
if(updateFlight450mtemp != null){
java.lang.String typedepttime459 = updateFlight450mtemp.getDepttime();
        String tempResultdepttime459 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedepttime459));
        %>
        <%= tempResultdepttime459 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">deptdate:</TD>
<TD>
<%
if(updateFlight450mtemp != null){
java.lang.String typedeptdate461 = updateFlight450mtemp.getDeptdate();
        String tempResultdeptdate461 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedeptdate461));
        %>
        <%= tempResultdeptdate461 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">arrvtime:</TD>
<TD>
<%
if(updateFlight450mtemp != null){
java.lang.String typearrvtime463 = updateFlight450mtemp.getArrvtime();
        String tempResultarrvtime463 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typearrvtime463));
        %>
        <%= tempResultarrvtime463 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">arrvdate:</TD>
<TD>
<%
if(updateFlight450mtemp != null){
java.lang.String typearrvdate465 = updateFlight450mtemp.getArrvdate();
        String tempResultarrvdate465 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typearrvdate465));
        %>
        <%= tempResultarrvdate465 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">aircraft:</TD>
<TD>
<%
if(updateFlight450mtemp != null){
java.lang.String typeaircraft467 = updateFlight450mtemp.getAircraft();
        String tempResultaircraft467 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeaircraft467));
        %>
        <%= tempResultaircraft467 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">destination:</TD>
<TD>
<%
if(updateFlight450mtemp != null){
java.lang.String typedestination469 = updateFlight450mtemp.getDestination();
        String tempResultdestination469 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedestination469));
        %>
        <%= tempResultdestination469 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 475:
        gotMethod = true;
        String source_140id=  request.getParameter("source480");
            java.lang.String source_140idTemp = null;
        if(!source_140id.equals("")){
         source_140idTemp  = source_140id;
        }
        String alid_141id=  request.getParameter("alid482");
            java.lang.String alid_141idTemp = null;
        if(!alid_141id.equals("")){
         alid_141idTemp  = alid_141id;
        }
        String status_142id=  request.getParameter("status484");
            java.lang.String status_142idTemp = null;
        if(!status_142id.equals("")){
         status_142idTemp  = status_142id;
        }
        String depttime_143id=  request.getParameter("depttime486");
            java.lang.String depttime_143idTemp = null;
        if(!depttime_143id.equals("")){
         depttime_143idTemp  = depttime_143id;
        }
        String deptdate_144id=  request.getParameter("deptdate488");
            java.lang.String deptdate_144idTemp = null;
        if(!deptdate_144id.equals("")){
         deptdate_144idTemp  = deptdate_144id;
        }
        String arrvtime_145id=  request.getParameter("arrvtime490");
            java.lang.String arrvtime_145idTemp = null;
        if(!arrvtime_145id.equals("")){
         arrvtime_145idTemp  = arrvtime_145id;
        }
        String arrvdate_146id=  request.getParameter("arrvdate492");
            java.lang.String arrvdate_146idTemp = null;
        if(!arrvdate_146id.equals("")){
         arrvdate_146idTemp  = arrvdate_146id;
        }
        String aircraft_147id=  request.getParameter("aircraft494");
            java.lang.String aircraft_147idTemp = null;
        if(!aircraft_147id.equals("")){
         aircraft_147idTemp  = aircraft_147id;
        }
        String destination_148id=  request.getParameter("destination496");
            java.lang.String destination_148idTemp = null;
        if(!destination_148id.equals("")){
         destination_148idTemp  = destination_148id;
        }
        %>
        <jsp:useBean id="Connection1Flight_139id" scope="session" class="Connection.Flight" />
        <%
        Connection1Flight_139id.setSource(source_140idTemp);
        Connection1Flight_139id.setAlid(alid_141idTemp);
        Connection1Flight_139id.setStatus(status_142idTemp);
        Connection1Flight_139id.setDepttime(depttime_143idTemp);
        Connection1Flight_139id.setDeptdate(deptdate_144idTemp);
        Connection1Flight_139id.setArrvtime(arrvtime_145idTemp);
        Connection1Flight_139id.setArrvdate(arrvdate_146idTemp);
        Connection1Flight_139id.setAircraft(aircraft_147idTemp);
        Connection1Flight_139id.setDestination(destination_148idTemp);
        String aircraft_150id=  request.getParameter("aircraft500");
            java.lang.String aircraft_150idTemp = null;
        if(!aircraft_150id.equals("")){
         aircraft_150idTemp  = aircraft_150id;
        }
        String capacity_151id=  request.getParameter("capacity502");
            java.lang.String capacity_151idTemp = null;
        if(!capacity_151id.equals("")){
         capacity_151idTemp  = capacity_151id;
        }
        String alid_152id=  request.getParameter("alid504");
            java.lang.String alid_152idTemp = null;
        if(!alid_152id.equals("")){
         alid_152idTemp  = alid_152id;
        }
        String name_153id=  request.getParameter("name506");
            java.lang.String name_153idTemp = null;
        if(!name_153id.equals("")){
         name_153idTemp  = name_153id;
        }
        String crewcount_154id=  request.getParameter("crewcount508");
            java.lang.String crewcount_154idTemp = null;
        if(!crewcount_154id.equals("")){
         crewcount_154idTemp  = crewcount_154id;
        }
        %>
        <jsp:useBean id="Connection1AirLines_149id" scope="session" class="Connection.AirLines" />
        <%
        Connection1AirLines_149id.setAircraft(aircraft_150idTemp);
        Connection1AirLines_149id.setCapacity(capacity_151idTemp);
        Connection1AirLines_149id.setAlid(alid_152idTemp);
        Connection1AirLines_149id.setName(name_153idTemp);
        Connection1AirLines_149id.setCrewcount(crewcount_154idTemp);
        boolean createFlight475mtemp = sampleServiceProxyid.createFlight(Connection1Flight_139id,Connection1AirLines_149id);
        String tempResultreturnp476 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(createFlight475mtemp));
        %>
        <%= tempResultreturnp476 %>
        <%
break;
case 510:
        gotMethod = true;
        String sid_155id=  request.getParameter("sid513");
            java.lang.String sid_155idTemp = null;
        if(!sid_155id.equals("")){
         sid_155idTemp  = sid_155id;
        }
        java.lang.String deleteEmp510mtemp = sampleServiceProxyid.deleteEmp(sid_155idTemp);
if(deleteEmp510mtemp == null){
%>
<%=deleteEmp510mtemp %>
<%
}else{
        String tempResultreturnp511 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(deleteEmp510mtemp));
        %>
        <%= tempResultreturnp511 %>
        <%
}
break;
case 515:
        gotMethod = true;
        String position_157id=  request.getParameter("position520");
            java.lang.String position_157idTemp = null;
        if(!position_157id.equals("")){
         position_157idTemp  = position_157id;
        }
        String status_158id=  request.getParameter("status522");
            java.lang.String status_158idTemp = null;
        if(!status_158id.equals("")){
         status_158idTemp  = status_158id;
        }
        String sid_159id=  request.getParameter("sid524");
            java.lang.String sid_159idTemp = null;
        if(!sid_159id.equals("")){
         sid_159idTemp  = sid_159id;
        }
        String alid_160id=  request.getParameter("alid526");
            java.lang.String alid_160idTemp = null;
        if(!alid_160id.equals("")){
         alid_160idTemp  = alid_160id;
        }
        String hiredate_161id=  request.getParameter("hiredate528");
            java.lang.String hiredate_161idTemp = null;
        if(!hiredate_161id.equals("")){
         hiredate_161idTemp  = hiredate_161id;
        }
        %>
        <jsp:useBean id="Connection1Staff_156id" scope="session" class="Connection.Staff" />
        <%
        Connection1Staff_156id.setPosition(position_157idTemp);
        Connection1Staff_156id.setStatus(status_158idTemp);
        Connection1Staff_156id.setSid(sid_159idTemp);
        Connection1Staff_156id.setAlid(alid_160idTemp);
        Connection1Staff_156id.setHiredate(hiredate_161idTemp);
        java.lang.String createStaff515mtemp = sampleServiceProxyid.createStaff(Connection1Staff_156id);
if(createStaff515mtemp == null){
%>
<%=createStaff515mtemp %>
<%
}else{
        String tempResultreturnp516 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(createStaff515mtemp));
        %>
        <%= tempResultreturnp516 %>
        <%
}
break;
case 530:
        gotMethod = true;
        String cid_162id=  request.getParameter("cid549");
            java.lang.String cid_162idTemp = null;
        if(!cid_162id.equals("")){
         cid_162idTemp  = cid_162id;
        }
        Connection.Customer getCustomer530mtemp = sampleServiceProxyid.getCustomer(cid_162idTemp);
if(getCustomer530mtemp == null){
%>
<%=getCustomer530mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nationality:</TD>
<TD>
<%
if(getCustomer530mtemp != null){
java.lang.String typenationality533 = getCustomer530mtemp.getNationality();
        String tempResultnationality533 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenationality533));
        %>
        <%= tempResultnationality533 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">ticketnum:</TD>
<TD>
<%
if(getCustomer530mtemp != null){
java.lang.String typeticketnum535 = getCustomer530mtemp.getTicketnum();
        String tempResultticketnum535 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeticketnum535));
        %>
        <%= tempResultticketnum535 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">date:</TD>
<TD>
<%
if(getCustomer530mtemp != null){
java.lang.String typedate537 = getCustomer530mtemp.getDate();
        String tempResultdate537 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedate537));
        %>
        <%= tempResultdate537 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">alid:</TD>
<TD>
<%
if(getCustomer530mtemp != null){
java.lang.String typealid539 = getCustomer530mtemp.getAlid();
        String tempResultalid539 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typealid539));
        %>
        <%= tempResultalid539 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">status:</TD>
<TD>
<%
if(getCustomer530mtemp != null){
java.lang.String typestatus541 = getCustomer530mtemp.getStatus();
        String tempResultstatus541 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestatus541));
        %>
        <%= tempResultstatus541 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">cid:</TD>
<TD>
<%
if(getCustomer530mtemp != null){
java.lang.String typecid543 = getCustomer530mtemp.getCid();
        String tempResultcid543 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecid543));
        %>
        <%= tempResultcid543 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">aircraft:</TD>
<TD>
<%
if(getCustomer530mtemp != null){
java.lang.String typeaircraft545 = getCustomer530mtemp.getAircraft();
        String tempResultaircraft545 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeaircraft545));
        %>
        <%= tempResultaircraft545 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">passport:</TD>
<TD>
<%
if(getCustomer530mtemp != null){
java.lang.String typepassport547 = getCustomer530mtemp.getPassport();
        String tempResultpassport547 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassport547));
        %>
        <%= tempResultpassport547 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 551:
        gotMethod = true;
        String pid_163id=  request.getParameter("pid576");
            java.lang.String pid_163idTemp = null;
        if(!pid_163id.equals("")){
         pid_163idTemp  = pid_163id;
        }
        Connection.Person getPerson551mtemp = sampleServiceProxyid.getPerson(pid_163idTemp);
if(getPerson551mtemp == null){
%>
<%=getPerson551mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">state:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typestate554 = getPerson551mtemp.getState();
        String tempResultstate554 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestate554));
        %>
        <%= tempResultstate554 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">zip:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typezip556 = getPerson551mtemp.getZip();
        String tempResultzip556 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typezip556));
        %>
        <%= tempResultzip556 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">ssn:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typessn558 = getPerson551mtemp.getSsn();
        String tempResultssn558 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typessn558));
        %>
        <%= tempResultssn558 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">city:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typecity560 = getPerson551mtemp.getCity();
        String tempResultcity560 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecity560));
        %>
        <%= tempResultcity560 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">pid:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typepid562 = getPerson551mtemp.getPid();
        String tempResultpid562 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepid562));
        %>
        <%= tempResultpid562 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstname:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typefirstname564 = getPerson551mtemp.getFirstname();
        String tempResultfirstname564 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstname564));
        %>
        <%= tempResultfirstname564 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastname:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typelastname566 = getPerson551mtemp.getLastname();
        String tempResultlastname566 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastname566));
        %>
        <%= tempResultlastname566 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">phone:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typephone568 = getPerson551mtemp.getPhone();
        String tempResultphone568 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typephone568));
        %>
        <%= tempResultphone568 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">email:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typeemail570 = getPerson551mtemp.getEmail();
        String tempResultemail570 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeemail570));
        %>
        <%= tempResultemail570 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">address:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typeaddress572 = getPerson551mtemp.getAddress();
        String tempResultaddress572 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeaddress572));
        %>
        <%= tempResultaddress572 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">dob:</TD>
<TD>
<%
if(getPerson551mtemp != null){
java.lang.String typedob574 = getPerson551mtemp.getDob();
        String tempResultdob574 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedob574));
        %>
        <%= tempResultdob574 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 578:
        gotMethod = true;
        String ticketnumber_164id=  request.getParameter("ticketnumber581");
            java.lang.String ticketnumber_164idTemp = null;
        if(!ticketnumber_164id.equals("")){
         ticketnumber_164idTemp  = ticketnumber_164id;
        }
        String date_165id=  request.getParameter("date583");
            java.lang.String date_165idTemp = null;
        if(!date_165id.equals("")){
         date_165idTemp  = date_165id;
        }
        java.lang.String viewTicket578mtemp = sampleServiceProxyid.viewTicket(ticketnumber_164idTemp,date_165idTemp);
if(viewTicket578mtemp == null){
%>
<%=viewTicket578mtemp %>
<%
}else{
        String tempResultreturnp579 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(viewTicket578mtemp));
        %>
        <%= tempResultreturnp579 %>
        <%
}
break;
case 585:
        gotMethod = true;
        String alid_166id=  request.getParameter("alid588");
            java.lang.String alid_166idTemp = null;
        if(!alid_166id.equals("")){
         alid_166idTemp  = alid_166id;
        }
        String date_167id=  request.getParameter("date590");
            java.lang.String date_167idTemp = null;
        if(!date_167id.equals("")){
         date_167idTemp  = date_167id;
        }
        String source_168id=  request.getParameter("source592");
            java.lang.String source_168idTemp = null;
        if(!source_168id.equals("")){
         source_168idTemp  = source_168id;
        }
        String destination_169id=  request.getParameter("destination594");
            java.lang.String destination_169idTemp = null;
        if(!destination_169id.equals("")){
         destination_169idTemp  = destination_169id;
        }
        Connection.Flight[] getFlights585mtemp = sampleServiceProxyid.getFlights(alid_166idTemp,date_167idTemp,source_168idTemp,destination_169idTemp);
if(getFlights585mtemp == null){
%>
<%=getFlights585mtemp %>
<%
}else{
        String tempreturnp586 = null;
        if(getFlights585mtemp != null){
        java.util.List listreturnp586= java.util.Arrays.asList(getFlights585mtemp);
        tempreturnp586 = listreturnp586.toString();
        }
        %>
        <%=tempreturnp586%>
        <%
}
break;
case 596:
        gotMethod = true;
        String state_171id=  request.getParameter("state601");
            java.lang.String state_171idTemp = null;
        if(!state_171id.equals("")){
         state_171idTemp  = state_171id;
        }
        String zip_172id=  request.getParameter("zip603");
            java.lang.String zip_172idTemp = null;
        if(!zip_172id.equals("")){
         zip_172idTemp  = zip_172id;
        }
        String ssn_173id=  request.getParameter("ssn605");
            java.lang.String ssn_173idTemp = null;
        if(!ssn_173id.equals("")){
         ssn_173idTemp  = ssn_173id;
        }
        String city_174id=  request.getParameter("city607");
            java.lang.String city_174idTemp = null;
        if(!city_174id.equals("")){
         city_174idTemp  = city_174id;
        }
        String pid_175id=  request.getParameter("pid609");
            java.lang.String pid_175idTemp = null;
        if(!pid_175id.equals("")){
         pid_175idTemp  = pid_175id;
        }
        String firstname_176id=  request.getParameter("firstname611");
            java.lang.String firstname_176idTemp = null;
        if(!firstname_176id.equals("")){
         firstname_176idTemp  = firstname_176id;
        }
        String lastname_177id=  request.getParameter("lastname613");
            java.lang.String lastname_177idTemp = null;
        if(!lastname_177id.equals("")){
         lastname_177idTemp  = lastname_177id;
        }
        String phone_178id=  request.getParameter("phone615");
            java.lang.String phone_178idTemp = null;
        if(!phone_178id.equals("")){
         phone_178idTemp  = phone_178id;
        }
        String email_179id=  request.getParameter("email617");
            java.lang.String email_179idTemp = null;
        if(!email_179id.equals("")){
         email_179idTemp  = email_179id;
        }
        String address_180id=  request.getParameter("address619");
            java.lang.String address_180idTemp = null;
        if(!address_180id.equals("")){
         address_180idTemp  = address_180id;
        }
        String dob_181id=  request.getParameter("dob621");
            java.lang.String dob_181idTemp = null;
        if(!dob_181id.equals("")){
         dob_181idTemp  = dob_181id;
        }
        %>
        <jsp:useBean id="Connection1Person_170id" scope="session" class="Connection.Person" />
        <%
        Connection1Person_170id.setState(state_171idTemp);
        Connection1Person_170id.setZip(zip_172idTemp);
        Connection1Person_170id.setSsn(ssn_173idTemp);
        Connection1Person_170id.setCity(city_174idTemp);
        Connection1Person_170id.setPid(pid_175idTemp);
        Connection1Person_170id.setFirstname(firstname_176idTemp);
        Connection1Person_170id.setLastname(lastname_177idTemp);
        Connection1Person_170id.setPhone(phone_178idTemp);
        Connection1Person_170id.setEmail(email_179idTemp);
        Connection1Person_170id.setAddress(address_180idTemp);
        Connection1Person_170id.setDob(dob_181idTemp);
        boolean updatePerson596mtemp = sampleServiceProxyid.updatePerson(Connection1Person_170id);
        String tempResultreturnp597 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updatePerson596mtemp));
        %>
        <%= tempResultreturnp597 %>
        <%
break;
}
} catch (Exception e) { 
%>
exception: <%= e %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>