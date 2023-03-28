package com.omb.common2.vo;

import lombok.Data;
//import lombok.Getter;
//import lombok.Setter;
//import lombok.ToString;

//import lombok.Data;

//@ToString
//@Setter
//@Getter
@Data
public class CommonVO2 {
	private int pageNum = 0;     //현재 화면에서 보고있는 페이지
	private int amount = 0;      //페이지에 보여줄 데이터 수
	
	//조건검색시 사용할 필드(검색대상, 검색단어)
	private String search = "";
	private String keyword = "";
	
	//날짜검색시 사용할 필드(시작일, 종료일)
	private String start_date = "";
	private String end_date = "";
	
	public CommonVO2() {
		this(1, 10);
	}
	
	public CommonVO2(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}