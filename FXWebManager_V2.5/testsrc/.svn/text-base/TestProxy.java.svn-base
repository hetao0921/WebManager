import java.lang.reflect.Field;


public class TestProxy {
	
	
	public String id;
	public String name;
	public String password;
	
	

	
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




	public static void main(String[] args) throws Exception {
		Class c = TestProxy.class;
	    Object obj  = c.newInstance();            //创建Student类的对象
	    Field f = c.getDeclaredField("name");        //获取name属性
	    f.setAccessible(true);                    //设置私有可以访问.
	    f.set(obj, "zhangsan");
	    System.out.println(f.get(obj)); 
	}
}
