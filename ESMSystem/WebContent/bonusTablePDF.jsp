<%@page import="model.Bonuse"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.bonuseServiceIMPL"%>
<%@page import="service.bonuseService"%>
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
	p.add("Bonus List of All  Employees");
	p.setAlignment(Element.ALIGN_CENTER);
	document.add(p);	
	
	Paragraph p2 = new Paragraph(" ");
	document.add(p2);
	
	PdfPTable table = new PdfPTable(8);
	PdfPCell c1 = new PdfPCell(new Phrase("B_ID"));
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("E_ID"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Employee Name"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Type"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Salary"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Rate"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Bonus"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Net Salary"));
	table.addCell(c1);
	table.setHeaderRows(1);
	
	bonuseService service = new bonuseServiceIMPL();
	ArrayList<Bonuse> BonuseList = service.getbounce();

	for (Bonuse bonuse : BonuseList) {
		table.addCell(bonuse.getBid());
		table.addCell(bonuse.getEid());
		table.addCell(bonuse.getEname());
		table.addCell(bonuse.getType());
		table.addCell(Double.toString(bonuse.getSalary()));
		table.addCell(Integer.toString(bonuse.getRate()));
		table.addCell(Double.toString(bonuse.getAmount()));
		table.addCell(Double.toString(bonuse.getNetsalary()));
		
	}
	
	document.add(table);

	document.close();
	
%>

</body>
</html>