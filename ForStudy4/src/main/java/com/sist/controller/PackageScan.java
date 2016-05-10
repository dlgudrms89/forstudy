package com.sist.controller;
import java.util.*;
import java.io.*;
public class PackageScan {
	public static List<String> packageCreate(String pack){
		List<String> list=new ArrayList<String>();
		try{
			String path="C:\\FourStudy\\ForStudy4\\src\\main\\java\\";
			String real_path=path+pack.replace(".", "\\");
			File dir=new File(real_path);
			File[] files=dir.listFiles();
			for(File f:files){
				String name=f.getName();
				String ext=name.substring(name.lastIndexOf('.')+1);
				if(ext.equals("java")){
					String save=pack+"."+name;
					list.add(save.substring(0,save.lastIndexOf('.')));
				}
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
}
