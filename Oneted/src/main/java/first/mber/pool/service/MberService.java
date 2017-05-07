package first.mber.pool.service;

import java.util.ArrayList;
import java.util.Map;

public interface MberService {

	Map<String, Object> selectMberList(Map<String, Object> map) throws Exception;

	void insertChoice(Map<String, Object> map) throws Exception;

	void initGenie(Map<String, Object> map) throws Exception;

	ArrayList<Map<String, Object>> selectGenieList(Map<String, Object> map) throws Exception;

}
