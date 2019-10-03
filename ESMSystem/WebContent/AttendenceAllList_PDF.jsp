<%@page import="model.Attendancelist"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.AttendenceServiceIMPL"%>
<%@page import="service.AttendenceService"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	int month = Integer.parseInt(request.getParameter("month"));
	
	Document document = new Document();
	response.setContentType("application/pdf");
	PdfWriter.getInstance(document, response.getOutputStream());
	
	document.open();
	
	Paragraph p = new Paragraph();
	p.add("Monthly Attendance List of All  Employees");
	p.setAlignment(Element.ALIGN_CENTER);
	document.add(p);	
	
	Paragraph p2 = new Paragraph(" ");
	document.add(p2);
	
	PdfPTable table = new PdfPTable(5);
	PdfPCell c1 = new PdfPCell(new Phrase("Employee ID"));
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Employee Name"));
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Designation"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Present"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Absent"));
	table.addCell(c1);
	table.setHeaderRows(1);
	
	AttendenceService sevice = new AttendenceServiceIMPL();
	ArrayList<Attendancelist> attendancelist = sevice.getMonthlyAttendance(month);
	
	for(Attendancelist attendance : attendancelist) {
		table.addCell(attendance.getEmployeeID());
		table.addCell(attendance.getEmployeeName());
		table.addCell(attendance.getEmployeePossion());
		table.addCell(Integer.toString(attendance.getNoOfdate_present()));
		table.addCell(Integer.toString(attendance.getNoOfdate_absent()));
	}
	
	document.add(table);

	document.close();
	
%>
</body>
</html>