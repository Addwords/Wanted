package first.mberlog.service;


import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.util.FileUtils;
import first.mberlog.dao.MLogDAO;
import first.register.dao.RegDAO;

@Service("mLogService")
public class MLogServiceImpl implements MLogService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "mLogDAO")
	private MLogDAO mLogDAO;

	@Override
	public void createLog(Map<String, Object> map) throws Exception {
		mLogDAO.createLog(map);
		
	}

	@Override
	public void inLog(Map<String, Object> map) throws Exception {
		mLogDAO.inLog(map);
		
	}

	@Override
	public void outLog(Map<String, Object> map) throws Exception {
		mLogDAO.outLog(map);
		
	}

	@Override
	public Map<String, Object> searchLog(Map<String, Object> map) throws Exception {
		return mLogDAO.searchLog(map);
	}

	

}
