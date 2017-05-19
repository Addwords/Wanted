package first.project.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.project.service.ProjectService;

@Controller
public class ProjectController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="projectService")
	private ProjectService projectService;
	
	//프로젝트 리스트 출력(ALL)
	@RequestMapping(value="/project/openProjectList_all.do")
    public ModelAndView selectProjectList_ALL(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/project/project_main");
    	List<Map<String,Object>> plist = projectService.selectProjectList_all(commandMap.getMap());
    	mv.addObject("plist", plist);
    	return mv;
    }
	
	//프로젝트 리스트 출력(idea)
	@RequestMapping(value="/project/openProjectList_idea.do")
    public ModelAndView selectProjectList_IDEA(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/project/project_main");
    	List<Map<String,Object>> plist = projectService.selectProjectList_idea(commandMap.getMap());
    	mv.addObject("plist", plist);
    	return mv; 
    }
	//프로젝트 리스트 출력(naming)
	@RequestMapping(value="/project/openProjectList_naming.do")
	public ModelAndView selectProjectList_NAMING(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/project/project_main");
		List<Map<String,Object>> plist = projectService.selectProjectList_naming(commandMap.getMap());
		mv.addObject("plist", plist);
		return mv;
	}
	//프로젝트 리스트 출력(design)
	@RequestMapping(value="/project/openProjectList_design.do")
	public ModelAndView selectProjectList_DESIGN(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/project/project_main");
		List<Map<String,Object>> plist = projectService.selectProjectList_design(commandMap.getMap());
		mv.addObject("plist", plist);
		return mv;
	}
	//프로젝트 리스트 출력(video)
	@RequestMapping(value="/project/openProjectList_video.do")
	public ModelAndView selectProjectList_VIDEO(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/project/project_main");
		List<Map<String,Object>> plist = projectService.selectProjectList_video(commandMap.getMap());
		mv.addObject("plist", plist);
		return mv;
	}
	//프로젝트 리스트 출력(marketing)
	@RequestMapping(value="/project/openProjectList_marketing.do")
	public ModelAndView selectProjectList_MARKETING(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/project/project_main");
		List<Map<String,Object>> plist = projectService.selectProjectList_marketing(commandMap.getMap());
		mv.addObject("plist", plist);
		return mv;
	}
	//프로젝트 리스트 출력(founded)
		@RequestMapping(value="/project/openProjectList_founded.do")
		public ModelAndView selectProjectList_FOUNDED(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/project/project_main");
			List<Map<String,Object>> plist = projectService.selectProjectList_founded(commandMap.getMap());
			mv.addObject("plist", plist);
			return mv;
		}
	//프로젝트 리스트 출력(sw)
		@RequestMapping(value="/project/openProjectList_sw.do")
	    public ModelAndView selectProjectList_SW(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("/project/project_main");
	    	List<Map<String,Object>> plist = projectService.selectProjectList_sw(commandMap.getMap());
	    	mv.addObject("plist", plist);
	    	return mv;
	    }
	
	//프로젝트 상세보기 
	@RequestMapping(value="/project/openProjectDetail.do")
	public ModelAndView selectProject(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/project/project_detail");
		List<Map<String,Object>> projectone = projectService.selectProject(commandMap.getMap());
		mv.addObject("projectone", projectone);
		return mv;
	}

}
