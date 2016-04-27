package com.sist.dao;

public class JspChange {
	private static String[] jsp={
		"home.jsp",
		"maptest5.jsp",
		"searchdetail.jsp",
		"compare.jsp"
	};
	public static String jspChange(int no){
		return jsp[no];
	}
}
