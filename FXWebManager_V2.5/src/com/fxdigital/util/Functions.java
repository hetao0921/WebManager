package com.fxdigital.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Functions {
	public static boolean validateSoftVer(String softVer)
	  {
	    Pattern ptn = Pattern.compile("^v\\d+\\.\\d+\\.\\d+\\.\\d+$", 2);
	    Matcher matcher = ptn.matcher(softVer);
	    return matcher.matches();
	  }

	  public static long softVerToNum(String softVer)
	  {
	    if (!validateSoftVer(softVer)) {
	      System.out.println("版本号" + softVer + 
	        "不正确。版本号必须是V1.0.0.0这样的格式。");
	      return -1L;
	    }
	    softVer = softVer.trim();
	    softVer = softVer.substring(1, softVer.length());
	    String[] verSec = softVer.split("\\.");
	    String result = verSec[0] + suppleZeroLeft(verSec[1], 3) + 
	      suppleZeroLeft(verSec[2], 5) + 
	      suppleZeroLeft(verSec[3], 6);
	    return Long.parseLong(result);
	  }

	  private static String suppleZeroLeft(String toSupple, int digitNum)
	  {
	    if (toSupple.length() >= digitNum)
	      return toSupple;
	    String result = toSupple;
	    for (int i = 0; i < digitNum - toSupple.length(); i++) {
	      result = "0" + result;
	    }
	    return result;
	  }
	  public static void main(String[] args) {
		  long s=softVerToNum("V1.2.3.24");
		  if(s==-1){
			  System.out.println("-1");
		  }
		  System.out.println(s);
	}
}
