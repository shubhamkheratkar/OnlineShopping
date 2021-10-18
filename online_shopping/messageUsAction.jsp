<%@page import="javax.websocket.SendResult"%>
<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%

String email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");

int check=0;
try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
	ps.setString(1, email);
	ps.setString(2, subject);
	ps.setString(3, body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
	
}
catch(Exception e)
{
	System.out.println(e);

	response.sendRedirect("messageUs.jsp?msg=invalid");
}
%>