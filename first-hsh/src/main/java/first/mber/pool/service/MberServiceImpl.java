package first.mber.pool.service;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.mber.pool.dao.MberDAO;


@Service("mberService")
public class MberServiceImpl implements MberService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mberDAO")
	private MberDAO mberDAO;

	@Override
	public Map<String, Object> selectMberList(Map<String, Object> map) throws Exception {
		return mberDAO.selectMberList(map);
	}

	@Override
	public void insertChoice(Map<String, Object> map) throws Exception {
		mberDAO.insertChoice(map);
	}

	@Override
	public void initGenie(Map<String, Object> map) throws Exception {
		mberDAO.initGenie(map);
	}

	@Override
	public ArrayList<Map<String, Object>> selectGenieList(Map<String, Object> map) throws Exception {
		return mberDAO.selectGenieList(map);
	}
}
