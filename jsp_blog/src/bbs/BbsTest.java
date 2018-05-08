package bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BbsTest {

	public static void main(String[] args) {
		BbsDAO dao = new BbsDAO();
		
		//total(dao);
		//list(dao);
		create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//upviewcnt(dao);
		//passCheck(dao);
 
	}                                  

	private static void total(BbsDAO dao) {
		Map map = new HashMap<>();
		map.put("col", "wname");
		map.put("word", "");
		
		int total = dao.total(map);
		
		p("레코드갯수:"+total);
		
	}

	private static void passCheck(BbsDAO dao) {
		
		Map map = new HashMap();
		map.put("bbsno", 3);
		map.put("passwd", "123");
		
		if(dao.passcheck(map )){
			p("올바른 비번입니다");
		}else{
			p("잘못된 비번입니다");
		}
		
	}

	private static void upviewcnt(BbsDAO dao) {
		BbsDTO dto = dao.read(3);
		p("조회수:"+dto.getViewcnt());
		p("조회수 증가합니다");
		dao.upViewcnt(3);
		dto = dao.read(3);
		p("변경된 조회수: " + dto.getViewcnt());
		
		
	}

	private static void delete(BbsDAO dao) {
		int bbsno = 2;
		if(dao.delete(2)){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = dao.read(3);
		dto.setWname("유희왕");
		dto.setTitle("제목변경");
		dto.setContent("내용변경");
		
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void read(BbsDAO dao) {
		int bbsno = 2;
		
		BbsDTO dto = dao.read(bbsno);
		
		p(dto);
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("아로마");
		dto.setTitle("게시판연습");
		dto.setContent("게시판의 디비처리 연습");
		dto.setPasswd("123");
			
		if(dao.create(dto)){
			p("성공");
		}else{
			p("실패");}
	}

	private static void list(BbsDAO dao) {
	Map map = new HashMap();
	map.put("col", "wname");
	map.put("word", "바");
	map.put("sno", 1);
	map.put("eno", 4);
	
	List<BbsDTO> list = dao.list(map);
	for(int i =0; i<list.size(); i++){
		BbsDTO dto = list.get(i);
		p(dto);
		p("------------------");
	}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(BbsDTO dto) {
		System.out.println("번호: "+dto.getBbsno());
		System.out.println("제목: "+dto.getTitle());
		System.out.println("내용: "+dto.getContent());
		System.out.println("등록날짜: "+dto.getWdate());
		System.out.println("조회수: "+dto.getViewcnt());
		System.out.println("password: "+dto.getPasswd());
		System.out.println("작성자: "+dto.getWname());
		p("grpno: "+dto.getGrpno());
		p("ansnum: "+dto.getAnsnum());
		p("indent: "+dto.getIndent());
		
	}

}
