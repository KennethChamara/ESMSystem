package common;

import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import CRUD.Read_Values;

public class Create_java_pdf {
	
	public static void main(String args[]) {
		
		double tot = 0;
		double elecTot = 0;
		double waterTot = 0;
		double rentalTot = 0;
		double internetTot = 0;
		double otherTot = 0;
		
		try {
			
			Read_Values obj_read_values = new Read_Values();
			List<User_Bean> list = obj_read_values.get_values();
			Iterator<User_Bean> it_list = list.iterator();
			
    	String file_name = "C:\\Users\\RV\\Documents\\EMS-Documents\\report.pdf";
    	Document document = new Document();
    	PdfWriter.getInstance(document, new FileOutputStream(file_name));
    	
    	document.open();
    	Paragraph p = new Paragraph();
    	p.add("Other Expenses in Details");
    	p.setAlignment(Element.ALIGN_CENTER);
    	document.add(p);	
    	
    	Paragraph p2 = new Paragraph(" ");
    	document.add(p2);
    	
    	PdfPTable table = new PdfPTable(5);
    	PdfPCell c1 = new PdfPCell(new Phrase("Bill Type"));
    	table.addCell(c1);

    	c1 = new PdfPCell(new Phrase("Month"));
    	table.addCell(c1);

    	c1 = new PdfPCell(new Phrase("Date"));
    	table.addCell(c1);
    	
    	c1 = new PdfPCell(new Phrase("Amount"));
    	table.addCell(c1);
    	
    	c1 = new PdfPCell(new Phrase("Paid By"));
    	table.addCell(c1);
    	table.setHeaderRows(1);
    	
    	
    	while(it_list.hasNext()) {
    		User_Bean obj_User_bean = new User_Bean();
    		obj_User_bean = it_list.next();
    		
    		table.addCell(obj_User_bean.getBill_type());
    		table.addCell(obj_User_bean.getMonth());
    		table.addCell(obj_User_bean.getDate());
    		table.addCell(obj_User_bean.getAmount());
    		tot = tot + Double.parseDouble(obj_User_bean.getAmount());
    		table.addCell(obj_User_bean.getPaidBy());
    		
    		if(obj_User_bean.getBill_type().equals(obj_User_bean.electricity)) {
    			elecTot = elecTot + Double.parseDouble(obj_User_bean.getAmount());
    		}
    		if(obj_User_bean.getBill_type().equals(obj_User_bean.water)) {
    			waterTot = waterTot + Double.parseDouble(obj_User_bean.getAmount());
    		}
    		if(obj_User_bean.getBill_type().equals(obj_User_bean.rental)) {
    			rentalTot = rentalTot + Double.parseDouble(obj_User_bean.getAmount());
    		}
    		if(obj_User_bean.getBill_type().equals(obj_User_bean.internet)) {
    			internetTot = internetTot + Double.parseDouble(obj_User_bean.getAmount());
    		}
    		if(obj_User_bean.getBill_type().equals(obj_User_bean.other)) {
    			otherTot = otherTot + Double.parseDouble(obj_User_bean.getAmount());
    		}
    		
    	}
    	
    	document.add(table);
    	Paragraph p8 = new Paragraph(" ");
    	document.add(p8);
    	Paragraph p9 = new Paragraph(" ");
    	document.add(p9);
    	Paragraph p10 = new Paragraph(" ");
    	document.add(p10);
    	
    	Paragraph p1 = new Paragraph();
    	p1.add("Total Payment is: "+ Double.toString(tot)+" LKR");
    	p1.setAlignment(Element.ALIGN_CENTER);
    	document.add(p1);
    	
    	Paragraph p16 = new Paragraph(" ");
    	document.add(p16);
    	
    	Paragraph p11 = new Paragraph();
    	p11.add("Total of Electricity Payment is: "+ Double.toString(elecTot)+" LKR");
    	p11.setAlignment(Element.ALIGN_CENTER);
    	document.add(p11);
    	
    	Paragraph p12 = new Paragraph();
    	p12.add("Total of Rental Payment is: "+ Double.toString(rentalTot)+" LKR");
    	p12.setAlignment(Element.ALIGN_CENTER);
    	document.add(p12);
    	
    	Paragraph p13 = new Paragraph();
    	p13.add("Total of Internet Payment is: "+ Double.toString(internetTot)+" LKR");
    	p13.setAlignment(Element.ALIGN_CENTER);
    	document.add(p13);
    	
    	Paragraph p14 = new Paragraph();
    	p14.add("Total of Water Payment is: "+ Double.toString(waterTot)+" LKR");
    	p14.setAlignment(Element.ALIGN_CENTER);
    	document.add(p14);
    	
    	Paragraph p15 = new Paragraph();
    	p15.add("Total of Other Payment is: "+ Double.toString(otherTot)+" LKR");
    	p15.setAlignment(Element.ALIGN_CENTER);
    	document.add(p15);
    	
    	Paragraph p3 = new Paragraph(" ");
    	document.add(p3);
    	Paragraph p4 = new Paragraph(" ");
    	document.add(p4);
    	Paragraph p5 = new Paragraph(" ");
    	document.add(p5);
    	Paragraph p6 = new Paragraph(" ");
    	document.add(p6);
    	Paragraph p7 = new Paragraph(" ");
    	document.add(p7);
    	
    	
    	document.add(Image.getInstance("C:\\Users\\RV\\Pictures\\Andro img\\png\\pnnng\\123.png"));
    	
    	document.close(); 
    	
    	System.out.println("Total is: "+tot+" LKR");
    	System.out.println("Finished");
    	
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
