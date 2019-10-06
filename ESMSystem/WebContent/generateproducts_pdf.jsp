<%@page import="model.ProductDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.SupplierAnalyseServiceIMPL"%>
<%@page import="service.SupplierAnalyseService"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Rectangle"%>
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
	
	Rectangle envelope = new Rectangle(1200, 1000);
	Document document = new Document(envelope, 10f, 10f, 100f, 0f);
	response.setContentType("application/pdf");
	PdfWriter.getInstance(document, response.getOutputStream());
	
	document.open();
	
	Paragraph p = new Paragraph();
	p.add("Eshop Product Details Report");
	p.setAlignment(Element.ALIGN_CENTER);
	document.add(p);	
	
	Paragraph p2 = new Paragraph(" ");
	document.add(p2);
	
	PdfPTable table = new PdfPTable(5);
	PdfPCell c1 = new PdfPCell(new Phrase("ID"));
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Product Name"));
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Quantity"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Discount"));
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Unit Price"));
	table.addCell(c1);
	
	
	
	table.setHeaderRows(1);
	table.setTotalWidth(980);
	table.setLockedWidth(true);
	//table.setWidths(new int[]{10,25 ,27,27,22,38});
	//float[] columnWidths = new float[]{20f, 30f, 30f, 28f,20f,50f};
           // table.setWidths(columnWidths);
	
	
	
	SupplierAnalyseServiceIMPL IMPL =new SupplierAnalyseServiceIMPL();
	ArrayList<ProductDetails> productlist = IMPL.getProductdetailsList();
	
	for(ProductDetails details : productlist) {
		table.addCell(details.getProductId());
		table.addCell(details.getProductName());
		table.addCell(Integer.toString(details.getQuantity()));
		table.addCell(Double.toString(details.getDiscount())+"%");
		table.addCell("Rs"+Double.toString(details.getUnitprice()));
		
		
		
	}
	
	document.add(table);

	document.close();
	
%>
</body>
</html>