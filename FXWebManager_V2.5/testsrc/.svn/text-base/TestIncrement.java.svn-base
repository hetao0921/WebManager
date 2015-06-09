import java.io.File;
import java.nio.charset.Charset;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.util.Base64;

import fxdigital.dbsync.domains.client.bean.CenterRelation;
import fxdigital.dbsync.domains.client.db.AnalysisCenterRelation;
import fxdigital.dbsync.domains.client.db.JdbcToXml;
import fxdigital.dbsync.domains.client.db.ResourceGroup;


public class TestIncrement {
	
	public static void main(String[] args) throws DocumentException {/*
		SAXReader read = new SAXReader();
		Document doc =read.read(new File("D:\\increment\\sync000BAB659DD2@00130.xml"));
		String str=doc.asXML();
		System.out.println(str);
		JdbcToXml.getInstance().xmlToInsert(str, "000BAB659DD2@001");
		
	*/
		
	String json="eyJncm91cElkIjoiNjQ4NjBmYmEtYjA1OC00ZmI3LWFhYWYtMDJlMTFjMjBkMmI5IiwiZ3JvdXBO"+
"YW1lIjoi6buY6K6k5YWo5bGA5YiG57uEIiwiZ3JvdXBUeXBlIjoiRGVmYXVsdCIsInVzZXJJZCI6"+
"IjAwMDAiLCJjZW50ZXJJZCI6IkI4OTc1QTVGRUEyQkAwMDEiLCJtZW1iZXJzIjpbeyJyZXNvdXJj"+
"ZUlkIjoiYmJmZWY1YWExNzkzNDhjNjg5YzdiMTE5ZTYyMTU3ZDQiLCJyZXNvdXJjZU5hbWUiOiIy"+
"NTEiLCJyZXNvdXJjZVR5cGUiOiJEZXBhcnRtZW50IiwicGFyZW50SWQiOiI2NDg2MGZiYS1iMDU4"+
"LTRmYjctYWFhZi0wMmUxMWMyMGQyYjkiLCJzb3J0SW5kZXgiOjAsImF0dHJpYnV0ZXMiOltdfSx7"+
"InJlc291cmNlSWQiOiJjNDA3YThmNDMzMDY0ZWNkOTU4YmViOTc2YzJjOTUwMiIsInJlc291cmNl"+
"TmFtZSI6ImRzMDAxIiwicmVzb3VyY2VUeXBlIjoiQ29tbWFuZGVyIiwicGFyZW50SWQiOiJiYmZl"+
"ZjVhYTE3OTM0OGM2ODljN2IxMTllNjIxNTdkNCIsInNvcnRJbmRleCI6MCwiYXR0cmlidXRlcyI6"+
"W119LHsicmVzb3VyY2VJZCI6IjQ2NDkyNmNiOTE2NTQwMWNhMTAyNTRmOGM3MzQzZDUyIiwicmVz"+
"b3VyY2VOYW1lIjoiZHMwMDIiLCJyZXNvdXJjZVR5cGUiOiJDb21tYW5kZXIiLCJwYXJlbnRJZCI6"+
"ImJiZmVmNWFhMTc5MzQ4YzY4OWM3YjExOWU2MjE1N2Q0Iiwic29ydEluZGV4IjoxLCJhdHRyaWJ1"+
"dGVzIjpbXX0seyJyZXNvdXJjZUlkIjoiMmE1MzEyZDZjNTBjNDg2NGJkMDdlZDBmMDc4NzRiNzAi"+
"LCJyZXNvdXJjZU5hbWUiOiJkczAwMyIsInJlc291cmNlVHlwZSI6IkNvbW1hbmRlciIsInBhcmVu"+
"dElkIjoiYmJmZWY1YWExNzkzNDhjNjg5YzdiMTE5ZTYyMTU3ZDQiLCJzb3J0SW5kZXgiOjIsImF0"+
"dHJpYnV0ZXMiOltdfSx7InJlc291cmNlSWQiOiI1YjZjZTA1Mzg1OGQ0NDAxYjZkMjk0MTFjMDA0"+
"YjkxYyMwIiwicmVzb3VyY2VOYW1lIjoiMTcwW+aRhOWDj+acujAxXSIsInJlc291cmNlVHlwZSI6"+
"IkNhbWVyYSIsInBhcmVudElkIjoiYmJmZWY1YWExNzkzNDhjNjg5YzdiMTE5ZTYyMTU3ZDQiLCJz"+
"b3J0SW5kZXgiOjMsImF0dHJpYnV0ZXMiOltdfSx7InJlc291cmNlSWQiOiI1YjZjZTA1Mzg1OGQ0"+
"NDAxYjZkMjk0MTFjMDA0YjkxYyMxIiwicmVzb3VyY2VOYW1lIjoiMTcwW+aRhOWDj+acujAyXSIs"+
"InJlc291cmNlVHlwZSI6IkNhbWVyYSIsInBhcmVudElkIjoiYmJmZWY1YWExNzkzNDhjNjg5Yzdi"+
"MTE5ZTYyMTU3ZDQiLCJzb3J0SW5kZXgiOjQsImF0dHJpYnV0ZXMiOltdfSx7InJlc291cmNlSWQi"+
"OiI1YjZjZTA1Mzg1OGQ0NDAxYjZkMjk0MTFjMDA0YjkxYyMyIiwicmVzb3VyY2VOYW1lIjoiMTcw"+
"W+aRhOWDj+acujAzXSIsInJlc291cmNlVHlwZSI6IkNhbWVyYSIsInBhcmVudElkIjoiYmJmZWY1"+
"YWExNzkzNDhjNjg5YzdiMTE5ZTYyMTU3ZDQiLCJzb3J0SW5kZXgiOjUsImF0dHJpYnV0ZXMiOltd"+
"fSx7InJlc291cmNlSWQiOiI1YjZjZTA1Mzg1OGQ0NDAxYjZkMjk0MTFjMDA0YjkxYyMzIiwicmVz"+
"b3VyY2VOYW1lIjoiMTcwW+aRhOWDj+acujA0XSIsInJlc291cmNlVHlwZSI6IkNhbWVyYSIsInBh"+
"cmVudElkIjoiYmJmZWY1YWExNzkzNDhjNjg5YzdiMTE5ZTYyMTU3ZDQiLCJzb3J0SW5kZXgiOjYs"+
"ImF0dHJpYnV0ZXMiOltdfSx7InJlc291cmNlSWQiOiI1YjZjZTA1Mzg1OGQ0NDAxYjZkMjk0MTFj"+
"MDA0YjkxYyM0IiwicmVzb3VyY2VOYW1lIjoiMTcwW+aRhOWDj+acujA1XSIsInJlc291cmNlVHlw"+
"ZSI6IkNhbWVyYSIsInBhcmVudElkIjoiYmJmZWY1YWExNzkzNDhjNjg5YzdiMTE5ZTYyMTU3ZDQi"+
"LCJzb3J0SW5kZXgiOjcsImF0dHJpYnV0ZXMiOltdfSx7InJlc291cmNlSWQiOiI0ZGMzMDBmNmU4"+
"NzY0ZWQ1ODBmZTNiMTU5NDgyZmU3OCMwIiwicmVzb3VyY2VOYW1lIjoiMTQxW+aRhOWDj+acujAx"+
"XSIsInJlc291cmNlVHlwZSI6IkNhbWVyYSIsInBhcmVudElkIjoiYmJmZWY1YWExNzkzNDhjNjg5"+
"YzdiMTE5ZTYyMTU3ZDQiLCJzb3J0SW5kZXgiOjgsImF0dHJpYnV0ZXMiOltdfSx7InJlc291cmNl"+
"SWQiOiI0ZGMzMDBmNmU4NzY0ZWQ1ODBmZTNiMTU5NDgyZmU3OCMxIiwicmVzb3VyY2VOYW1lIjoi"+
"MTQxW+aRhOWDj+acujAyXSIsInJlc291cmNlVHlwZSI6IkNhbWVyYSIsInBhcmVudElkIjoiYmJm"+
"ZWY1YWExNzkzNDhjNjg5YzdiMTE5ZTYyMTU3ZDQiLCJzb3J0SW5kZXgiOjksImF0dHJpYnV0ZXMi"+
"OltdfSx7InJlc291cmNlSWQiOiI0ZGMzMDBmNmU4NzY0ZWQ1ODBmZTNiMTU5NDgyZmU3OCMyIiwi"+
"cmVzb3VyY2VOYW1lIjoiMTQxW+aRhOWDj+acujAzXSIsInJlc291cmNlVHlwZSI6IkNhbWVyYSIs"+
"InBhcmVudElkIjoiYmJmZWY1YWExNzkzNDhjNjg5YzdiMTE5ZTYyMTU3ZDQiLCJzb3J0SW5kZXgi"+
"OjEwLCJhdHRyaWJ1dGVzIjpbXX0seyJyZXNvdXJjZUlkIjoiNGRjMzAwZjZlODc2NGVkNTgwZmUz"+
"YjE1OTQ4MmZlNzgjMyIsInJlc291cmNlTmFtZSI6IjE0MVvmkYTlg4/mnLowNF0iLCJyZXNvdXJj"+
"ZVR5cGUiOiJDYW1lcmEiLCJwYXJlbnRJZCI6ImJiZmVmNWFhMTc5MzQ4YzY4OWM3YjExOWU2MjE1"+
"N2Q0Iiwic29ydEluZGV4IjoxMSwiYXR0cmlidXRlcyI6W119LHsicmVzb3VyY2VJZCI6IjRkYzMw"+
"MGY2ZTg3NjRlZDU4MGZlM2IxNTk0ODJmZTc4IzQiLCJyZXNvdXJjZU5hbWUiOiIxNDFb5pGE5YOP"+
"5py6MDVdIiwicmVzb3VyY2VUeXBlIjoiQ2FtZXJhIiwicGFyZW50SWQiOiJiYmZlZjVhYTE3OTM0"+
"OGM2ODljN2IxMTllNjIxNTdkNCIsInNvcnRJbmRleCI6MTIsImF0dHJpYnV0ZXMiOltdfV19";
	
	String noticeJson="eyJub3RpY2VDb250ZW50Ijoie1wicmVsYXRpb25JZFwiOlwiNGU4YjJjY2IwNzE2NGQyZGE4MTYx"+
"MTBhNzYwNTBjNmFcIixcInJlbGF0aW9uTmFtZVwiOlwiXCIsXCJjcmVhdGVUaW1lXCI6XCIwMDAx"+
"LTAxLTAxVDAwOjAwOjAwWlwiLFwicmVsYXRlZENlbnRlcklkXCI6W1wiNzQyN0VBMEQxRTNFQDAw"+
"MVwiLFwiQjg5NzVBNUZFQTJCQDAwMVwiXSxcInJlbGF0aW9uVHlwZVwiOlwiU2libGluZ1wiLFwi"+
"Y2VudGVySWRcIjpcIjc0MjdFQTBEMUUzRUAwMDFcIn0iLCJzZW5kZXJUeXBlIjoiQ29tbWFuZFN5"+
"c3RlbSJ9";
	
	
	
	
/*	json =new String(Base64.decodeFast(json));
	System.out.println(json);*/
	
String str="eyJyZWxhdGlvbklkIjoiODJiN2IyYzI4MjVjNGZhMDkxODFmOTRmYmI2M2NjNWUiLCJyZWxhdGlvbk5hbWUiOiIiLCJjcmVhdGVUaW1lIjoiMDAwMS0wMS0wMVQwMDowMDowMFoiLCJyZWxhdGVkQ2VudGVycyI6W3siY2VudGVySWQiOiI3NDI3RUEwRDFFM0VAMDAxIiwiY2VudGVyTmFtZSI6IuS4u+S4reW/gyJ9LHsiY2VudGVySWQiOiIwMDUwMDgwNDdERUFAMDAxIiwiY2VudGVyTmFtZSI6IuW5s+e6p+S4reW/gyJ9XSwicmVsYXRpb25UeXBlIjoiU2libGluZyIsImNlbnRlcklkIjoiNzQyN0VBMEQxRTNFQDAwMSJ9";

str =new String(Base64.decodeFast(str),Charset.forName("utf-8"));
	System.out.println(str);
	
	
//	String str="{\"relationId\":\"82b7b2c2825c4fa09181f94fbb63cc5e\",\"relationName\":\"\",\"createTime\":\"0001-01-01T00:00:00Z\",\"relatedCenters\":[{\"centerId\":\"7427EA0D1E3E@001\",\"centerName\":\"主中心\"},{\"centerId\":\"005008047DEA@001\",\"centerName\":\"平级中心\"}],\"relationType\":\"Sibling\",\"centerId\":\"7427EA0D1E3E@001\"}";
//	CenterRelation centerRelation=JSONObject.parseObject(str,CenterRelation.class);
//	
//	centerRelation.getRelatedCenters();
	
	}

}
