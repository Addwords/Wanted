package first.teamMber.controller;

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

import first.common.common.CommandMap;
import first.teamMber.service.TeamMberService;

@Controller
public class TeamMberController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "teamMberService")
	private TeamMberService teamMberService;

	@RequestMapping(value = "/teamMber/leader.do")
	public void leader(CommandMap commandMap, HttpSession session) throws Exception {
		commandMap.put("LEADEREMAIL", session.getAttribute("LOGEMAIL"));
		// LEADERTEAM commandMap으로 뷰에서 넘어와야 : 팀생성하면서 팀 넘버 보내올 것
		teamMberService.leader(commandMap.getMap());
	}

	@RequestMapping(value = "/teamMber/apply.do")
	public void apply(CommandMap commandMap, HttpSession session) throws Exception {
		commandMap.put("APPLYEMAIL", session.getAttribute("LOGEMAIL"));
		// APPLYTEAM commandMap으로 뷰에서 넘어와야 : 팀 목록에서 선택해서 팀 넘버 가져올 것
		teamMberService.apply(commandMap.getMap());
	}

	@RequestMapping(value = "/teamMber/invite.do")
	public void invite(CommandMap commandMap, HttpServletResponse response) throws Exception {
		// INVITEEMAIL commandMap으로 뷰에서 넘어와야 : 인재풀에서 Email주소 가져올 것
		// INVITETEAM commandMap으로 뷰에서 넘어와야 : selLeaderTeam으로 뿌려준 팀 목록 버튼을 통해 팀
		// 넘버 가져올 것
		boolean inviteExist = false;
		Map<String, Object> resultInvite = teamMberService.inviteValidate(commandMap.getMap());
		if (resultInvite != null) {
			inviteExist = true;
		} else {
			teamMberService.invite(commandMap.getMap());			
		}		
		String jmap = new Gson().toJson(inviteExist);
		try {
			response.getWriter().write(jmap);
		} catch (JsonIOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/teamMber/accept.do")
	public void accept(CommandMap commandMap, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		// TMID commandMap으로 뷰에서 넘어와야 : HIDDEN 통해서 TMID전송 - 지원수락, 초대수락 둘 다
		teamMberService.accept(commandMap.getMap());
		try {
			response.getWriter().write("");
		} catch (JsonIOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/teamMber/decline.do")
	public void decline(CommandMap commandMap, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		// TMID commandMap으로 뷰에서 넘어와야 : HIDDEN 통해서 TMID전송 - 지원수락, 초대수락 둘 다
		teamMberService.decline(commandMap.getMap());
		try {
			response.getWriter().write("");
		} catch (JsonIOException e) {
			e.printStackTrace();
		}
		

	}

	@RequestMapping(value = "/teamMber/leave.do")
	public void leave(CommandMap commandMap, HttpSession session) throws Exception {
		commandMap.put("LEAVEEMAIL", session.getAttribute("LOGEMAIL"));
		// LEAVETEAM commandMap으로 뷰에서 넘어와야 : 팀 페이지에서 팀 넘버 전송
		teamMberService.leave(commandMap.getMap());

	}

	@RequestMapping(value = "/teamMber/expel.do")
	public void expel(CommandMap commandMap, HttpSession session) throws Exception {
		// LEAVEEMAIL commandMap으로 뷰에서 넘어와야 : 팀원창에서 선택
		// LEAVETEAM commandMap으로 뷰에서 넘어와야 : 팀 페이지에서 팀 넘버 전송
		teamMberService.leave(commandMap.getMap());
	}

	@RequestMapping(value = "/teamMber/disband.do")
	public void disband(CommandMap commandMap, HttpSession session) throws Exception {
		// 팀 테이블에서 해야 할 문제인듯, 여기서는 해당 팀원들 상태를 바꿔주는 걸로
		// DISTEAM commandMap으로 넘어와야
		teamMberService.disband(commandMap.getMap());

	}

	@RequestMapping(value = "/teamMber/selApplicant.do")
	public void selApplicant(CommandMap commandMap) throws Exception {
		// SELTEAM commandMap으로 뷰에서 넘어와야 : 팀 페이지에서 팀장이 받아서 지원수락/거절
		teamMberService.selApplicant(commandMap.getMap());
	}

	@RequestMapping(value = "/teamMber/selInvitation.do")
	public void selInvitation(CommandMap commandMap, HttpSession session, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		commandMap.put("SELEMAIL", session.getAttribute("LOGEMAIL"));
		List<Map<String, Object>> invitationList = teamMberService.selInvitation(commandMap.getMap());

		// commandMap.put("invitationList", invitationList);

		String jmap = new Gson().toJson(invitationList);
		try {
			response.getWriter().write(jmap);
		} catch (JsonIOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/teamMber/selTeamMember.do")
	public void selTeamMember(CommandMap commandMap) throws Exception {
		// SELTEAM commandMap으로 뷰에서 넘어와야 : 굳이 필요없는 기능일듯, 팀 테이블에서 불러오면 됨
		teamMberService.selTeamMember(commandMap.getMap());

	}

	@RequestMapping(value = "/teamMber/selTeamLeader.do")
	public void selTeamLeader(CommandMap commandMap) throws Exception {
		// SELTEAM commandMap으로 뷰에서 넘어와야 : 굳이 필요없는 기능일듯, 팀 테이블에서 불러오면 됨
		teamMberService.selTeamLeader(commandMap.getMap());
	}

	@RequestMapping(value = "/teamMber/selLeaderTeam.do")
	public void selLeaderTeam(CommandMap commandMap, HttpSession session, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		List<Map<String, Object>> leaderTeamList=null;
		System.out.println(session.getAttribute("LOGEMAIL"));
		if (session.getAttribute("LOGEMAIL") == null){
			
		}else{
		commandMap.put("SELEMAIL", session.getAttribute("LOGEMAIL"));
		leaderTeamList = teamMberService.selLeaderTeam(commandMap.getMap());
		}
		String jmap = new Gson().toJson(leaderTeamList);
		try {
			response.getWriter().write(jmap);
		} catch (JsonIOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/teamMber/selMyTeam.do")
	public void selMyTeam(CommandMap commandMap, HttpSession session) throws Exception {
		commandMap.put("SELEMAIL", session.getAttribute("LOGEMAIL"));
		teamMberService.selMyTeam(commandMap.getMap());
	}

}
