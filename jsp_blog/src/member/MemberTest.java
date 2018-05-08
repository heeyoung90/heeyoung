package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.Out;

public class MemberTest {
	
	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		
		//duplicateId(dao);
		//duplicateEmail(dao);
		//create(dao);
		//list(dao);
		//total(dao);
		//read(dao);
		//update(dao);
		//getfname(dao);
		//delete(dao);
		loginCheck(dao);
		
	}

	private static void loginCheck(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "hyhy");
		map.put("pw", "1234");
		if(dao.loginCheck(map)) {
			p("회원입니다.로그인");
		}else {
			p("id/pw 잘못되었거나 회원아님");
		}
		
	}

	private static void delete(MemberDAO dao) {
		String id = "hjbro";
		boolean flag = dao.delete(id);
		if(flag) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void getfname(MemberDAO dao) {
		String id = "hy";
	
		p(dao.getFname(id));
		
	}

	private static void update(MemberDAO dao) {
		MemberDTO dto = dao.read("hj");
		dto.setTel("000-0000-0000");
		dto.setAddress1("서울시 강남구");
		dto.setAddress2("123");
		dto.setEmail("jjjj@mail.com");
		dto.setJob("A10");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("user1");
		p(dto);
		
	}

	private static void total(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "");
		
		p("레코드갯수:"+dao.total(map));
		
	}

	private static void list(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<MemberDTO> list = dao.list(map);
		for(int i = 0; i<list.size();i++) {
			MemberDTO dto = list.get(i);
			p(dto);
			p("--------");
		}
		
	}

	private static void p(MemberDTO dto) {
		p("아이디:"+dto.getId());
		p("이름:"+dto.getMname());
		p("전화번호:"+dto.getTel());
		p("이메일:"+dto.getEmail());
		p("우편번호:"+dto.getZipcode());
		p("주소1:"+dto.getAddress1());
		p("주소2:"+dto.getAddress2());
		p("직업:"+dto.getJob());
		p("사진:"+dto.getFname());
		p("가입날짜:"+dto.getMdate());
		
		
	}

	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto.setId("test");
		dto.setPasswd("1234");
		dto.setTel("010-4444-7777");
		dto.setEmail("dddd@mail.com");
		dto.setMname("홍길동");
		dto.setAddress1("서울시 종로구 관철동");
		dto.setAddress2("13-13");
		dto.setJob("A01");
		dto.setFname("aaa.jpg");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void duplicateEmail(MemberDAO dao) {
		String email = "email1111@mail.com";
		if(dao.duplicateEmail(email)) {
			p("중복");
		}else {
			p("사용가능");
		}
		
	}

	private static void duplicateId(MemberDAO dao) {
		String id = "user111";
		
		if(dao.duplicateId(id)){
			p("중복");
		}else {
			p("사용가능");	
		}
	}

	private static void p(String string) {
		System.out.println(string);
	}

}
