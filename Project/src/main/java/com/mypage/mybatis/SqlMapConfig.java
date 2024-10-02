package com.mypage.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory factory;

	// 클래스 초기화 블록(클래스가 처음 로딩 될 때 한번만 수행
	static {
		
		try {
			String resouce ="com/kh/mybatis/config.xml";
			
			Reader reader = Resources.getResourceAsReader(resouce);
			factory = new SqlSessionFactoryBuilder().build(reader);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public static SqlSessionFactory getFactory(){
		return factory;
	}

	






}











