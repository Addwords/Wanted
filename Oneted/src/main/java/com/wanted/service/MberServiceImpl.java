package com.wanted.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.common.util.FileUtils;

import com.wanted.dao.MberDAO;


@Service("mberService")
public class MberServiceImpl implements MberService {
    Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="fileUtils")
    private FileUtils fileUtils;
     
    @Resource(name="mberDAO")
    private MberDAO mberDAO;

	@Override
	public Map<String, Object> detailMberView(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = mberDAO.detailMberView(map);
		return resultMap;
	}
	
}
