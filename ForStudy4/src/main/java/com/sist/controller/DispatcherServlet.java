package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WebApplicationContext wc;
	private List<String> list=new ArrayList<String>();
	private ViewResolver vr;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		String path=config.getInitParameter("contextConfigLocation");
		wc=new WebApplicationContext(path);
		list=wc.list;
		vr=new ViewResolver();
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			// list.do
			String cmd=request.getRequestURI();
			cmd=cmd.substring(request.getContextPath().length()+1); // ContextPath : Project�̸�
			for(String strClass:list){
				Class clsName=Class.forName(strClass);
				if(clsName.isAnnotationPresent(Controller.class)==false)
					continue;
				Object obj=clsName.newInstance();
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods){
					
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					if(rm!=null){
						System.out.println("rm:"+rm);
						System.out.println("cmd:"+cmd);
						if(rm.value().equals(cmd)){
							// �޼ҵ� ã�� �Ϸ� => ����
							System.out.println("������� �ǰ� �ȵǴ°Ű���");
							String jspName=(String)m.invoke(obj, request);
							System.out.println("jspName : "+jspName);
							String jsp=vr.jspFind(jspName);
							
							RequestDispatcher rd=request.getRequestDispatcher(jsp);
							rd.forward(request, response);
							return;
						}
					}
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("DispatcherServlet ���� : "+ex.getMessage());
		}
	}

}
