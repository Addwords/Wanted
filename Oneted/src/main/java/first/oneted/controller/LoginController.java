package first.oneted.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.oneted.service.LoginService;


@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/login/login.do")
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/oneted1/loginform");
    	
    	List<Map<String, Object>> login = loginService.selectlogin(commandMap.getMap());
    	mv.addObject("login",login);
    	
    	return mv;
    }
	
	
}
