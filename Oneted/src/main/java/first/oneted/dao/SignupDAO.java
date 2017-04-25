package first.oneted.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import first.oneted.dto.SignupDTO;
import first.oneted.myBatisSetting.SqlMapConfig;

public class SignupDAO {

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public SignupDAO() {
	 
	 sqlsession = sessionf.openSession(true); //true 로 할시 자동 commit
	 
	 }

	public int insertsignup(SignupDTO dto) {
		int result;
		result = sqlsession.insert("insertSignup", dto);

		return result;
	}
}
