package com.sist.news;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NewsManager {
	public static List<NewsDTO> newsAllData()
    {
		List<NewsDTO> list = new ArrayList<NewsDTO>();
		try
		{
			Document document=Jsoup.connect("http://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=102&sid2=250").get();
			Elements elTitle = document.select("div.list_body ul li dl dt:eq(1)");
			Elements elImage = document.select("div.list_body ul li dl dt.photo img");
			Elements elContent = document.select("div.list_body ul li dl :eq(2)");
			Elements elWriter = document.select("div.list_body ul li dl :eq(2) span.writing");
			Elements elLink = document.select("div.list_body ul li dl dt:eq(1) a");
			Elements elDate = document.select("div.list_body ul li dl :eq(2) span.date");
			
			for(int i=0;i<7;i++){
				Element titleElem = elTitle.get(i);
				String title = titleElem.text();   // title
				Element imageElem = elImage.get(i);
				String image = imageElem.attr("src");  // image
				Element contentElem = elContent.get(i);
				String contentCopy = contentElem.text();
				Element writerElem = elWriter.get(i);
				String writer = writerElem.text();
				String content = contentCopy.substring(0, contentCopy.lastIndexOf(writer));
				Element linkElem = elLink.get(i);
				String link = linkElem.attr("href");
				Element dateElem = elDate.get(i);
				String date = dateElem.text();
				
				NewsDTO dto = new NewsDTO();
				dto.setNewsTitle(title);
				dto.setNewsContent(content);
				dto.setNewsWriter(writer);
				dto.setNewsDate(date);
				dto.setNewsImage(image);
				dto.setNewsLink(link);
				list.add(dto);
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return list;
	}
	public static void main(String[] args){
		newsAllData();
	}
}
