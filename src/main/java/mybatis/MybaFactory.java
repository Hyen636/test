package mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybaFactory {
	private static SqlSessionFactory factory;
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}  	//static = 1. 객체 생성 X, 접근 가능 / 2. 초기화 1회(공통요소) 
	
	static {
		try {
			Reader r = Resources.getResourceAsReader("mybatis/config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
			
			if(factory == null ) System.out.println("fail......");
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		 MybaFactory.getFactory();

	}

}

