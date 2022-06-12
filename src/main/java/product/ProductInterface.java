package product;

import java.util.List;

import bean.Page;
import parts.PartsVo;
import product.ProductVo;

public interface ProductInterface {
	public String insert(ProductVo vo);
	public List<ProductVo> select(Page page);
	public ProductVo selectOne(int sno);
	public String update(ProductVo vo);
	public String delete(int sno);
	public List<PartsVo> findCode(String code);
}
