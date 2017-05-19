package first.project.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("projectDAO")
public class ProjectDAO extends AbstractDAO{
	
	//프로젝트 리스트(ALL)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList_all(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("project.selectProjectList_all", map);
	}
	
	//프로젝트 리스트(IDEA)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList_idea(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("project.selectProjectList_idea", map);
	}
	
	//프로젝트 리스트(NAMING&SLOGAN)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList_naming(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("project.selectProjectList_naming", map);
	}
	
	//프로젝트 리스트(DESIGN)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList_design(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("project.selectProjectList_design", map);
	}
	
	//프로젝트 리스트(MARKETING)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList_marketing(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("project.selectProjectList_marketing", map);
	}
	
	//프로젝트 리스트(VIDEO&UCC)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList_video(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("project.selectProjectList_video", map);
	}
	
	//프로젝트 리스트(GAME&S/W)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList_sw(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("project.selectProjectList_sw", map);
	}
	
	//프로젝트 리스트(FOUNDED)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList_founded(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("project.selectProjectList_founded", map);
	}
	
	
	
	//프로젝트 디테일
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProject(Map<String, Object> map) throws Exception{
		System.out.println("durl");
		return (List<Map<String, Object>>)selectPagingList("project.selectProjectOne", map);
	}

}
