<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../include/admin_header.jsp" />

	   <hr width="65%" color="gray">	
	      <h3>SHOP_PRODUCTS 테이블 제품 수정 폼 페이지</h3>
	   <hr width="65%" color="gray">
	   <br> <br>
	   
	   <form method="post" enctype="multipart/form-data"
          action="<%=request.getContextPath() %>/admin_product_modify_ok.go">
       
          <c:set var="dto" value="${ProductCont }" />
          
          <input type="hidden" name="p_num" value="${dto.getPnum() }">
          
          <table border="1" width="450">
             <c:set var="clist" value="${CategoryList }" />
             
             <tr>
                <th>상품명</th>
                <td> <input name="p_name" readonly
                             value="${dto.getPname() }"> </td>
             </tr>
             
             <tr>
                <th>카테고리 Code</th>
                <td> <input name="p_category" readonly
                			 value="${dto.getPcategory_fk() }"> </td>
             </tr>
             
             <tr>
                <th>상품 제조사</th>
                <td> <input name="p_company" readonly
                             value="${dto.getPcompany() }"> </td>
             </tr>
             
             <tr>
                <th>상품 이미지</th>
                <td> 
                   <img src="<%=request.getContextPath() %>/upload/${dto.getPimage() }"
                			width="100" height="80">
                   <input type="file" name="p_image_new">
                   
                   <%-- 이미지를 수정하지 않고 그대로 제품수정(submit) 버튼을 누르면
                        상품 등록 시 입력했던 상품의 이미지를 그대로 사용하여 넘겨줄 예정. --%>
                   <input type="hidden" name="p_image_old"
                   				value="${dto.getPimage() }">
             </tr>
             
             <tr>
                <th>상품 수량</th>
                <td>
                   <input type="number" name="p_qty"
                   			min="1" max="99" value="${dto.getPqty() }">
                </td>
             </tr>
             
             <tr>
                <th>상품 가격</th>
                <td> <input name="p_price" value="${dto.getPrice() }"> </td>
             </tr>
             
             <tr>
                <th>상품 사양</th>
                <td>
                   <select name="p_spec">
                      <option value="none"
                         <c:if test="${dto.getPspec() == 'none' }">selected </c:if> >일반</option>
                      <option value="hit"
                         <c:if test="${dto.getPspec() == 'hit' }">selected </c:if> >인기</option>
                      <option value="new"
                         <c:if test="${dto.getPspec() == 'new' }">selected </c:if> >신상</option>
                      <option value="recommand"
                         <c:if test="${dto.getPspec() == 'recommand' }">selected </c:if> >추천</option>                   
                   </select>
                </td>
             </tr>
             
             <tr>
                <th>상품 소개</th>
                <td>
                   <textarea rows="7" cols="25" name="p_content">${dto.getPcontents() }</textarea>
                </td>
             </tr>
             
             <tr>
                <th>상품 포인트</th>
                <td> <input name="p_point" value="${dto.getPoint() }"> </td>
             </tr>
             
             <tr>
                <td colspan="2" align="center">
                   <input type="submit" value="상품수정">&nbsp;&nbsp;&nbsp;
                   <input type="reset" value="다시작성">
                </td>
             </tr>
          </table>
       </form>	
	
	
	<jsp:include page="../include/admin_footer.jsp" />

</body>
</html>







