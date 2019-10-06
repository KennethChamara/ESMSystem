<%@page import="model.Stockproduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.StockproductServiceIMPL"%>
<%@page import="service.Stockproductservice"%>
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
		p.add("List of all Products Details");
		p.setAlignment(Element.ALIGN_CENTER);
		document.add(p);

		Paragraph p2 = new Paragraph(" ");
		document.add(p2);

		PdfPTable table = new PdfPTable(6);
		PdfPCell c1 = new PdfPCell(new Phrase("ID"));
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Name"));
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Category"));
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Qty"));
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Manufacture"));
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Price"));
		table.addCell(c1);
		table.setHeaderRows(1);

		Stockproductservice service = new StockproductServiceIMPL();
		ArrayList<Stockproduct> productList = service.getpoducts();

		for (Stockproduct product : productList) {
			table.addCell(product.getPid());
			table.addCell(product.getPname());
			table.addCell(product.getCategory());
			table.addCell(Integer.toString(product.getQty()));
			table.addCell(product.getManufacture());
			table.addCell(Double.toString(product.getPrice()));
		}

		document.add(table);

		document.close();
	%>

</body>
</html>