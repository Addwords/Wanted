package com.wanted.mber.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.wanted.mber.service.MberService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

//import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MberController {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="mberService")
    private MberService mberService;
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
    
    @RequestMapping(value="/mber/mberDetail.do")
    public ModelAndView detailMber(CommandMap commandMap) throws Exception{
    	//view	
		Map<String,Object> map = mberService.selectMberDetail(commandMap.getMap());
		
		ModelAndView mv = new ModelAndView("/mber/mberDetail");
		mv.addObject("map", map.get("map"));
		
    	return mv;
    	
    }
    
    /**********상하꺼 합침****************/
	@RequestMapping(value="/mber/pool.do")
    public ModelAndView selectMberList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/mber/mber-pool");
    	Map<String,Object> resultMap = mberService.selectMberList(commandMap.getMap());
    	
    	mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
	    mv.addObject("list", resultMap.get("result"));
    	
    	return mv;
    }

}
