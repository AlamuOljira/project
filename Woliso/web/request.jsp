<%-- 
    Document   : request
    Created on : May 2, 2018, 9:01:15 AM
    Author     : Abdii-isaa
--%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.util.Date" %>
<%@page import="Woliso.Registration" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome</title>
        <%
       request.getSession(false);
       
       String rrr=session.getAttribute("type").toString();
       if(!rrr.equals("Teacher"))
           response.sendRedirect("login.jsp");
       
    %>

	<!--sa calendar-->	
		<script type="text/javascript" src="js/datepicker.js"></script>
        <link href="css/demo.css"       rel="stylesheet" type="text/css" />
        <link href="css/datepicker.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		//<![CDATA[

		/*
				A "Reservation Date" example using two datePickers
				--------------------------------------------------

				* Functionality

				1. When the page loads:
						- We clear the value of the two inputs (to clear any values cached by the browser)
						- We set an "onchange" event handler on the startDate input to call the setReservationDates function
				2. When a start date is selected
						- We set the low range of the endDate datePicker to be the start date the user has just selected
						- If the endDate input already has a date stipulated and the date falls before the new start date then we clear the input's value

				* Caveats (aren't there always)

				- This demo has been written for dates that have NOT been split across three inputs

		*/

		function makeTwoChars(inp) {
				return String(inp).length < 2 ? "0" + inp : inp;
		}

		function initialiseInputs() {
				// Clear any old values from the inputs (that might be cached by the browser after a page reload)
				document.getElementById("sd").value = "";
				document.getElementById("ed").value = "";

				// Add the onchange event handler to the start date input
				datePickerController.addEvent(document.getElementById("sd"), "change", setReservationDates);
		}

		var initAttempts = 0;

		function setReservationDates(e) {
				// Internet Explorer will not have created the datePickers yet so we poll the datePickerController Object using a setTimeout
				// until they become available (a maximum of ten times in case something has gone horribly wrong)

				try {
						var sd = datePickerController.getDatePicker("sd");
						var ed = datePickerController.getDatePicker("ed");
				} catch (err) {
						if(initAttempts++ < 10) setTimeout("setReservationDates()", 50);
						return;
				}

				// Check the value of the input is a date of the correct format
				var dt = datePickerController.dateFormat(this.value, sd.format.charAt(0) == "m");

				// If the input's value cannot be parsed as a valid date then return
				if(dt == 0) return;

				// At this stage we have a valid YYYYMMDD date

				// Grab the value set within the endDate input and parse it using the dateFormat method
				// N.B: The second parameter to the dateFormat function, if TRUE, tells the function to favour the m-d-y date format
				var edv = datePickerController.dateFormat(document.getElementById("ed").value, ed.format.charAt(0) == "m");

				// Set the low range of the second datePicker to be the date parsed from the first
				ed.setRangeLow( dt );
				
				// If theres a value already present within the end date input and it's smaller than the start date
				// then clear the end date value
				if(edv < dt) {
						document.getElementById("ed").value = "";
				}
		}

		function removeInputEvents() {
				// Remove the onchange event handler set within the function initialiseInputs
				datePickerController.removeEvent(document.getElementById("sd"), "change", setReservationDates);
		}

		datePickerController.addEvent(window, 'load', initialiseInputs);
		datePickerController.addEvent(window, 'unload', removeInputEvents);

		//]]>
		</script> 

</head>
    </head>
    <body>
        <div id="jh">
        <form bgcolor="#99cccc" id="form1" name="form1" method="post" action="request.jsp" background-image=url("pho/13.jpg")>
	<i><h2>Fill the following Field With Correct Information!!!</h2></i> 
		 <table bgcolor="khaki" width="550" cellspacing="" cellpadding="2px" height="100%">
		
		<tr><td align="right"><strong>Room ID:</strong></td><td>
			<input style="width: 165px; margin-left: 15px; border: 3px double #CCCCCC; padding:5px 10px;"type="text" name="h" id="h" required placeholder="Room ID" /></td>
		</tr>
		
		<tr>
           <td align="right"><strong>Start time     :</strong></td><td width="300">
			<select name="i" size="0" required style="width: 165px; margin-left: 15px; border: 3px double #CCCCCC; padding:5px 10px;">
					  <option value="">---Select-Time---</option>					 
					  <option value="2:00">2:00</option>
					  <option value="2:30">2:30</option>
                                          <option value="3:00">3:00</option>
					  <option value="3:30">3:30</option>
                                          <option value="4:00">4:00</option>
					  <option value="4:30">4:30</option>
                                          <option value="5:00">5:00</option>
					  <option value="5:30">5:30</option>
					 <option value="6:00">6:00</option>
					  <option value="6:30">6:30</option>
                                          <option value="7:00">7:00</option>
					  <option value="7:30">7:30</option>
                                           <option value="8:00">8:00</option>
					  <option value="8:30">8:30</option>
                                           <option value="9:00">9:00</option>
					  <option value="9:30">9:30</option>
                                          <option value="10:00">10:00</option>
					  <option value="10:30">10:30</option>
                                           <option value="11:00">11:00</option>
					  <option value="11:30">11:30</option>
                                           <option value="12:00">12:00</option>
					 </select><font size="2">
				</td>
                </tr>
                <tr>
           <td align="right"><strong>End time:</strong></td><td width="300">
			<select name="j" size="0" required style="width: 165px; margin-left: 15px; border: 3px double #CCCCCC; padding:5px 10px;">
					  <option value="">---Select-Time---</option>
					  <option value="2:00">2:00</option>
					  <option value="2:30">2:30</option>
                                          <option value="3:00">3:00</option>
					  <option value="3:30">3:30</option>
                                          <option value="4:00">4:00</option>
					  <option value="4:30">4:30</option>
                                          <option value="5:00">5:00</option>
					  <option value="5:30">5:30</option>
					 <option value="6:00">6:00</option>
					  <option value="6:30">6:30</option>
                                          <option value="7:00">7:00</option>
					  <option value="7:30">7:30</option>
                                           <option value="8:00">8:00</option>
					  <option value="8:30">8:30</option>
                                           <option value="9:00">9:00</option>
					  <option value="9:30">9:30</option>
                                          <option value="10:00">10:00</option>
					  <option value="10:30">10:30</option>
                                           <option value="11:00">11:00</option>
					  <option value="11:30">11:30</option>
                                           <option value="12:00">12:00</option>
					 </select><font size="2">
				</td>
                </tr>
                
                <tr><td align="right" ><strong>Date:</strong></td>
           <td width="300">
			<input required id="wow" name="l" type="text" class="w8em format-d-m-y highlight-days-67 range-low-today"  value="" maxlength="20" readonly="readonly" style="width: 165px; margin-left: 15px; border: 3px double #CCCCCC; padding:5px 10px;"/>
           </td></tr>
		
		
		
			
                
		
			
		
		<tr><td>
                <tr><td></td>
             <td align="right"><input type="submit" name="submit" value="Send Request" /> 
              <td><input type="reset" name="cmdreset" value="Clear"/></td>
        </tr>
				
				
			
	
		
	</table></form>
            
        </div><div id="ve">
            <h1>Please check if the class is free or not!!</h1>
            <a href="view.jsp"><button>view</button></a></div>
 
          
    </body>
</html>
<style> 
#jh
{
margin-left:50%; 
background-color:lightskyblue; 
font-size:20px;
margin-right:0%;

}
#ve
{
margin-left:0%; 
background-color:pink; 
font-size:20px;
margin-right:50%;
margin-top:-20%;


}
#wow{
   background: white; 
}
body{
    background-image: url("i/index.jpg");
}
</style>
 <%if("POST".equalsIgnoreCase(request.getMethod())){
         SimpleDateFormat df = new SimpleDateFormat("HH:mm");
        df.setTimeZone(TimeZone.getTimeZone("UTC"));
            String st=null;
            
 String mysqlconnector="jdbc:mysql://localhost:3306/woliso";
Connection con=null;
Statement stmt=null;
String name=null;
Date d=new Date();

	 Class.forName("com.mysql.jdbc.Driver");
	 con=DriverManager.getConnection(mysqlconnector,"root","");
            
            if(request.getParameter("submit")!=null){
              if(request.getParameter("submit")!="submit"){ 
                  
                  String RID=request.getParameter("h");
                 st=request.getParameter("i");
                String et=request.getParameter("j");
                String CID=request.getParameter("k");
                String Date=request.getParameter("l");
                session=request.getSession();
            String name_of_user=session.getAttribute("login").toString(); 
       int counter=0;
       Date d1=df.parse(st);
       Date d2=df.parse(et);
       if(d1.getTime()>=d2.getTime())
         out.println("<script>alert('Impossible Time selection!')</script>");
       else{
           
          stmt=con.createStatement();
          String sql,sql2;
          
        ResultSet rs;
        int count=0;
            sql2="select * from room_assign where Room_ID='"+RID+"' and Start_time='"+st+"' and End_time='"+et+"'and Status='"+"Occupied"+"'";
            rs=stmt.executeQuery(sql2);
            while(rs.next()){
               count++; 
            }
             if(!stmt.executeQuery("Select * from room where Room_ID='"+RID+"'").next())
                 out.println("<script>alert('Invalid room ID!')</script>");
                  else{
                 if(Date.isEmpty())
                     out.println("<script>alert('DATE IS REQUIRED TO GET CLASS PLS FILL IT!')</script>");
                 else{
        sql="select * from room_assign where Room_ID='"+RID+"' and Date='"+Date+"' order by Start_time";
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            String id=rs.getString("Room_ID");
            String date=rs.getString("Date");
           String startTime=rs.getString("Start_time");
            String endTime=rs.getString("End_time");
            String status=rs.getString("Status");
             Date d4 = df.parse(startTime); //date 1
             Date d5 = df.parse(endTime);
           counter++;
            if(count>0){
               out.println("<script>alert('This class is reserved for other Teacher at this time!')</script>");
                break;
                        }
            
        
              else if(d4.getTime()>d1.getTime() && d5.getTime()>d2.getTime()&& d4.getTime()<d2.getTime()&& status.equals("Occupied")){
                 out.println("<script>alert('Time is overlapeed with other class time of the same room 1')</script>");
               break;
            } else if(d4.getTime()<d1.getTime() && d5.getTime()>d2.getTime()&& status.equals("Occupied")){
                 out.println("<script>alert('Time is overlapeed with other class time of the same room 1')</script>");
                 break;
            }
        else if(d4.getTime()>d1.getTime() && d5.getTime()==d2.getTime()&& status.equals("Occupied")){
                out.println("<script>alert('Time is overlapeed with other class time of the same room 1')</script>");
               break;
            }else if(d4.getTime()==d1.getTime() && d5.getTime()<d2.getTime()&& status.equals("Occupied")){
                out.println("<script>alert('Time is overlapeed with other class time of the same room 1')</script>");
              break;
            } else if(d4.getTime()==d1.getTime() && d5.getTime()>d2.getTime()&& status.equals("Occupied")){
                out.println("<script>alert('Time is overlapeed with other class time of the same room 1')</script>");
                break;
            } else if(d4.getTime()<d1.getTime() && d5.getTime()==d2.getTime()&& status.equals("Occupied")){
                 out.println("<script>alert('Time is overlapeed with other class time of the same room 1')</script>");
                 break;
            }else if(d4.getTime()<d1.getTime() && d5.getTime()<d2.getTime()&& d5.getTime()>d1.getTime()&& status.equals("Occupied")){
                out.println("<script>alert('Time is overlapeed with other class time of the same room 1')</script>");
                 break;
            }
            else if(d4.getTime()<d1.getTime() && d5.getTime()>d2.getTime()&& d4.getTime()<d2.getTime()&& status.equals("Occupied")){
                out.println("<script>alert('Time is overlapeed with other class time of the same room 1')</script>");
                            break;
            } 
            else if(d4.getTime()<d1.getTime()&& d5.getTime()<d2.getTime()){
                counter--;// to decrease counter loop
                
               }
                    else{              
           Registration register =new Registration();
                register.room_assign(RID, Date, st, et, "Occupied",name_of_user);
        out.println("This room is assigned for you')");
            } 
        }
        if(counter==0){
            Registration register =new Registration();
                register.room_assign(RID, Date, st, et, "Occupied",name_of_user);
        out.println("bnbnb bnbThis room is assigned for you')");
            } }}}}}}
     %>   