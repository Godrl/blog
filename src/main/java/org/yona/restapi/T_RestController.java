package org.yona.restapi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class T_RestController {

	@RequestMapping("/hello")
	public String hello() {
		
		return "Hello world";
	}
	
	@RequestMapping("/sendVO")
	public RestapiVO sendVO() {
		
		RestapiVO rvo = new RestapiVO();
		
		rvo.setMno(1);
		rvo.setFirstName("hyunki");
		rvo.setLastName("kim");
		
		return rvo;
	}
	
	@RequestMapping("/sendList")
	public List<RestapiVO> sendList(){
		
		List<RestapiVO> list = new ArrayList<>();
		
		for (int i = 0; i < 10; i++) {
			RestapiVO rvo = new RestapiVO();
			rvo.setMno(i);
			rvo.setFirstName("hyunki");
			rvo.setLastName("kim");
			list.add(rvo);
			
		}
		return list;
	}
	
	@RequestMapping("/sendMap")
	public Map<Integer, RestapiVO> sendMap(){
		
		Map<Integer, RestapiVO> map = new HashMap<>();
		
		for (int i = 0; i < 10; i++) {
			RestapiVO rvo = new RestapiVO();
			rvo.setMno(i);
			rvo.setFirstName("hyunki");
			rvo.setLastName("kim");
			
			map.put(i, rvo);
			
		}
		
		return map;
	}
	
	@RequestMapping("/BadRequest")
	public ResponseEntity<Void> sendErrorAuth(){
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	@RequestMapping("/NotFound")
	public ResponseEntity<List<RestapiVO>> sendErrorNot(){
		
		List<RestapiVO> list = new ArrayList<>();
		
		for(int i = 0; i < 10; i++) {
			RestapiVO rvo = new RestapiVO();
			rvo.setMno(i);
			rvo.setFirstName("hynuki");
			rvo.setLastName("kim");
			
			list.add(rvo);
		}
		return new ResponseEntity<>(list,HttpStatus.NOT_FOUND);
	}
	
}
