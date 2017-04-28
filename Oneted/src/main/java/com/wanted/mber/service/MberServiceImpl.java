package com.wanted.mber.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.wanted.mber.dao.MberDAO;


@Service("mberService")
public class MberServiceImpl implements MberService {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="mberDAO")
    private MberDAO mberDAO;

	@Override
	public Map<String, Object> selectMberDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = mberDAO.selectMberDetail(map);
		resultMap.put("map", tempMap);
		return resultMap;
	}
	
	/*******************상하꺼 추가부분 *******************/
	@Override
	public Map<String, Object> selectMberList(Map<String, Object> map) {
		return mberDAO.selectMberList(map);
	}

	
}
