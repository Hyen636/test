package student;

import java.util.List;

public interface StudentInterface {
	public boolean insert (StudentVo vo);
	public List<StudentVo> select(String findStr, int nowPage);
	public StudentVo selectOne (String id);
	public boolean update(StudentVo vo);
	public boolean delete(String id, String pwd);
}
