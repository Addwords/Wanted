package first.mber.pool.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import first.common.common.CommandMap;
import first.mber.pool.service.MberService;

@Controller
public class MberPoolController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "mberService")
	private MberService mberService;
	
	@RequestMapping(value="/mber/pool.do")
    public ModelAndView selectMberList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/mber/mber-pool");
    	Map<String,Object> resultMap = mberService.selectMberList(commandMap.getMap());
    	
    	mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
	    mv.addObject("list", resultMap.get("result"));
    	
    	return mv;
    }
	
}
