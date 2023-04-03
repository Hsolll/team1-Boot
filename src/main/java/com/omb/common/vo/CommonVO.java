package com.omb.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class CommonVO {

			private String search = "";		// 검색 유형 ex) 전체, 제목, 작성자
			private String keyword = "";	// 검색어
			
			private int pageNum = 0;	// 페이지 번호
			private int amount = 0;		// 페이지에 보여줄 데이터 수
			
			// 날짜 검색 시 사용할 필드(시작일, 종료일)
			private String start_date = "";
			private String end_date = "";
			
			
			public CommonVO() {
				this(1, 10);
			}
			
			public CommonVO(int pageNum, int amount) {
				this.pageNum = pageNum;
				this.amount = amount;
			}
}
