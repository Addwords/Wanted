package first.register.controller;



import javax.annotation.Resource;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.register.service.RegService;

@Controller
public class RegController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "regService")
	private RegService regService;

	@RequestMapping(value = "/register/register.do")
	public ModelAndView register(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/message/listMsg.do");
		regService.register(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/register/delUser.do")
	public ModelAndView delMsg(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/message/listMsg.do");
			regService.delUser(commandMap.getMap());		

		return mv;
	}

	@RequestMapping(value = "/register/updateUser.do")
	public ModelAndView listMsg(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/message/message");
		regService.updateUser(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/register/regValidate.do")
	public ModelAndView delThis(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/message/listMsg.do");
		regService.regValidate(commandMap.getMap());

		return mv;

	}

}
