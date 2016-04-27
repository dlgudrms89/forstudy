package com.jsp.change;

public class JspChange {
    private static String[] jsp={
    	"../main.jsp",
    	"../login.jsp",
    	"../search_map.jsp",
    	"../search_contents.jsp"
    };
    public static String jspChange(int no)
    {
    	return jsp[no];
    }
}
