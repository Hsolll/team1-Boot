package com.omb.user.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.common.file.FileUploadUtil;
import com.omb.user.product.dao.ProductDao;
import com.omb.user.product.vo.ProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ProductService")
public class ProductServiceImpl implements ProductService {

	@Setter(onMethod_ = @Autowired)
	private ProductDao productDao;

	@Override
	public List<ProductVO> selectProductList(ProductVO pvo) {

		List<ProductVO> productList = productDao.selectProductList(pvo);

		return productList;
	}

	@Override
	public ProductVO selectProductDetail(int p_no) {

		ProductVO list = productDao.selectProductDetail(p_no);
		return list;
	}

	@Override
	public int insertProduct(ProductVO pvo) throws Exception {
		int result = 0;

		if (pvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(pvo.getFile(), "product");// board_1658205347977_
			pvo.setP_file(fileName);

			log.info("파일 이름: " + pvo.getP_file());

			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			pvo.setP_thumb(thumbName);

			log.info("썸네일 이름: " + pvo.getP_thumb());
		}

		result = productDao.insertProduct(pvo);
		return result;
	}

	@Override
	public int insertProductLike(ProductVO pvo) {
		int result = productDao.insertProductLike(pvo);
		return result;
	}

	@Override
	public int deleteProductLike(ProductVO pvo) {
		int result = productDao.deleteProductLike(pvo);
		return result;
	}

	@Override
	public List<ProductVO> category(ProductVO pvo) {

		List<ProductVO> cList = productDao.category(pvo);
		return cList;
	}

	@Override
	public int productListCnt(ProductVO pvo) {
		return productDao.productListCnt(pvo);
	}

	@Override
	public int productCateListCnt(ProductVO pvo) {
		return productDao.productCateListCnt(pvo);
	}

	@Override
	public List<ProductVO> selectLocal(ProductVO pvo) {
		List<ProductVO> list = productDao.selectLocal(pvo);
		return list;
	}

	@Override
	public int productLcoalListCnt(ProductVO pvo) {
		return productDao.productLocalListCnt(pvo);
	}

	@Override
	public List<ProductVO> myWrite(ProductVO pvo) {
		List<ProductVO> wvo = productDao.myWrite(pvo);
		return wvo;
	}

	@Override
	public int WriteListCnt(ProductVO pvo) {
		return productDao.WriteListCnt(pvo);

	}

	@Override
	public ProductVO updateForm(int u_no, int p_no) {
		ProductVO list = productDao.updateForm(u_no, p_no);
		return list;
	}

	@Override
	public int update(ProductVO pvo) throws Exception {

		if (pvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(pvo.getFile(), "product");// board_1658205347977_
			pvo.setP_file(fileName);

			log.info("파일 이름: " + pvo.getP_file());

			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			pvo.setP_thumb(thumbName);

			log.info("썸네일 이름: " + pvo.getP_thumb());
		}
		int result = productDao.update(pvo);
		return result;
	}

	@Override
	public int delete(ProductVO pvo) throws Exception {
		int result = 0;
		log.info("pvo :" + pvo);
		log.info("getP_file :" + pvo.getP_file());
		ProductVO ppvo = productDao.sel(pvo);

		log.info("getP_file :" + ppvo.getP_file());
		if (!ppvo.getP_file().isEmpty()) { // b_file 필드의 값이 null 거나 "" 아니면(이미지 파일이 존재하면)
			FileUploadUtil.fileDelete(ppvo.getP_file());
			FileUploadUtil.fileDelete(ppvo.getP_thumb());
		}
		result = productDao.delete(pvo);
		return result;
	}

	@Override
	public List<ProductVO> selectProductLikeList(MemberVO mvo) {
		List<ProductVO> productLikeList = productDao.selectProductLikeList(mvo);

		return productLikeList;
	}

	@Override
	public List<ProductVO> selectProductLike(MemberVO vo) {
		List<ProductVO> list = null;
		list = productDao.selectProductLike(vo);
		return list;

	}

	
	/****************************************************************************/
	/* 민석 작업 */
	@Override
	public void productStatus(ProductVO pvo) {
		productDao.productStatus(pvo);

	}

	@Override
	public List<ProductVO> selectProductBuyList(ProductVO pvo) {
		List<ProductVO> productBuyList = null;
		productBuyList = productDao.selectProductBuyList(pvo);

		return productBuyList;
	}

	@Override
	public List<ProductVO> selectProductSellList(ProductVO pvo) {
		List<ProductVO> productSellList = null;
		productSellList = productDao.selectProductSellList(pvo);

		return productSellList;
	}

	@Override
	public List<ProductVO> selectProductMyPageLikeList(ProductVO pvo) {
		List<ProductVO> productMyPageLikeList = null;
		productMyPageLikeList = productDao.selectProductMyPageLikeList(pvo);
		return productMyPageLikeList;
	}

	@Override
	public int productMyPageListCnt(ProductVO pvo) {
		return productDao.productMyPageListCnt(pvo);
	}

	@Override
	public int productMyPageLikeListCnt(ProductVO pvo) {

		return productDao.productMyPageLikeListCnt(pvo);
	}

	@Override
	public int productMyPageBuyListCnt(ProductVO pvo) {

		return productDao.productMyPageBuyListCnt(pvo);

	}

	@Override
	public List<ProductVO> selectProductMyPageList(ProductVO pvo) {
		List<ProductVO> productMyPageList = null;
		productMyPageList = productDao.selectProductMyPageList(pvo);

		return productMyPageList;
	}

	@Override
	public int productMyPageSellSoldOut(ProductVO pvo) {
		return productDao.productMyPageSellSoldOut(pvo);
	}

	@Override
	public int productMyPageSellSale(ProductVO pvo) {
		return productDao.productMyPageSellSale(pvo);
	}

	/* 나눔상품 리스트 조회 */
	@Override
	public List<ProductVO> selectShareProductList(ProductVO pvo) {

		List<ProductVO> list = productDao.selectShareProductList(pvo);
		
		return list;
	}

	@Override
	public int ShareProductListCnt() {

		int count = productDao.ShareProductListCnt();

		return 0;
	}

	
	
}
