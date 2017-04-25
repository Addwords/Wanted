package first.oneted.service;

import java.util.List;
import java.util.Map;

public interface SignupService {

	List<Map<String, Object>> selectsignup(Map<String, Object> map) throws Exception;
}
