package com.confer;
 
import java.util.*;
import java.io.*;
import javax.xml.bind.*;
 
public class TestJAXB implements Serializable {
 public static void main(String[] args) throws Exception {
  Users users = new Users();
  User user = new User("colagarychen@gmail.com", "pohao", "abcd1234");
  user.addPoll("c0001");
  user.addPoll("c0002");
  users.addUser(user);
  users.addUser(new User("kuramu1108@gmail.com", "kuramu", "abccd1234"));
  
  // Boilerplate code to convert objects to XML...
  JAXBContext jc = JAXBContext.newInstance(Users.class);
  Marshaller m = jc.createMarshaller();
  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
  m.marshal(users, System.out);
  
  
 }
}