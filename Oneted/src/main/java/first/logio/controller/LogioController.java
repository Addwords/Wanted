package first.logio.controller;

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
import first.logio.service.LogioService;
import first.mberlog.service.MLogService;

@Controller
public class LogioController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "logioService")
	private LogioService logioService;
	
	@Resource(name = "mLogService")
	private MLogService mLogService;

	@RequestMapping(value = "/logio/login.do", produces = "application/text; charset=utf-8")
	public void logIn(CommandMap commandMap, HttpSession session, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");

		Map<String, Object> logResult = logioService.login(commandMap.getMap());
		String lmsg = "";
		boolean success = true;

		if (logResult == null) {
			lmsg += "존재하지 않는 이메일입니다<br>";
			success = false;
			System.out.println("존재하지 않는 이메일");
		} else if (!(logResult.get("MBER_PWD").equals(commandMap.get("LOGPWD")))) {
			lmsg += "비밀번호가 틀렸습니다<br>";
			success = false;
			System.out.println("비밀번호 틀림");
		} else {
			session.setAttribute("LOGNAME", logResult.get("MBER_NAME"));
			session.setAttribute("LOGEMAIL", commandMap.get("LOGEMAIL"));
			mLogService.inLog(commandMap.getMap());
			System.out.println("session에 저장됨");
			System.out.println(session.getAttribute("LOGEMAIL"));
		}
		
		commandMap.put("LMSG", lmsg);
		commandMap.put("SUCCESS", success);

		String jmap = new Gson().toJson(commandMap.getMap());

		System.out.println(jmap);

		try {
			response.getWriter().write(jmap);
		} catch (JsonIOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/logio/logout.do")
	public ModelAndView logOut(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("/team/main");
		commandMap.put("OUTEMAIL", session.getAttribute("LOGEMAIL"));
		mLogService.outLog(commandMap.getMap());

		session.invalidate();

		return mv;
	}

	@RequestMapping(value = "/logio/main.do")
	public ModelAndView main(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/main");

		return mv;
	}

}
