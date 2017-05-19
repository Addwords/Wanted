package first.mberDetail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.util.FileUtils;
import first.mberDetail.dao.MberDetailDAO;


@Service("mberDetailService")
public class MberDetailServiceImpl implements MberDetailService {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="mberDetailDAO")
    private MberDetailDAO mberDetailDAO;
    
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public Map<String, Object> selectMberDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> infoMap = mberDetailDAO.selectMberDetail(map);		
		resultMap.put("map", infoMap);		
		return resultMap;
	}
	@Override
	public Map<String, Object> selectMberSkill(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		ArrayList<Map<String, Object>> skillMap = mberDetailDAO.selectMberSkill(map);
		resultMap.put("skill", skillMap);
		return resultMap;
	}
	
	/*******************상하꺼 추가부분 *******************/
	@Override
	public Map<String, Object> selectMberList(Map<String, Object> map) {
		return mberDetailDAO.selectMberList(map);
	}
	@Override
	public void insertMberSkill(Map<String, Object> map, HttpServletRequest request) {
		mberDetailDAO.insertMberSkill(map);
		
	}
	@Override
	public void insertMberInfo(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = fileUtils.parseInsertFileInfoOne(map, request);
		
		System.out.println(resultMap.get("STORED_FILE_NAME"));
		
		mberDetailDAO.insertMberInfo(resultMap);
		
	}
	@Override
	public Map<String, Object> selectMberWrite(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> Map = mberDetailDAO.selectMberWrite(map);		
		resultMap.put("map", Map);		
		return resultMap;
	}



	
}
