package first.teamDMber.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import first.common.common.CommandMap;
import first.common.util.TimeDistance;
import first.teamDMber.sercvice.TeamDMberService;

@Controller
public class TeamDMberController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "teamDMberService")
	private TeamDMberService teamDMberService;

	
	//TEAM ID를 세션에 저장시켜주기위해 ( 리스트에서 선택해서 접근할경우)
	@RequestMapping(value = "/teamDetail/setTeamId.do")
	public ModelAndView setTeamId(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("forward:/teamDetail/openTeamInfo.do");
		session.setAttribute("TEAM_IDX", commandMap.get("IDX"));
		
		return mv;
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/teamDetail/openTeamInfo.do")
	public ModelAndView selectTeamInfo(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/teamDetail/teaminfo");
		commandMap.put("IDX", session.getAttribute("TEAM_IDX"));
		commandMap.put("LOGEMAIL", session.getAttribute("LOGEMAIL"));
		
		Map<String, Object> returnMap = teamDMberService.selectTeamInfo(commandMap.getMap());
		session.setAttribute("L_EMAIL", ((Map<String, Object>) returnMap.get("TEAMINFO")).get("L_EMAIL") );
		mv.addObject("TEAMINFO", returnMap.get("TEAMINFO"));
		mv.addObject("CHECKSTATUS", returnMap.get("CHECKSTATUS"));
		mv.addObject("RECENTBOARD", returnMap.get("RECENTBOARD"));
		mv.addObject("RECENTUSER", returnMap.get("RECENTUSER"));
		mv.addObject("TOTALUSER", returnMap.get("TOTALUSER"));
		mv.addObject("INGUSER", returnMap.get("INGUSER"));
		
		mv.addObject("TOTALUSER", returnMap.get("TOTALUSER"));
		mv.addObject("INGUSER", returnMap.get("INGUSER"));
	    	
		return mv;
	}

	@RequestMapping(value = "/teamDetail/openTeamMember.do")
    public ModelAndView selectTeamMember(CommandMap commandMap, HttpSession session) throws Exception{
    	ModelAndView mv = new ModelAndView("/teamDetail/teammember");
    	commandMap.put("IDX", session.getAttribute("TEAM_IDX"));
    	
    	List<Map<String,Object>> selectTeamMember = teamDMberService.selectTeamMember(commandMap.getMap());
    	mv.addObject("TEAMMEMBER", selectTeamMember);
    	
    	//MemberInfo에서 Applicant 탭에서만 Accept를 붙여주기 위함이다.
    	if(commandMap.get("STATUS") != null)
    	{
    		if(commandMap.get("STATUS").toString().equals("APPLIED"))
    		{
    			mv.addObject("ACCEPT_FLAG", "OK");
    		}
    	}
    	return mv;
    }

	@RequestMapping(value = "/teamDetail/openSearchMember.do")
	public ModelAndView selectMemberInfo(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/teamDetail/searchmember");
		Map<String, Object> selectMemberInfo = teamDMberService.selectMemberInfo(commandMap.getMap());
		mv.addObject("SEARCHMEMBER", selectMemberInfo);
		return mv;
	}

	@RequestMapping(value = "/teamDetail/teamBoardList.do")
	public ModelAndView teamBoardList(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/teamDetail/teamboard");
		commandMap.put("IDX", session.getAttribute("TEAM_IDX"));
		Map<String, Object> resultMap = teamDMberService.selectBoardList(commandMap.getMap());

		mv.addObject("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		mv.addObject("BOARDLIST", resultMap.get("result"));
		return mv;
	}

	@RequestMapping(value = "/teamDetail/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teamDetail/teamBoardList.do");
		commandMap.put("IDX", session.getAttribute("TEAM_IDX"));
		teamDMberService.insertBoard(commandMap.getMap(), request);
		return mv;
	}

	@RequestMapping(value = "/teamDetail/updateBoard.do")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teamDetail/teamBoardList.do");
		teamDMberService.updateBoard(commandMap.getMap(), request);
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}

	@RequestMapping(value = "/teamDetail/deleteBoard.do")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teamDetail/teamBoardList.do");
		teamDMberService.deleteBoard(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/teamDetail/teamAplly.do")
	public ModelAndView teamApply(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teamDetail/openTeamInfo.do");
		commandMap.put("IDX", session.getAttribute("TEAM_IDX"));
		teamDMberService.teamApply(commandMap.getMap(), request);
		return mv;
	}

	@RequestMapping(value = "/teamDetail/teamLeave.do")
	public ModelAndView teamLeave(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teamDetail/openTeamInfo.do");
		commandMap.put("IDX", session.getAttribute("TEAM_IDX"));
		teamDMberService.teamLeave(commandMap.getMap(), request);
		return mv;
	}
	@RequestMapping(value = "/teamDetail/accept.do")
	public ModelAndView accept(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teamDetail/openTeamMember.do");
		
		// TMID commandMap으로 뷰에서 넘어와야 : HIDDEN 통해서 TMID전송 - 지원수락, 초대수락 둘 다
		teamDMberService.accept(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value = "/teamDetail/ban.do")
	public ModelAndView teamBan(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teamDetail/openTeamMember.do");
		
		// TMID commandMap으로 뷰에서 넘어와야 : HIDDEN 통해서 TMID전송 - 지원수락, 초대수락 둘 다
		teamDMberService.banDo(commandMap.getMap());
		
		return mv;
	}
	
	//팀 채팅
	@RequestMapping(value="/teamDetail/ChatWindow.do")
	public ModelAndView viewChatWindow(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/teamDetail/chat-window");
		
		return mv;
	}
	
}