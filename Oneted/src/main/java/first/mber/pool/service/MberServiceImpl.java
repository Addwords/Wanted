package first.mber.pool.service;

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
	public Map<String, Object> selectMberList(Map<String, Object> map) {
		return mberDAO.selectMberList(map);
	}
}
