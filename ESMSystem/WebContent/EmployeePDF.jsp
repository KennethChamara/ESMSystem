<%@page import="model.EmployeeDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.EmployeeServiceIMPL"%>
<%@page import="service.EmployeeService"%>
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
	Document document = new Document();
	response.setContentType("application/pdf");
	PdfWriter.getInstance(document, response.getOutputStream());
	
	document.open();
	
	Paragraph p = new Paragraph();
	p.add("Brief List of All the Current Employees");
	p.setAlignment(Element.ALIGN_CENTER);
	document.add(p);	
	
	Paragraph p2 = new Paragraph(" ");
	document.add(p2);
	
	PdfPTable table = new PdfPTable(5);
	PdfPCell c1 = new PdfPCell(new Phrase("Name"));
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Email"));
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Gender"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Address"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Designation"));
	table.addCell(c1);
	table.setHeaderRows(1);
	
	EmployeeService ser = new EmployeeServiceIMPL();
	ArrayList<EmployeeDetails> empLi = ser.getemployeedetailsList(null);

	for (EmployeeDetails m : empLi) {
		table.addCell(m.getEmpName());
		table.addCell(m.getEmpEmail());
		table.addCell(m.getEmpGender());
		table.addCell(m.getEmpAddress());
		table.addCell(m.getEmpDesignation());
	}
	
	document.add(table);

	document.close();
	
%>

</body>
</html>