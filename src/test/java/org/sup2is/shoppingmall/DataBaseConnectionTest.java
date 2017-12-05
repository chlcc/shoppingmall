package org.sup2is.shoppingmall;


import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.spi.LoggerFactoryBinder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DataBaseConnectionTest {
   
	private Logger logger = LoggerFactory.getLogger(DataBaseConnectionTest.class);
	
   @Inject
   private DataSource dataSoutce;
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   
   @Autowired
   private SqlSessionFactory sqlSessionFactory;

   @Test
   public void testConnection() throws Exception {

       try (Connection con = dataSoutce.getConnection()) {

           System.out.println("\n >>>>>>>>>> Connection 출력 : " + con + "\n");

       } catch (Exception e) {
           e.printStackTrace();
       }
   }
   
   @Test
   public void testFactory(){
       System.out.println("\n >>>>>>>>>> sqlFactory 출력 : "+sqlSessionFactory);
   }
   
   @Test
   public void testSession() throws Exception{
       
       try(SqlSession session = sqlSessionFactory.openSession()){
           
           System.out.println(" >>>>>>>>>> session 출력 : "+session+"\n");
           
       } catch (Exception e) {
           e.printStackTrace();
       }
   }
   
   
   @Test
   public void testMybatis() throws Exception {
	   logger.info("sqlSessionTemplate :  {}" , sqlSessionTemplate );
   }
   
}
