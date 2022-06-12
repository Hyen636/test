package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import score.ScoreVo;

public class DynamicTest {
	
	//if
	public void ifTest() {
		SqlSession session = MybaFactory.getFactory().openSession(); //세션작업
		
		int s = 90;
		List<ScoreVo> list = session.selectList("dynamic.select_90",null);
		System.out.println("size : " + list.size());
	}
	
	
	//choose
	public void choose() {
		//파라메터가 "총점"이면 성적의 전체 합계를,
		//"평균"이면 평균값을, "최대값" 성정의 최대값을 반환
		SqlSession session = MybaFactory.getFactory().openSession();
		String param = "총점";
		double v = session.selectOne("dynamic.choose",param);
		System.out.println(param + " : " + v);
	}
	
	//forEach
	public void forEach1() {
		//학번을 1개 이상 전달하여 학번에 해당하는 성적들을 반환
		List<Integer> sno = new ArrayList<Integer>();
		sno.add(499);
		sno.add(500);
		sno.add(567);
		sno.add(568);
		SqlSession session = MybaFactory.getFactory().openSession();
		//한개이상은 List로 받아야함
		List<ScoreVo> list = session.selectList("dynamic.foreach1",sno);
		
		for(ScoreVo v : list) {
			System.out.println(v.getSno() + " - " + v.getScore());
		}
	}
	
	public void forEach2() {
		//key:value가 각각 sno:score 형태의 값을 전달받아 
		//sno에 해당하는 학생의 성적을 수정
		SqlSession session = MybaFactory.getFactory().openSession();
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("sno",500);
		map.put("score",50);
		
		int cnt = session.update("dynamic.score_update",map);
		if(cnt>0) {
			session.commit();
			System.out.println("수정OK:)");
		}else {
			session.rollback();
			System.out.println("수정중 오류발생:(");
		}
	}
	
	
	
	public static void main(String[] args) {
		
		DynamicTest d = new DynamicTest();
		//d.ifTest();
		//d.choose();
		//d.forEach1();
		d.forEach2();
	}

}
