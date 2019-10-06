<%@page import="model.Salary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.SalaryServiceImpl"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
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
	
	String month = request.getParameter("month");
	String year =request.getParameter("year");
	
	System.out.println("month jsp"+month+"Year"+year);
	
	Document document = new Document();
	response.setContentType("application/pdf");
	PdfWriter.getInstance(document, response.getOutputStream()); 
	
	document.open();
	
	Paragraph p = new Paragraph();
	p.add("Monthly Employee Salary Report");
	p.setAlignment(Element.ALIGN_CENTER);
	document.add(p);	
	
	Paragraph p2 = new Paragraph(" ");
	document.add(p2);
	
	PdfPTable table = new PdfPTable(5);
	PdfPCell c1 = new PdfPCell(new Phrase("Employee ID"));
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Employee Name"));
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Month"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Date"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Amount"));
	table.addCell(c1);
	table.setHeaderRows(1);
	
	SalaryServiceImpl sevice = new SalaryServiceImpl();
	ArrayList<Salary> Salarys = sevice.searchSalaryMonthly(year,month);
	
	for(Salary salary : Salarys) {
		table.addCell(salary.getEmpId());
		table.addCell(salary.getEmpName());
		table.addCell(salary.getMonth());
		table.addCell(salary.getDate());
		table.addCell(Double.toString(salary.getAmount()));
		
	}
	
	document.add(table);

	
	
	document.close();
	
	
	%>

</body>
</html>