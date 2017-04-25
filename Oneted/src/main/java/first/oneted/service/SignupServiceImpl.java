package first.oneted.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.oneted.dao.SignupDAO;

public class SignupServiceImpl {

	@Service("signupService")
	public class signupServiceImpl implements SignupService{
		Logger log = Logger.getLogger(this.getClass());
		

		
		@Resource(name="signupDAO")
		private SignupDAO signupDAO;
		
		@Override
		public List<Map<String, Object>> selectsignup(Map<String, Object> map) throws Exception {
			
			return ((SignupService) signupDAO).selectsignup(map);
		}

}
}
