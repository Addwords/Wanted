package com.wanted.message.controller;

import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.wanted.message.service.MsgService;

import com.common.common.CommandMap;

@Controller
public class MsgController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "msgService")
	private MsgService msgService;

	@RequestMapping(value = "/message/sendMsg.do")
	public ModelAndView sendMsg(CommandMap commandMap, HttpSession session, HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/message/listMsg.do");
		commandMap.put("SENDER", session.getAttribute("LOGID"));
		String allRecipient = commandMap.get("RECIPIENT").toString();
		StringTokenizer st = new StringTokenizer(allRecipient, ";");
//		commandMap.put("CONTENTS",commandMap.get("CONTENTS").toString().replaceAll("\r\n", "<br>"));
		while (st.hasMoreTokens()) {
			commandMap.put("RECIPIENT", st.nextToken().trim());
			msgService.sendMsg(commandMap.getMap(), request);
		}
		return mv;
	}

	@RequestMapping(value = "/message/delMsg.do")
	public ModelAndView delMsg(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/message/listMsg.do");

		String allMid = commandMap.get("MID").toString();
		StringTokenizer st = new StringTokenizer(allMid, ";");
		while (st.hasMoreTokens()) {
			commandMap.put("MID", Integer.parseInt(st.nextToken().trim()));
			msgService.delMsg(commandMap.getMap());
		}

		return mv;
	}

	@RequestMapping(value = "/message/delThis.do")
	public ModelAndView delThis(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/message/listMsg.do");
		System.out.println(commandMap.get("DMID").toString());

		commandMap.put("MID", Integer.parseInt(commandMap.get("DMID").toString()));
		msgService.delMsg(commandMap.getMap());

		return mv;

	}

	@RequestMapping(value = "/message/listMsg.do")
	public ModelAndView listMsg(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/message/message");
		commandMap.put("RECIPIENT", session.getAttribute("LOGID"));

		List<Map<String, Object>> list = msgService.listMsg(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/message/searchMsg.do")
	public ModelAndView searchMsg(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/message/message");
		commandMap.put("RECIPIENT", session.getAttribute("LOGID"));
		
		String selector = commandMap.get("SELECTOR").toString();
		List<Map<String, Object>> list = null;

		if(selector.equals("sender")){
		list = msgService.searchSenderMsg(commandMap.getMap());
		}else if(selector.equals("subject")){		
		list = msgService.searchSubjectMsg(commandMap.getMap());
		}else if(selector.equals("contents")){
		list = msgService.searchContentsMsg(commandMap.getMap());
		}else if(selector.equals("writeday")){
		list = msgService.searchWritedayMsg(commandMap.getMap());
		}
		
		
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}


	@RequestMapping(value = "/message/detailMsg.do", produces = "application/text; charset=utf-8")
	public void detailMsg(CommandMap commandMap, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");

		Map<String, Object> map = msgService.detailMsg(commandMap.getMap());
		String jmap = new Gson().toJson(map);
		try {
			response.getWriter().write(jmap);
		} catch (JsonIOException e) {
			e.printStackTrace();
		}
	}

}
