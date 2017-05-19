package first.mberDetail.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import first.mberDetail.service.MberDetailService;
import first.teamMber.service.TeamMberService;

//import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MberDetailController {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="mberDetailService")
    private MberDetailService mberDetailService;
    
    @Resource(name = "teamMberService")
	private TeamMberService teamMberService;
    //재형이형꺼 컨트롤러
//	@RequestMapping(value="/mber/mberList.do")
//    public ModelAndView openMberList(CommandMap commandMap) throws Exception{
//    	ModelAndView mv = new ModelAndView("/mber/mberList");
//    	
//    	Map<String,Object> list = mberService.selectMberList(commandMap.getMap());
//    	mv.addObject("list", list);
//    	
//    	return mv;
//    }
    
    @RequestMapping(value="/mberDetail/myDetail.do")
    public ModelAndView myDetail(CommandMap commandMap, HttpSession session) throws Exception{
    	//view	
    	
    	commandMap.put("SELEMAIL", session.getAttribute("LOGEMAIL"));
 
		Map<String,Object> map = mberDetailService.selectMberDetail(commandMap.getMap());
		List<Map<String,Object>> teamList =  teamMberService.selMyTeam(commandMap.getMap());
//		Map<String,Object> map1 =  mberDetailService.selectMberSkill(commandMap.getMap());
		ModelAndView mv = new ModelAndView("/mberDetail/myDetail");//view set
		mv.addObject("map", map.get("map"));
		mv.addObject("teamList", teamList);
//		mv.addObject("skill", map1.get("skill"));
    	return mv;   	
    	
    	}
    
    
    @RequestMapping(value="/mberDetail/mberDetail.do")
    public ModelAndView mberDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	//view	
		Map<String,Object> map = mberDetailService.selectMberDetail(commandMap.getMap());
		List<Map<String,Object>> teamList =  teamMberService.selMyTeam(commandMap.getMap());
		ModelAndView mv = new ModelAndView("/mberDetail/mberDetail");//view set
		mv.addObject("map", map.get("map"));
		mv.addObject("teamList", teamList);
    	return mv;   	
    }
    
    @RequestMapping(value="/mberDetail/mberWrite.do")
    public ModelAndView mberWrite(CommandMap commandMap, HttpSession session) throws Exception{
    	//view	
    	commandMap.put("SELEMAIL", session.getAttribute("LOGEMAIL"));
    	List<Map<String,Object>> teamList =  teamMberService.selMyTeam(commandMap.getMap());
    	Map<String,Object> map = mberDetailService.selectMberWrite(commandMap.getMap());
		ModelAndView mv = new ModelAndView("/mberDetail/mberWrite");//view set
		mv.addObject("map", map.get("map"));
		mv.addObject("teamList", teamList);
    	return mv;   	
    }    
// 
//	@RequestMapping(value="/mberDetail/insertSkill.do")
//	public ModelAndView insertMberSkill(CommandMap commandMap, HttpServletRequest request) throws Exception{
//		
//		ModelAndView mv = new ModelAndView("redirect:/mberDetail/mberDetail.do");
//		mberDetailService.insertMberSkill(commandMap.getMap(), request);
//		return mv;
//	}
	@RequestMapping(value="/mberDetail/insertInfo.do")
	public ModelAndView insertMberInfo(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/mberDetail/myDetail.do");
		//수정시지움
		commandMap.put("UEMAIL", session.getAttribute("LOGEMAIL"));
//		commandMap.put("PHONE", request.getParameter("PHONE"));
//		commandMap.put("LOCAL", request.getParameter("LOCAL"));
//		commandMap.put("SKILL", request.getParameter("SKILL"));
//		commandMap.put("INTRODUCE", request.getParameter("INTRODUCE"));
		
		
//		if(request.getParameter("IMG")==null)
//			commandMap.put("IMG", request.getParameter("IMG"));
		
		mberDetailService.insertMberInfo(commandMap.getMap(), request);
		
		return mv;
	}

}
