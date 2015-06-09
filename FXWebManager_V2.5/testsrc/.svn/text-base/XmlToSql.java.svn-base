import fxdigital.dbsync.domains.client.db.CopyOfAnalysisOldXml;
import fxdigital.dbsync.domains.client.service.LoadMessage;


public class XmlToSql {
	
	public static void main(String[] args) {
		String xml=LoadMessage.getInstance().readFileByLines("D:\\C89CDCB1882C@0013.xml");
		xml=xml.replace("{", "<");
		xml=xml.replace("}", ">");
		System.out.println(xml);
		CopyOfAnalysisOldXml analysisOldXml=new CopyOfAnalysisOldXml();
		analysisOldXml.analysis(xml, "C89CDCB1882C@001");
	}

}
