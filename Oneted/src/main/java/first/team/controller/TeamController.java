package first.team.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
	
	
	@RequestMapping(value="/team/openTeamList.do")
    public ModelAndView selectTeamList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/team_main");
    	
    	List<Map<String,Object>> tlist = teamService.selectTeamList(commandMap.getMap());
    	mv.addObject("tlist", tlist);
    	
    	return mv;
    }
	
	@RequestMapping(value="/team/openProjectList.do")
    public ModelAndView selectProjectList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/team/team_main");
    	
    	List<Map<String,Object>> plist = teamService.selectProjectList(commandMap.getMap());
    	mv.addObject("plist", plist);
    	
    	return mv;
    }
	
	@RequestMapping(value="/team/openTeamDetail.do")
	public ModelAndView selectTeam(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/team/team_detail");
		
		List<Map<String,Object>> teamone = teamService.selectTeam(commandMap.getMap());
		mv.addObject("teamone", teamone);
		
		return mv;
	}
	
	@RequestMapping(value="/team/openProjectDetail.do")
	public ModelAndView selectProject(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/team/project_detail");
		
		List<Map<String,Object>> projectone = teamService.selectProject(commandMap.getMap());
		mv.addObject("projectone", projectone);
		
		return mv;
	}
}
