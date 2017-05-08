package first.register.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import first.common.common.CommandMap;
import first.mberlog.service.MLogService;
import first.register.service.RegService;

@Controller
public class RegController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "regService")
	private RegService regService;
	
	@Resource(name = "mLogService")
	private MLogService mLogService;

	@RequestMapping(value = "/register/register.do")
	public ModelAndView register(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/common/main.do");
		regService.register(commandMap.getMap());
		mLogService.createLog(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/register/delUser.do")
	public ModelAndView delUser(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/common/main.do");
		regService.delUser(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/register/updateUser.do")
	public ModelAndView updateUser(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/common/main.do");
		regService.updateUser(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/register/regValidate.do", produces = "application/text; charset=utf-8")
	public void regValidate(CommandMap commandMap, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");

		Map<String, Object> resultEmail = regService.regValidateEmail(commandMap.getMap());
		Map<String, Object> resultName = regService.regValidateName(commandMap.getMap());
		boolean correct = true;
		String rmsg = "";
		
		if (resultEmail != null) {
			rmsg += "이미 존재하는 이메일입니다<br>";
			correct = false;
		}		
		if (resultName != null) {
			rmsg += "이미 존재하는 이름입니다<br>";
			correct = false;
		}
		System.out.println(commandMap.get("REGPWD").equals(commandMap.get("PWDREP")));
		if (!commandMap.get("REGPWD").equals(commandMap.get("PWDREP"))) {
			rmsg += "비밀번호가 일치하지 않습니다<br>";
			correct = false;
		}
		if (commandMap.get("REGPWD").toString().length() < 5) {
			rmsg += "비밀번호는 5자 이상 입력하셔야 합니다<br>";
			correct = false;
		}
		System.out.println("rmsg : "+rmsg);
		System.out.println("correct : "+correct);
		commandMap.put("CORRECT", correct);
		commandMap.put("RMSG", rmsg);

		String jmap = new Gson().toJson(commandMap.getMap());
		
		System.out.println(jmap);
		
		try {
			response.getWriter().write(jmap);
		} catch (JsonIOException e) {
			e.printStackTrace();
		}

	}

}
