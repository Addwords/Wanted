package first.project.service;

import java.util.List;
import java.util.Map;


public interface ProjectService { 
	//모든 카테고리
	List<Map<String, Object>> selectProjectList_all(Map<String, Object> map) throws Exception;
	//기획&아이디어
	List<Map<String, Object>> selectProjectList_idea(Map<String, Object> map) throws Exception;
	//네이밍&슬로건
	List<Map<String, Object>> selectProjectList_naming(Map<String, Object> map) throws Exception;
	//디자인
	List<Map<String, Object>> selectProjectList_design(Map<String, Object> map) throws Exception;
	//광고&마케팅
	List<Map<String, Object>> selectProjectList_marketing(Map<String, Object> map) throws Exception;
	//영상&UCC
	List<Map<String, Object>> selectProjectList_video(Map<String, Object> map) throws Exception;
	//게임&소프트웨어
	List<Map<String, Object>> selectProjectList_sw(Map<String, Object> map) throws Exception;
	//창업
	List<Map<String, Object>> selectProjectList_founded(Map<String, Object> map) throws Exception;
	//프로젝트 디테일
	List<Map<String, Object>> selectProject(Map<String, Object> map) throws Exception;


}
