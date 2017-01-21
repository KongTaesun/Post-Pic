package kr.co.bit.postkit.VO;

public class LoginVO {

	private String id;
	private String name;
	private String password;
	private String type;	// "S" : 包府磊 / "U" : 老馆蜡历
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", name=" + name + ", password=" + password + ", type=" + type + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public LoginVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
