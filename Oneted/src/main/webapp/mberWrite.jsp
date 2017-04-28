<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
   <!DOCTYPE html>
   <html>
   <!-- 헤드 파일 부분 -->

   <head>
      <%@ include file="/WEB-INF/include/include-header.jspf" %>
         <style type="text/css">
.input {
   -webkit-user-modify: read-write
}
         </style>
   </head>

   <body class="w3-white">
      <!-- nav 바 부분 -->

      <jsp:include page="/WEB-INF/include/navBar.jspf" flush="true" />
      <br><br><br>
      <div class="container w3-row w3-padding">
         <div class="container w3-col12 w3-light-gray w3-padding w3-margin">
            <!-- 첫번째 줄 -->
            <div class="w3-row">
               <div class="w3-card-4">
                  <div class="panel-heading overflow-h w3-black">
                     <h2 class="panel-title pull-left" style="color:#fff; f"><i class="glyphicon glyphicon-user"></i> 프로필</h2>
                     <a href="#"><i class="fa fa-cog fa-spin pull-right" style="color:#fff;"></i></a>
                  </div>

                  <div class="w3-container w3-white">

                     <img alt="face" src=<c:url value="/WEB-INF/resources/images/mber/${map.IMG }"/> align="left" class="w3-image w3-circle" width="100px" height="auto">
                     <div class="w3-container w3-left input">
                        <br>
                        <h1>${map.NAME }</h1>
                        <br>
                        <ul>
                           <li><label>직업 :</label></li>
                           <li><label>주 업무 :</label></li>
                           <li><label>보유기술 :</label></li>
                           <li><label>의뢰내역 :</label></li>
                           <li><label>희망지역 :</label></li>
                        </ul>
                        <br>
                     </div>
                  </div>
               </div>
            </div>
            <br><br>
            <!-- 두번째 줄 -->
            <div class="w3-display-container w3-row">
               <div class="w3-col m3 w3-card-4 w3-display-topleft">

                  <header class="w3-cell-row w3-black">
                     <div class="w3-cell w3-padding">
                        <h3>인적사항</h3>
                     </div>
                     <div class="w3-cell-right w3-padding">
                        <a href="#"> <i class="fa fa-cog fa-spin w3-right" style="font-size: 24px; color: white;"></i></a>
                     </div>
                  </header>

                  <div class="w3-container w3-white">
                     <div class="w3-container">

                     </div>
                  </div>
               </div>

               <div class="w3-col m5 w3-card-4 w3-display-topmiddle">

                  <header class="w3-cell-row w3-black">
                     <div class="w3-cell w3-padding">
                        <h3>skill</h3>
                     </div>
                     <div class="w3-cell-right w3-padding">
                        <a href="#"> <i class="fa fa-cog fa-spin w3-right" style="font-size: 24px; color: white;"></i></a>
                     </div>
                  </header>

                  <div class="w3-container w3-white">
                     <div class="w3-container">
                        <br>
                        <!-- 프로그레스 바 width에 입력값 -->

                        <div class="progress progress-u progress-xxs">
                           <div style="width: 66%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="92" role="progressbar" class="progress-bar progress-bar-u"></div>
                        </div>

                        <br>
                     </div>
                  </div>
               </div>

               <div class="w3-col m3 w3-card-4 w3-display-topright">

                  <header class="w3-cell-row w3-black">
                     <div class="w3-cell w3-padding">
                        <h3>자격증</h3>
                     </div>
                     <div class="w3-cell-right w3-padding">
                        <a href="#"> <i class="fa fa-cog fa-spin w3-right" style="font-size: 24px; color: white;"></i></a>
                     </div>
                  </header>

                  <div class="w3-container w3-white">
                     <div class="w3-container w3-left">
                        <br>
                        <h1>그여자</h1>
                        <br>
                        <ul>
                           <li><label>직업 :</label> 배우</li>
                           <li><label>주 업무 :</label> 연기</li>
                           <li><label>보유기술 :</label> 얼굴</li>
                           <li><label>의뢰내역 :</label> 없음</li>
                           <li><label>희망지역 :</label> 서울</li>
                        </ul>
                        <br>
                     </div>
                  </div>
               </div>

               <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
               <!-- 세번째 줄 -->

               <div class="w3-card-4 w3-diplay-middle">

                  <header class="w3-cell-row w3-black">
                     <div class="w3-cell w3-padding">
                        <h3>자기소개</h3>
                     </div>
                     <div class="w3-cell-right w3-padding">
                        <a href="#"> <i class="fa fa-cog fa-spin w3-right" style="font-size: 24px; color: white;"></i></a>
                     </div>
                  </header>

                  <div class="w3-container w3-white">
                     <div class="w3-container">
                        <br>
                        <p>
                           <!-- 이부분에 자기소개 관련 디비 -->
                           자기소개 ${map.INTRODUCE }
                        </p>
                        <br>
                     </div>
                  </div>
               </div>
               <br><br>
               <div class="w3-card-4 w3-diplay-bottom">

                  <header class="w3-cell-row w3-black">
                     <div class="w3-cell w3-padding">
                        <h3>키워드</h3>
                     </div>
                     <div class="w3-cell-right w3-padding">
                        <a href="#"> <i class="fa fa-cog fa-spin w3-right" style="font-size: 24px; color: white;"></i></a>
                     </div>
                  </header>
                  <div class="w3-container w3-white">
                     <div class="w3-container">
                        <br>
                        <p>
                           <!-- 이부분에 키워드 관련 디비 -->
                           java,jsp,javascript
                        </p>
                        <br>
                     </div>
                  </div>
               </div>
            </div>
            <br><br>
            <!-- 5번째 줄 -->
            <div class="w3-row">
               <div class="w3-card-4">
                  <header class="w3-cell-row w3-black">
                     <div class="w3-cell w3-padding">
                        <h3>연락처</h3>
                     </div>
                     <div class="w3-cell-right w3-padding">
                        <a href="#"> <i class="fa fa-cog fa-spin w3-right" style="font-size: 24px; color: white;"></i></a>
                     </div>
                  </header>

                  <div class="w3-container w3-white">
                     <div class="w3-container w3-left">
                        <br> ${map.PHONE }
                        <br><br><br><br><br>
                     </div>
                  </div>
               </div>
            </div>

         </div>

         <a href="#this" class="w3-btn w3-right w3-white w3-text-black" id="list">List</a>

         <%@ include file="/WEB-INF/include/include-body.jspf" %>
            <script type="text/javascript">
$(document).ready(function() {
   $("#list").on("click", function(e) { //목록으로 버튼
      e.preventDefault();
      fn_openMberList();
   });

});

function fn_openMberList() {
   var comSubmit = new ComSubmit();
   comSubmit.setUrl("<c:url value='/mber/mberList.do' />");
   comSubmit.submit();
}
            </script>

      </div>
      <br><br>
      <jsp:include page="/WEB-INF/include/footer.jspf" flush="true" />

   </body>

   </html>