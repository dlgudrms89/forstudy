package com.sist.map;

import com.sist.dao.*;
import java.util.*;
public class MainClass {

   public static void main(String[] args) {
      // TODO Auto-generated method stub
      AddtoXY atx=new AddtoXY();
      AcinfoDAO dao = AcinfoDAO.newInstance();
      List<AcinfoDTO> list = dao.allData();
      for(AcinfoDTO dto:list){
         double[] coords = atx.geoCoding(dto.getAc_address());
         System.out.println(dto.getAc_address()+"\t"+coords[0]+","+coords[1]);
      }
   }

}