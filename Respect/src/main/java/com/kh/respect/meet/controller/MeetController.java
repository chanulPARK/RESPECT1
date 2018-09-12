package com.kh.respect.meet.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.respect.common.Page;
import com.kh.respect.meet.model.service.MeetService;
import com.kh.respect.meet.model.vo.Meet;



@Controller
public class MeetController {
	
	private Logger logger=LoggerFactory.getLogger(MeetController.class);
	
	@Autowired
	MeetService service;
	
	@RequestMapping("/meet/meetList.do")
	public ModelAndView meetList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage)
	{
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		
		List<Map<String,String>> list = service.selectMeetList(cPage, numPerPage);
		
		int totalCount=service.selectTotalCount();
		
		mv.addObject("list", list);
		mv.addObject("pagebar", Page.getPage(cPage, numPerPage, totalCount, "meetList.do"));
		mv.addObject("totalCount", totalCount);
		mv.setViewName("meet/meetList");
		
		return mv;
	}
	
	@RequestMapping("/meet/searchMeet.do")
	public ModelAndView searchMeet(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
								   @RequestParam(value="daterange") String range,
							 	   @RequestParam(value="area") String area) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		System.out.println(range);
		
		String start = range.substring(0, 10);
		System.out.println(start);
		String end = range.substring(13);
		System.out.println(end);
		
		int numPerPage = 10;
		
		List<Map<String,String>> list = service.searchMeetList(cPage, numPerPage, start, end, area);
		int totalCount=service.selectTotalCount();
		
		mv.addObject("list", list);
		mv.addObject("pagebar", Page.getPage(cPage, numPerPage, totalCount, "meetList.do"));
		mv.setViewName("meet/meetList");
		
		return mv;
	}
	
	@RequestMapping("/meet/meetForm.do")
	public String meetForm()
	{
		return "/meet/meetForm";
	}
	
	@RequestMapping(value="/meet/meetFormEnd.do", method = RequestMethod.POST)
	public ModelAndView selectOne(@RequestParam(value="title") String title,
								  @RequestParam(value="area") String area,
								  @RequestParam(value="address") String address,
								  @RequestParam(value="userId") String userId,
								  @RequestParam(value="meetDate") Date meetDate,
								  @RequestParam(value="meetTime") String meetTime,
								  @RequestParam(value="content") String content)
	{
		ModelAndView mv = new ModelAndView();
		
		Meet meet = new Meet(0, userId, area, title, content, meetDate, meetTime, address, 0, 0, null);
		
		int result = service.insertMeet(meet);
		System.out.println(result);
		
		mv.setViewName("meet/meetList");
		
		return mv;
	}
	
	
	@RequestMapping(value="/imageUpload.do", method = RequestMethod.POST)
	public ModelAndView imageUpload(MultipartFile[] uploadFile, HttpServletRequest request) throws IOException
	{
		System.out.println(uploadFile[0]);
		System.out.println(uploadFile[1]);
		
		ModelAndView mv = new ModelAndView();
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
		
		List<String> attList = new ArrayList();
		
		File dir = new File(saveDir);
		// 폴더가 없을경우 생성
		if(dir.exists()==false)
		{
			dir.mkdirs();
		}
		
		for(MultipartFile f : uploadFile)
		{
			if(!f.isEmpty())
			{
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
				int rndNum = (int)(Math.random()*1000);
				String renamed = sdf.format(new Date(System.currentTimeMillis()));
				renamed += "_" + rndNum + "." + ext;
				try {
					// 서버 경로에 파일을 저장
					f.transferTo(new File(saveDir+"/"+renamed));
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				attList.add(renamed);
			}
		}
		mv.addObject("list",attList);
		mv.setViewName("jsonView");
		
		return mv;      
	}
}
