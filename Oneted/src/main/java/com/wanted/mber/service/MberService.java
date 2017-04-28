package com.wanted.mber.service;

import java.util.Map;

public interface MberService {

	Map<String, Object> selectMberDetail(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMberList(Map<String, Object> map) throws Exception;
	
}
