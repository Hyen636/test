package parts;

public class PartsVo {
	String code;
	String codeName;
	String spec;
	int price;
	
	public PartsVo() {}
	
	public PartsVo(String code, String codeName, String spec, int price) {
		this.code = code;
		this.codeName = codeName;
		this.spec = spec;
		this.price = price;
	}
	
	//getter & setter
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
