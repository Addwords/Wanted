package first.oneted.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {

	List<Map<String, Object>> selectlogin(Map<String, Object> map) throws Exception;



}
