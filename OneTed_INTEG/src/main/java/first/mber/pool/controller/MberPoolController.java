package first.mber.pool.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;
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

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import first.common.common.CommandMap;
import first.mber.pool.service.MberService;
import first.teamMber.service.TeamMberService;

@Controller
public class MberPoolController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "mberService")
	private MberService mberService;
	@Resource(name = "teamMberService")
	private TeamMberService teamMberService;

	@RequestMapping(value = "/mber/pool.do")
	public ModelAndView selectMberList(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/mber/mber-pool");
		Map<String, Object> resultMap = mberService.selectMberList(commandMap.getMap());

		mv.addObject("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));
		mv.addObject("search", commandMap.get("search"));
		if (session.getAttribute("LOGEMAIL") == null) {

		} else {
			commandMap.put("SELEMAIL", session.getAttribute("LOGEMAIL"));
			List<Map<String, Object>> leaderTeamList = teamMberService.selLeaderTeam(commandMap.getMap());
			mv.addObject("leaderTeamList", leaderTeamList);
		}
		return mv;
	}

	/************** Genie *******************/
	// 지니를 하기전 전에 했던 설문조사 내역은 모두 delete 한다 (중복 답변을 방지하기 위해서)
	@RequestMapping(value = "/genie/init.do")
	public void initGenie(CommandMap commandMap, HttpServletResponse response) throws Exception {
		mberService.initGenie(commandMap.getMap());

		try {
			response.getWriter().write("success");
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/genie/insert.do")
	public void insertChoice(CommandMap commandMap, HttpServletResponse response) throws Exception {
		mberService.insertChoice(commandMap.getMap());

		try {
			response.getWriter().write("success");
			response.getWriter().close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/genie/getResult.do")
	public void selectGenieResult(CommandMap commandMap, HttpServletResponse response) throws Exception {

		ArrayList<Map<String, Object>> list = mberService.selectGenieList(commandMap.getMap());

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(list);

		try {
			response.getWriter().write(gson);
		} catch (JsonIOException e) {
			e.printStackTrace();
		}
	}

}
