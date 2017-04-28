package first.register.service;

import java.util.Map;

public interface RegService {	

	void register(Map<String, Object> map) throws Exception;
	
	void delUser(Map<String, Object> map) throws Exception;
	
	void updateUser(Map<String, Object> map) throws Exception;
	
	Map<String, Object> regValidate(Map<String, Object> map) throws Exception;

}
