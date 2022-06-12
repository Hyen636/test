package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import score.ScoreVo;

public class MybaTest {

	public static void main(String[] args) {
		//*****1) sqlsession 생성
		SqlSession session = MybaFactory.getFactory().openSession(); 
		
		//2) score 테이블의 데이터 건수
		int cnt = session.selectOne("test.tot_list","전산");
		System.out.println("cnt: " + cnt);
		
		//3) 전산 과목의 합계를 출력하시오.
		int sum = session.selectOne("test.sum_list","전산");
		System.out.println("tot:" + sum);
		
		//전산 과목의 성적중 id, score를 조회
		List<ScoreVo> list = session.selectList("test.list_comp","전산");
		for(ScoreVo v : list) {
			System.out.println(v.getId() + "-" + v.getScore());
		}
		
		//전산 시험을 본 학생의 id, mName, phone, email, score 조회
		List<ScoreVo> list2 = session.selectList("test.list_comp2","전산");
		for(ScoreVo v : list2) {
			System.out.println(v.getId() + "/" + v.getmName() + "/" +
							   v.getPhone() + "/" + v.getEmail() + "/" +
							   v.getScore());
		}
		
		//6) 임의의 성적을 추가하시오
		ScoreVo vo = new ScoreVo();
		vo.setNal("2022-05-24");
		vo.setId("a001");
		vo.setSubject("수학");
		vo.setScore(100);
		
		cnt = session.insert("test.score_input",vo);
		if(cnt>0) {
			System.out.println("저장OK:)");
			session.commit();
		}else {
			System.out.println("저장중 오류 발생:(");
			session.rollback();
		}
		
		//7) sno가 500번인 학생의 성적을 10점으로 수정(update)
		vo = new ScoreVo();
		vo.setSno(500);
		vo.setScore(10);
		cnt = session.update("test.score_update",vo);
		if(cnt>0) {
			System.out.println("수정OK:)");
			session.commit();
		}else {
			System.out.println("수정중 오류 발생:(");
			session.rollback();
		}
		
		//8) sno가 570번인 정보 삭제 (delete)
		cnt = session.delete("test.score_delete",570);
		if(cnt>0) {
			System.out.println("삭제OK:)");
			session.commit();
		}else {
			System.out.println("삭제중 오류 발생:(");
			session.rollback();
		}
	}

}
