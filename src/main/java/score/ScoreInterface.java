package score;

import java.util.List;

import bean.Page;

public interface ScoreInterface {
	public String insert (ScoreVo vo);
	public String update (ScoreVo vo);
	public String delete (int sno);
	public ScoreVo selectOne (int sno);
	public List<ScoreVo> select (Page p);
	public Page getPage(); //dao 가 연산한 Page를 servlet이 가져갈 수 있도록 
}
