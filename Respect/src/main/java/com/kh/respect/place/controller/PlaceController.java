package com.kh.respect.place.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.respect.common.Page;
import com.kh.respect.place.model.service.PlaceService;
import com.kh.respect.place.model.vo.Place;
import com.kh.respect.place.model.vo.PlaceGood;
import com.kh.respect.user.model.vo.User;

import net.sf.json.JSONObject;



@Controller
public class PlaceController {
	
	private Logger logger=LoggerFactory.getLogger(PlaceController.class);
	
	@Autowired
	private PlaceService service;
	
	
	@RequestMapping("/spot/mySpotAdd.do")
	public ModelAndView mySpotAdd(HttpSession session,String myTitle,String myAddr, String myContent)
	{
		User user=(User)session.getAttribute("userLoggedIn");
	    String userId=user.getUserId();
	    
	    System.out.println("유저아이디 : "+userId);
	    System.out.println("제목 : "+myTitle);
	    System.out.println("주소 : "+myAddr);
	    System.out.println("내용 : "+myContent);
	    
	    ModelAndView mv= new ModelAndView();
		Place place = new Place();
		place.setTitle(myTitle);
		place.setUserid(userId);
		place.setAddress(myAddr);
		place.setContent(myContent);
		
		int result = service.insertMySpot(place);
 
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "등록 성공";
			loc = "/schedule/scheduleWrite";
		}
		else {
			msg = "등록 실패";
			loc = "/schedule/scheduleWrite";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/spot/spotList.do")
	public ModelAndView spotList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		
		System.out.println("목록페이지(cPage) : "+cPage);
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 6;
		
		List<Place> list = service.selectSpotList(cPage, numPerPage);
		
		int totalCount = service.selectTotalCount();
		
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar", Page.getPage(cPage, numPerPage, totalCount, "spotList.do"));
		mv.setViewName("spot/spotList");
		
		return mv;
	}

	@RequestMapping("/spot/spotEnroll.do")
	public String spotEnroll() {
		return "spot/spotEnroll";
	}
	
	@RequestMapping(value="/spot/spotEnrollEnd.do", method=RequestMethod.POST)
	public ModelAndView spotEnrollEnd(MultipartFile thumbnail, MultipartFile mainimage, HttpServletRequest request) {
		
		String title = request.getParameter("title");
		String userid = request.getParameter("userid");
		String majorcategory = request.getParameter("majorcategory");
		String minorcategory = request.getParameter("minorcategory");
		String area = request.getParameter("area");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String content = request.getParameter("content");
		
		Place place = new Place();
		place.setTitle(title);
		place.setUserid(userid);
		place.setMajorcategory(majorcategory);
		place.setMinorcategory(minorcategory);
        place.setArea(area);
		place.setAddress(address);
		place.setPhone(phone);
		place.setContent(content);
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/spot/thumbnail");
		String saveDir2 = request.getSession().getServletContext().getRealPath("/resources/upload/spot/mainimage");
		
		System.out.println(saveDir);
		
		File dir = new File(saveDir);
		
		if(dir.exists()==false) dir.mkdirs();
		
		if(!thumbnail.isEmpty()) {
			String originalFileName = thumbnail.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			// 확장자를 구분해냄
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
			int rndNum = (int)(Math.random()*1000);
			String renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;
			
			try {
				// 서버에 해당경로에 파일을 저장하는 명령
				thumbnail.transferTo(new File(saveDir+"/"+renamedFileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			place.setThumbnail(renamedFileName);
		}
		
		if(!mainimage.isEmpty()) {
			String originalFileName = mainimage.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			// 확장자를 구분해냄
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
			int rndNum = (int)(Math.random()*1000);
			String renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;
			
			try {
				// 서버에 해당경로에 파일을 저장하는 명령
				mainimage.transferTo(new File(saveDir2+"/"+renamedFileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			place.setMainimage(renamedFileName);
		}
		
		int result = service.insertSpot(place);
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "등록 성공";
			loc = "/spot/spotList.do";
//			loc = "/spot/spotView.do?spotno="+place.getPlaceno();
		}
		else {
			msg = "등록 실패";
			loc = "/spot/spotList.do";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/spot/spotView.do")
	public String selectSpot(int spotno, Model model) {
		
		// 조회수 증가, 중복 증가
		service.updateSpotCnt(spotno);
		
		Place place = service.selectSpot(spotno);
		
		model.addAttribute("place", place);
		
		return "spot/spotView";
	}
	
	@RequestMapping(value="/spotUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public String imageUpload(MultipartFile[] uploadFile, HttpServletRequest request) throws IOException {
		System.out.println("uploadFile :: "+uploadFile[0]);
		ModelAndView mv = new ModelAndView();
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> map = new HashMap();
		
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/spot/spotUpload");
		
		List<String> attList = new ArrayList();
		
		File dir = new File(saveDir);
		// 폴더가 없을경우 생성
		if(dir.exists()==false) {
		   dir.mkdirs();
		}
		
		for(MultipartFile f : uploadFile) {
		   if(!f.isEmpty())
		   {
		      String originName = f.getOriginalFilename();
		      String ext = originName.substring(originName.lastIndexOf(".")+1);
		      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
		      int rndNum = (int)(Math.random()*10000);
		      String renamed = sdf.format(new Date(System.currentTimeMillis()));
		      //String renamed = "meet";
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
  
      String jsonStr = mapper.writeValueAsString(attList);
      
      return jsonStr;
	}
	
//	@RequestMapping(value = "/spot/spotSearchList.do", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> spotSearchList(@RequestBody PlaceSpring place) throws Exception  {
//		
//		System.out.println("목록페이지(cPage) : "+place);
//		
//		return service.spotSearchList(place);
//	}
	
	
	@RequestMapping(value="/spot/like.do", method=RequestMethod.POST)
	public @ResponseBody String like(@RequestBody PlaceGood pg) throws Exception {
		
		String userid = pg.getUserid();
		int placeno = pg.getPlaceno(); 
		
		logger.info("uuu"+userid+placeno);
		
		int result = 0;
		String msg = "";
		
		if(service.selectLike(pg)==null) {
			result = service.insertLike(pg);
			msg = "좋아요하였습니다.";
		}
		
		else {
			result = service.deleteLike(pg);
			msg = "좋아요를 취소하였습니다.";
		}
		
		JSONObject obj = new JSONObject();
		
//	    obj.put("placeNo", pg.getPlaceno());
//	    obj.put("like_check", like_check);
//	    obj.put("like_cnt", like_cnt);
	    obj.put("msg", msg);
	    
	    return obj.toString();
//	    return msg;
	  }


	
	
}
