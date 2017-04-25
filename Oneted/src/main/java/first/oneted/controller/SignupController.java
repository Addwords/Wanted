package first.oneted.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import first.oneted.dao.SignupDAO;
import first.oneted.dto.SignupDTO;

public class SignupController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		// req.setCharacterEncoding("EUC-KR");
		// 한글처리

		SignupDTO dto = new SignupDTO();
		SignupDAO dao = new SignupDAO();
		PrintWriter out = resp.getWriter();
		int result;

		dto.setEmail(req.getParameter("email"));
		dto.setPw(req.getParameter("pw"));
		dto.setName(req.getParameter("name"));
		dto.setNick(req.getParameter("nick"));
		dto.setAddr(req.getParameter("addr"));

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
		Date date = null;

		try {
			date = sdf
					.parse(req.getParameter("year") + "/" + req.getParameter("month") + "/" + req.getParameter("day"));
			// 입력받은 년,월,일을 date 포맷으로 변경
		} catch (ParseException e) {
			e.printStackTrace();
		}

		dto.setBirth(date);

		result = dao.insertsignup(dto);

		if (result == 0) {
			System.out.println("Faile");
		} else {
			System.out.println("Sucsses");
		}
	}

}
