package first.logio.controller;



import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;

@Controller
public class LogioController {
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/logio/loginState.do")
	public ModelAndView loginState(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/signupform");

		return mv;
	}

}
