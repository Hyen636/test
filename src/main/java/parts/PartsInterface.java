package parts;

import java.util.List;
import bean.Page;
import parts.PartsVo;

public interface PartsInterface {
	// (     )   = 추상메서드 => {}가 없음 => 개념만 있는 메서드 => 반드시 재정의해야함! 
	public String insert(PartsVo vo);
	public List<PartsVo> select(Page page);
	public PartsVo selectOne(String code);
	public String update(PartsVo vo);
	public String delete(String code);
}
