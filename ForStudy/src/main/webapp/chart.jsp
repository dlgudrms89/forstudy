<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" import="com.sist.dao.*,java.util.*"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <jsp:useBean id="dao" class="com.sist.dao.AcinfoDAO"/>
<%

//maxVal[0] : 최대수강료
//maxVal[1] : 최대정원
//maxVal[2] : 최대시간
//maxVal[3] : 최대강사수
//maxVal[4] : 최대평점
       List<AcinfoDTO> list=(ArrayList<AcinfoDTO>)session.getAttribute("list");
      int[] ac_no=new int[list.size()];
      for(int i=0;i<list.size();i++){
         ac_no[i]=list.get(i).getAc_no();
      }
       int[] maxVal = new int[5]; 
       maxVal=dao.radarMax(ac_no);
       
       List<AcinfoDTO> copylist = new ArrayList<AcinfoDTO>();
       //d.ac_totalval
      if(copylist!=null)
    		   copylist.clear();
       for(AcinfoDTO d:list){
           AcinfoDTO dto = new AcinfoDTO();
           int val1 = d.getAc_totalval();
           int val2 = d.getAc_inwon();
           int val3 =   d.getAc_time();         
           int val4 =   d.getAc_teacher();           
           int val5 = d.getAc_reviewcnt();
           dto.setAc_name(d.getAc_name());
          if(maxVal[0]!=0)
             dto.setAc_totalval((val1*100/maxVal[0]));    
          else
             dto.setAc_totalval(0);   
          if(maxVal[1]!=0)
             dto.setAc_inwon((val2*100/maxVal[1]));    
          else
             dto.setAc_inwon(0);
          if(maxVal[2]!=0)
             dto.setAc_time((val3*100/maxVal[2]));    
          else
             dto.setAc_time(0);
          if(maxVal[3]!=0)
             dto.setAc_teacher((val4*100/maxVal[3]));    
          else
             dto.setAc_teacher(0);
          if(maxVal[4]!=0)
             dto.setAc_reviewcnt((val5*100/maxVal[4]));    
          else
             dto.setAc_reviewcnt(0);
      	  copylist.add(dto);
       }
       
       request.setAttribute("copylist",copylist);
       
       
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/chartnormalize.css">
<link rel="stylesheet" href="css/chartstyle.css">

</head>
<body>
   
   <canvas id="myChart" width="700" height="500" style="margin-left:25px;"></canvas>
   
   <script src='http://www.chartjs.org/assets/Chart.min.js'></script>
   
   <script type="text/javascript">
//Based on a pen by @tedgoas
var ctx = document.getElementById("myChart").getContext("2d");
var maxnum = 0;
var colorchange=["rgba(43,176,212,","rgba(140,200,50,","rgba(67,137,162,","rgba(113,178,128,","rgba(43,192,228,",
                 "rgba(147,249,185,","rgba(247,187,151,"];
var i=0;
var data = { 
    labels: ["가격", "정원", "교습시간", "강사수", "평점"],
      
    datasets: [
      <c:forEach var="d" items="${copylist}">
        {   
           
            label: "${d.ac_name}",
            fillColor: colorchange[i]+".4)",
            strokeColor: colorchange[i]+"1)",
            pointColor: colorchange[i]+"1)",
            pointHighlightStroke: colorchange[i++]+"1)",
            /* data: ['${maxVal[0]<=0?0:d.ac_totalval*100/10000/maxVal[0]}','${maxVal[1]<=0?0:d.ac_inwon*100/maxVal[1]}' ,'${maxVal[4]<=0?0:d.ac_reviewcnt*100/maxVal[4]}',
                 '${maxVal[3]<=0?0:d.ac_teacher*100/maxVal[3]}', '${maxVal[2]<=0?0:d.ac_time*100/60/maxVal[2]}'], */
            data: ['${d.ac_totalval}','${d.ac_inwon}' ,'${d.ac_time}', '${d.ac_teacher}', '${d.ac_reviewcnt}'],
            
        },
        </c:forEach>
        /* {
            label: "Relative Skill",
            fillColor: "rgba(140,200,50,.4)",
            strokeColor: "rgba(140,200,50,1)",
            pointColor: "rgba(140,200,50,1)",
            pointHighlightStroke: "rgba(140,200,50,1)",
            data: [85, 75, 70, 80, 85]
        } */
    ]
};
<c:forEach var="d" items="${copylist}">
   var data2 = ['${Integer.parseInt(d.ac_totalval)/10000}','${d.ac_inwon}' ,'${d.ac_reviewcnt}', '${d.ac_teacher}', '${Integer.parseInt(d.ac_time)/60}'];
   maxdata(data2);
</c:forEach>

new Chart(ctx).Radar(data, {
   animationSteps: 30,
   animationEasing: "easeInOutExpo",
   responsive: true,
   showTooltips: true,
   scaleOverride: true,
    scaleSteps: 5,
    scaleStepWidth: 20,
    scaleStartValue: 0,
    scaleLineColor: "rgba(0,0,0,.15)",
   
    angleShowLineOut: true,
    angleLineWidth : 1,
    angleLineColor : "rgba(0,0,0,.15)",
    pointLabelFontFamily : "'freight-sans-pro', Calibri, Candara, Segoe, 'Segoe UI', Optima, Arial, sans-serif",
    pointLabelFontSize : 14,
   pointLabelFontColor : "#99b",
   pointDot : false,
   datasetStrokeWidth : 1
});
function maxdata(data){
   for(var i=0;i<data.length;i++){
      for(var j=0;j<data.length;j++){
         if(i!=j){
            if(data[i]>=data[j]){
               if(data[i]>=maxnum){
                  maxnum=data[i];
               }
            }
         }         
      }   
   }
}
</script>
</body>
</html>