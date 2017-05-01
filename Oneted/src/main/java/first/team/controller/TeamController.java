package first.team.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
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
}