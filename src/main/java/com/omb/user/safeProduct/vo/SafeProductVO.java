package com.omb.user.safeProduct.vo;

import com.omb.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class SafeProductVO extends CommonVO {


	private int sp_no;			// 안심상품 번호
	private int u_no;			// 회원번호
	private int p_no;			// 중고상품 번호
	private String sp_name;		// 안심상품 이름
	private String sp_title;	// 안심상품 제목
	private int sp_price;		// 안심상품 가격
	private String sp_content;	// 안심상품 내용
	private String sp_pwd;		// 안심상품 비밀번호
	private String sp_status;	// 안심상품 상태
	private String sp_created_at;	// 안심상품 등록일
	private String sp_updated_at;	// 안심상품 수정일
	private String sp_deleted_at;	// 안심상품 삭제일
	
	// 조회 시 필요한 컬럼 필드 생성 (추후 공통 클래스에 필드 정의 후 사용)

	private String u_id;		// 회원 아이디
	private String u_name;		// 회원 이름
	private String p_name;		// 상품 이름


}
