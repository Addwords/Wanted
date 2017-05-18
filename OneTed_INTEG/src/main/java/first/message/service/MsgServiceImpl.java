package first.message.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.util.FileUtils;
import first.message.dao.MsgDAO;

@Service("msgService")
public class MsgServiceImpl implements MsgService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "msgDAO")
	private MsgDAO msgDAO;

	@Override
	public List<Map<String, Object>> listMsg(Map<String, Object> map) throws Exception {
		return msgDAO.listMsg(map);
	}
	
	@Override
	public List<Map<String, Object>> searchSenderMsg(Map<String, Object> map) throws Exception {
		return msgDAO.searchSenderMsg(map);
	}
	@Override
	public List<Map<String, Object>> searchSubjectMsg(Map<String, Object> map) throws Exception {
		return msgDAO.searchSubjectMsg(map);
	}
	@Override
	public List<Map<String, Object>> searchContentsMsg(Map<String, Object> map) throws Exception {
		return msgDAO.searchContentsMsg(map);
	}
	@Override
	public List<Map<String, Object>> searchWritedayMsg(Map<String, Object> map) throws Exception {
		return msgDAO.searchWritedayMsg(map);
	}

	@Override
	public void sendMsg(Map<String, Object> map) throws Exception {
		msgDAO.sendMsg(map);
	}

	@Override
	public Map<String, Object> detailMsg(Map<String, Object> map) throws Exception {
		return msgDAO.detailMsg(map);
	}

	@Override
	public void delMsg(Map<String, Object> map) throws Exception {
		msgDAO.delMsg(map);
	}
	
	@Override
	public Map<String, Object> reciValid(Map<String, Object> map) throws Exception{
		return msgDAO.reciValid(map);
	}

}
