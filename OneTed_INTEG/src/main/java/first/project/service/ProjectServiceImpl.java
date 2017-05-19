package first.project.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.project.dao.ProjectDAO;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="projectDAO")
	private ProjectDAO projectDAO;

	//프로젝트 디테일
	@Override
	public List<Map<String, Object>> selectProject(Map<String, Object> map) throws Exception {
		return projectDAO.selectProject(map); 
	}
	//모든 카테고리
	@Override
	public List<Map<String, Object>> selectProjectList_all(Map<String, Object> map) throws Exception {
		return projectDAO.selectProjectList_all(map);
	}
	
	//기획&아이디어
	@Override
	public List<Map<String, Object>> selectProjectList_idea(Map<String, Object> map) throws Exception {
		return projectDAO.selectProjectList_idea(map);
	}
	
	//게임&소프트웨어
	@Override
	public List<Map<String, Object>> selectProjectList_sw(Map<String, Object> map) throws Exception {
		return projectDAO.selectProjectList_sw(map);
	}

	//네이밍
	@Override
	public List<Map<String, Object>> selectProjectList_naming(Map<String, Object> map) throws Exception {
		return projectDAO.selectProjectList_naming(map);
	}

	//디자인
	@Override
	public List<Map<String, Object>> selectProjectList_design(Map<String, Object> map) throws Exception {
		return projectDAO.selectProjectList_design(map);
	}

	//마케팅
	@Override
	public List<Map<String, Object>> selectProjectList_marketing(Map<String, Object> map) throws Exception {
		return projectDAO.selectProjectList_marketing(map);
	}

	//영상&UCC
	@Override
	public List<Map<String, Object>> selectProjectList_video(Map<String, Object> map) throws Exception {
		return projectDAO.selectProjectList_video(map);
	}

	//창업
	@Override
	public List<Map<String, Object>> selectProjectList_founded(Map<String, Object> map) throws Exception {
		return projectDAO.selectProjectList_founded(map);

	}

}
