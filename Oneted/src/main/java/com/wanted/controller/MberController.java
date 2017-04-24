package com.wanted.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.wanted.service.MberService;

@Controller
public class MberController {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="mberService")
    private MberService mberService;
    
    @RequestMapping(value="/mber/detailMberView.do")
    public ModelAndView login(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mber/detailMberView");    	
    	return mv;
    	
    }

}
