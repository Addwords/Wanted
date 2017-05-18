package first.mberDetail.dao;



import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("mberDetailDAO")
public class MberDetailDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMberDetail(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>) selectOne("mberDetail.selectMberDetail", map);
	}
	@SuppressWarnings("unchecked")
	public ArrayList<Map<String, Object>> selectMberSkill(Map<String, Object> map) throws Exception{
	    return (ArrayList<Map<String, Object>>) selectList("mberDetail.selectMberSkill", map);
	}
	

	/************상하꺼 추가부분***************/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMberList(Map<String, Object> map) {
		return (Map<String, Object>)selectPagingList("mberDetail.selectMberList", map, 12);
	}

	public void insertMberSkill(Map<String, Object> map) {
		insert("mberDetail.insertMberSkill", map);			
	}
	public void insertMberInfo(Map<String, Object> map) {
		update("mberDetail.insertMberInfo", map);	
		
	}
	@SuppressWarnings("unchecked")
	public java.util.Map<String, Object> selectMberWrite(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("mberDetail.selectMberWrite", map);
	}
}