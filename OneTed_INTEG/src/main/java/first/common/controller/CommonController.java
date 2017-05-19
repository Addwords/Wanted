package first.common.controller;

import java.io.File;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.common.service.CommonService;
import first.common.util.CommonUtils;
import first.teamMber.service.TeamMberService;

@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@Resource(name = "teamMberService")
	private TeamMberService teamMberService;

	@RequestMapping(value = "/common/main.do")
	public ModelAndView ViewMain(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception {		
		
		
		ModelAndView mv = new ModelAndView("/main");
		if(session.getAttribute("LOGEMAIL")==null){
			
		}else{
			commandMap.put("SELEMAIL", session.getAttribute("LOGEMAIL"));		
			List<Map<String,Object>> teamList =  teamMberService.selMyTeam(commandMap.getMap());
			session.setAttribute("teamList", teamList);
			mv.addObject("teamList", teamList);
		}
		return mv;
	}

	
	@RequestMapping(value="/common/downloadFile.do")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
		Map<String,Object> map = commonService.selectFileInfo(commandMap.getMap());
		String storedFileName = (String)map.get("STORED_FILE_NAME");
		String originalFileName = (String)map.get("ORIGINAL_FILE_NAME");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\dev\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
    //이미지 파일을 컨트롤러를 경유해서 로컬 저장소에서 띄우기 위한것 가장어려웠던부분 포스팅할 것
    @RequestMapping(value="common/getImage.do")
    protected void getImageFile(CommandMap commandMap, HttpServletResponse response) throws Exception
    {
        String fileName = (String) commandMap.get("IMG_NAME");

        if(!fileName.isEmpty())
        {
	        File file = new File(CommonUtils.filePath+fileName);
	        response.setHeader("Content-Type", "image/*");
	        response.setHeader("Content-Length", String.valueOf(file.length()));
	        response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
	        Files.copy(file.toPath(), response.getOutputStream());
	        
	        response.getOutputStream().flush();
	        response.getOutputStream().close();
        }
    }
}
