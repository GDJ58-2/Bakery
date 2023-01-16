package controller.admin.goods;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import service.GoodsCategoryService;
import service.GoodsService;
import vo.Goods;
import vo.GoodsCategory;
import vo.GoodsImg;

@WebServlet("/admin/goods/modifyGoods")
public class ModifyGoodsController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		/*
		HttpSession session = request.getSession();
		
		HashMap<String, Object> loginMember = (HashMap<String, Object>)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/emp/loginEmp");
			return;
		}
		*/
		
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		int goodsCode = 0;
		// 방어코드
		if(request.getParameter("goodsCode") != null){
			goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
			System.out.println("goodsCode : " + goodsCode);
		} 
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		GoodsService goodsService = new GoodsService();
		
		map = goodsService.getGoodsOne(goodsCode);
		
		request.setAttribute("map", map);
		
		// 상품 카테고리 출력 -> select 태그
		GoodsCategoryService goodsCategoryService = new GoodsCategoryService();
		ArrayList<GoodsCategory> list = goodsCategoryService.getGoodsCategoryList();
		request.setAttribute("list", list);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin/goods/modifyGoods.jsp");
		
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 후에만 진입가능
		/*
		HttpSession session = request.getSession();
		
		HashMap<String, Object> loginMember = (HashMap<String, Object>)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/emp/loginEmp");
			return;
		}
		*/
		
		// 프로젝트안 upload폴더의 실제 물리적 위치를 반환
		String dir = request.getServletContext().getRealPath("/upload");
		int maxFileSize = 1024 * 1024 * 100; // 100Mbyte
		
		// 업로드 폴더내 동일한 이름이 있으면 뒤에 숫자를 추가
		DefaultFileRenamePolicy fp = new DefaultFileRenamePolicy();
		MultipartRequest mreq = new MultipartRequest(request, dir, maxFileSize, "UTF-8", fp);
		
		int goodsCode = Integer.parseInt(mreq.getParameter("goodsCode"));
		int categoryNo = Integer.parseInt(mreq.getParameter("categoryNo"));
		String goodsName = mreq.getParameter("goodsName");
		int goodsPrice = Integer.parseInt(mreq.getParameter("goodsPrice"));
		String goodsContent = mreq.getParameter("goodsContent");
		int goodsStock = Integer.parseInt(mreq.getParameter("goodsStock"));
		String empId = mreq.getParameter("empId");
		int  hit = Integer.parseInt(mreq.getParameter("hit"));
		
		// 방어 코드
		String contentType = null;
		String originalFileName = null;
		String fileSystemName = null;			
		if(mreq.getContentType("goodsImg") != null) {
			// input type=file 바이너리 파일은 마임타입형태의 파일로 변환되어 upload폴더의 자동으로 저장
			contentType = mreq.getContentType("goodsImg");
			originalFileName = mreq.getOriginalFileName("goodsImg"); // 원본 파일 이름
			fileSystemName = mreq.getFilesystemName("goodsImg"); // 저장된 파일 이름
		}
		
		// 이미지 파일 검사
		if(contentType.equals("image/jpeg") || contentType.equals("image/png")) {
			Goods goods = new Goods();
			GoodsImg goodsImg = new GoodsImg();
			
			goods.setGoodsCode(goodsCode);
			goods.setCategoryNo(categoryNo);
			goods.setGoodsName(goodsName);
			goods.setGoodsPrice(goodsPrice);
			goods.setGoodsContent(goodsContent);
			goods.setGoodsStock(goodsStock);
			goods.setEmpId(empId);
			goods.setHit(hit);
			
			goodsImg.setGoodsCode(goodsCode);
			goodsImg.setFileName(fileSystemName);
			goodsImg.setOriginName(originalFileName);
			goodsImg.setContentType(contentType);
			
			// 디버깅 코드
			System.out.println("문자열 매개값 : ");
			System.out.println("상품 코드 : " + goodsName);
			System.out.println("상품 종류 : " + categoryNo);
			System.out.println("상품 이름 : " + goodsName);
			System.out.println("상품 가격 : " + goodsPrice);
			System.out.println("상품 내용 : " + goodsContent);
			System.out.println("상품 재고 : " + goodsStock);
			System.out.println("직원 아이디 : " + empId);
			System.out.println("히트 : " + hit);
			
			System.out.println("파일 매개값 : ");
			System.out.println("파일이름 : " + fileSystemName);
			System.out.println("원본 파일 이름 : " + originalFileName);
			System.out.println("파일 컨텐츠 타입 : " + contentType);
			
			GoodsService goodsService = new GoodsService();
			int row = goodsService.modifyGoods(goods, goodsImg, dir);
			if(row == 1) {
				System.out.println("수정성공");
		    	
		    	String msg = null;
		    	msg = URLEncoder.encode("게시글을 수정하였습니다.", "utf-8");
				
				// View
				response.sendRedirect(request.getContextPath()+"/goods/goodsOne?goodsCode="+goodsCode+"&msg="+msg);
			} else {
				System.out.println("수정실패");
		    	
		    	String msg = null;
		    	msg = URLEncoder.encode("게시글 수정에 실패하였습니다.", "utf-8");
		    	
		    	// View
				response.sendRedirect(request.getContextPath()+"/admin/goods/modifyGoods?goodsCode="+goodsCode+"&msg="+msg);
			}
			
		} else {
			System.out.println("*.jpg, *.png파일만 업로드 가능");
			String msg = null;
	    	msg = URLEncoder.encode("jpg, png파일만 업로드 가능합니다.", "utf-8");
			File f = new File(dir+"\\"+mreq.getFilesystemName("itemImg"));
			if(f.exists()) {
				f.delete(); // 이미지가 아닌 파일이 업로드 되었기때문에 삭제
			}
			// View
			response.sendRedirect(request.getContextPath()+"/admin/goods/modifyGoods?goodsCode="+goodsCode+"&msg="+msg);
		}
	}
}
