package com.wanted.mber.dao;



import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("mberDAO")
public class MberDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMberDetail(Map<String, Object> map) throws Exception{
		
	    return (Map<String, Object>) selectOne("mber.selectMberDetail", map);
	}

	/************상하꺼 추가부분***************/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMberList(Map<String, Object> map) {
		return (Map<String, Object>)selectPagingList("mber.selectMberList", map, 12);
	}
}