package com.wanted.dao;


import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("mberDAO")
public class MberDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> detailMberView(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>) selectOne("mber.detailMberView", map);
	}

}
