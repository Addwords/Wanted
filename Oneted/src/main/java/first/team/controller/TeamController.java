package first.team.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import first.common.common.CommandMap;
import first.common.util.TimeDistance;
import first.team.sercvice.TeamService;

@Controller
public class TeamController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="teamService")
	private TeamService teamService;
	
	@RequestMapping(value="/team/openTeamInfo.do")
    public ModelAndView selectTeamInfo(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/teaminfo");
    	commandMap.put("IDX", 2);
    	Map<String,Object> selectTeamInfo = teamService.selectTeamInfo(commandMap.getMap());
    	mv.addObject("TEAMINFO", selectTeamInfo);
    	return mv;
    }
	
	@RequestMapping(value="/team/openTeamMember.do")
    public ModelAndView selectTeamMember(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/teammember");
    	List<Map<String,Object>> selectTeamMember = teamService.selectTeamMember(commandMap.getMap());
    	mv.addObject("TEAMMEMBER", selectTeamMember);    	
    	return mv;
    }
	
	@RequestMapping(value="/team/openSearchMember.do")
    public ModelAndView selectMemberInfo(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/searchmember");
    	Map<String,Object> selectMemberInfo = teamService.selectMemberInfo(commandMap.getMap());
    	mv.addObject("SEARCHMEMBER", selectMemberInfo);
    	return mv;
    }
	
	@RequestMapping(value="/team/openTeamContact.do")
    public ModelAndView selectTeamContact(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/teamcontact");
    	commandMap.put("IDX", 2);
    	Map<String,Object> selectTeamContact = teamService.selectTeamContact(commandMap.getMap());
    	mv.addObject("TEAMCONTACT", selectTeamContact);
    	return mv;
    }
	
	@RequestMapping(value="/team/teamBoardList.do")
    public ModelAndView teamBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/teamboard");
//    	List<Map<String,Object>> selectBoardList=teamService.selectBoardList(commandMap.getMap());
//    	mv.addObject("BOARDLIST", selectBoardList);
    	Map<String,Object> resultMap = teamService.selectBoardList(commandMap.getMap());
    	
	    mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
	    mv.addObject("BOARDLIST", resultMap.get("result"));
    	return mv;
    }
	
	@RequestMapping(value="/team/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/team/teamBoardList.do");
		commandMap.put("WRITER", "c@c.com");
		teamService.insertBoard(commandMap.getMap(), request);
		return mv;
	}
	
	@RequestMapping(value="/team/updateBoard.do")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/team/teamBoardList.do");
		teamService.updateBoard(commandMap.getMap(), request);
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	@RequestMapping(value="/team/deleteBoard.do")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/team/teamBoardList.do");
		teamService.deleteBoard(commandMap.getMap());
		return mv;
	}
}