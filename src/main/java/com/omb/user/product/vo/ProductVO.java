package com.omb.user.product.vo;

import org.springframework.web.multipart.MultipartFile;

import com.omb.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProductVO extends CommonVO{
	private int p_no            =0;            
    private int u_no	        =0;
    private String u_nick		="";
    private String p_title		="";         
    private String p_name		="";            
    private String p_price		="";           
    private String p_status		="";          
    private String p_img		="";             
    private String p_content	="";         
    private String p_local		="";           
    private String trans_method	="";      
    private int prod_like 		= 0;
    private String p_created_at;    
    private String p_updated_at;    
    private String p_deleted_at; 
    private String p_cate		="";
    private int p_adm_per		=0;
    private int p_free			=0;
    
    private MultipartFile file;
    private String p_thumb		="";  
    private String p_file		="";  
    
}
