package first.team.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.team.service.TeamService;

@Controller
public class TeamController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="teamService")
	private TeamService teamService;
	
	//리스트 검색
	@RequestMapping(value="/team/searchList.do")
    public ModelAndView searchTeamList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/team_main");
    	List<Map<String,Object>> tlist = teamService.searchTeamList(commandMap.getMap());
    	List<Map<String,Object>> plist = teamService.searchProjectList(commandMap.getMap());
    	mv.addObject("tlist", tlist);
    	mv.addObject("plist", plist);
    	
    	return mv;
    }
	//팀 리스트 출력
	@RequestMapping(value="/team/openTeamList.do")
    public ModelAndView selectTeamList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/team_main");
    	
    	List<Map<String,Object>> tlist = teamService.selectTeamList(commandMap.getMap());
    	mv.addObject("tlist", tlist);
    	
    	return mv;
    }
	//프로젝트 리스트 출력
	@RequestMapping(value="/team/openProjectList.do")
    public ModelAndView selectProjectList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/team_main");
    	
    	List<Map<String,Object>> plist = teamService.selectProjectList(commandMap.getMap());
    	mv.addObject("plist", plist);
    	
    	return mv;
    }
	//팀 상세보기
	@RequestMapping(value="/team/openTeamDetail.do")
	public ModelAndView selectTeam(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/team/teaminfo");
		
//		Map<String,Object> teamone = teamService.selectTeam(commandMap.getMap());
//		mv.addObject("TEAMONE", teamone);
//		
//		Map<String,Object> tmlist = teamService.selectTeam(commandMap.getMap());
//		mv.addObject("TMLIST", tmlist);
		return mv;
	}
	//프로젝트 상세보기
	@RequestMapping(value="/team/openProjectDetail.do")
	public ModelAndView selectProject(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/team/project_detail");
		
		List<Map<String,Object>> projectone = teamService.selectProject(commandMap.getMap());
		mv.addObject("projectone", projectone);
		List<Map<String,Object>> pmlist = teamService.selectProjectMember(commandMap.getMap());
    	mv.addObject("pmlist", pmlist);
		return mv;
	}
	//프로젝트 만들기
	@RequestMapping(value="/team/createProject.do")
	public ModelAndView createProject(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/team/create_project");
		
		return mv;
	}
	//팀 만들기
	@RequestMapping(value="/team/createTeam.do")
	public ModelAndView createTeam(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/team/create_team2");
		
		return mv;
	}
	//내 팀 보기
	@RequestMapping(value="/team/myteam_list.do")
	public ModelAndView myTeam(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/team/my_list");
		String id = (String)session.getAttribute("id");
		commandMap.put("IDI", id);
		List<Map<String,Object>> myteam = teamService.myTeam(commandMap.getMap());
		mv.addObject("myteam", myteam);
		return mv;
	}
	//내 프로젝트 보기
	@RequestMapping(value="/team/myproject_list.do")
	public ModelAndView myProject(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/team/my_list");
		String id = (String)session.getAttribute("id");
		commandMap.put("IDI", id);
		List<Map<String,Object>> myproject = teamService.myProject(commandMap.getMap());
		mv.addObject("myproject", myproject);
		return mv;
	}
	
	//팀 멤버들 보기
	@RequestMapping(value="/team/openTeamMember.do")
    public ModelAndView selectTeamMember(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/teammember");
    	List<Map<String,Object>> selectTeamMember = teamService.selectTeamMember(commandMap.getMap());
    	mv.addObject("TEAMMEMBER", selectTeamMember);    	
    	return mv;
    }
	 //멤버 상세보기
	@RequestMapping(value="/team/openSearchMember.do")
    public ModelAndView selectMemberInfo(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/searchmember");
    	Map<String,Object> selectMemberInfo = teamService.selectMemberInfo(commandMap.getMap());
    	mv.addObject("SEARCHMEMBER", selectMemberInfo);
    	return mv;
    }
	
	
	/********************상하추가*******************/
	//팀 상세보기
	@RequestMapping(value="/team/openTeamChat.do")
	public ModelAndView viewTeamChat(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/team/team-chat");
		
		return mv;
	}
	
	//팀 상세보기
	@RequestMapping(value="/team/ChatWindow.do")
	public ModelAndView viewChatWindow(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/team/chat-window");
		
		return mv;
	}
	
}
