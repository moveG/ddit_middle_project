<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="kr.or.ddit.cmm.service.AtchFileServiceImpl"%>
<%@page import="kr.or.ddit.cmm.service.IAtchFileService"%>
<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.reser.vo.StayVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   List<StayVO> list = (List<StayVO>) request.getAttribute("stayList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="../js/jquery-3.6.0.min.js"></script>
      <script src="../js/jquery.serializejson.min.js"></script>
      
      <title>숙소</title>
      <style>
         #stayList{
            float : left;
            height : 100%;
            width : 47%;
            margin : 10px;
            margin-left : 20px;
            border : 1px solid black;
         }
         .sList{
            border : 1px solid black;
            margin : 10px;
            height : auto;
         }
         .sImage, .sInfo{
            display : inline-block;
            border : 1px solid black;
            margin : 10px;
            padding : 10px;
         }
         .sImage{
            width : 20%;
         }
         .sInfo{
            display : inline-block;
            width : 65%;
         }
         #map{
            display: inline-block;
                float: right;
             margin-top: 10px;
             margin-right: 20px;
         }
      </style>
      <script>
         let mapArr = [];
      </script>
   </head>
   <body>
      <div id="stayList">
<%
   int staySize = list.size();
   if(staySize > 0){
      for(int i = 0; i < staySize; i++){
%>
         <div class="sList" onclick="location.href='StayDetail.do?stay_id=<%= list.get(i).getStay_id() %>&atch_file_id=<%= list.get(i).getAtch_file_id() %>'">
            <div class="sImage">
               <p>숙소사진</p>
               <p>숙소사진</p>
               <p>숙소사진</p>
               <p>숙소사진</p>
            </div>
            <div class="sInfo">
               <p>숙소명 : <%= list.get(i).getStay_name() %></p>
               <p>숙소정보 : <%= list.get(i).getStay_info() %></p>
               <p>한계인원 : <%= list.get(i).getStay_pnum() %></p>
               <p>가격 : <%= list.get(i).getStay_pnum() %></p>
               <p>주소 : <%= list.get(i).getStay_add() %></p>
            </div>
         </div>
       
         <script>
         mapArr.push({"add" : "<%= list.get(i).getStay_add() %>", "name" : "<%= list.get(i).getStay_name() %>"});
         console.log(mapArr);
         </script>
<%         
      }
   }else{
%>
         <div class="sList">
            숙소정보가 없습니다.
         </div>
<%
   }
%>
      </div>

   <div id="map" style="width: 48%; height: 900px;">
      <script type="text/javascript"
         src="//dapi.kakao.com/v2/maps/sdk.js?appkey=553e55e7a953a05a2adfe2bfc2932452&libraries=services"></script>
      <script>
         var mapContainer = document.getElementById('map'); // 지도를 표시할 div
         
         var mapOption = {
            center : new kakao.maps.LatLng(36.35056, 127.38481), // 지도의 중심좌표
            level : 8
         // 지도의 확대 레벨
         };

         // 지도를 생성합니다    
         var map = new kakao.maps.Map(mapContainer, mapOption);
         
         
         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new kakao.maps.services.Geocoder();
         
         $.each(mapArr, function(idx, obj){
            addToMarker(obj);
         })
         
         function addToMarker(obj) {
            // 주소로 좌표를 검색합니다
            geocoder.addressSearch(obj.add, function(result, status) {
               // 정상적으로 검색이 완료됐으면 
               if (status === kakao.maps.services.Status.OK) {

                  var coords = new kakao.maps.LatLng(
                        result[0].y, result[0].x);

                  // 결과값으로 받은 위치를 마커로 표시합니다
                  var marker = new kakao.maps.Marker({
                     map : map,
                     position : coords
                  });

                  // 인포윈도우로 장소에 대한 설명을 표시합니다
                  var infowindow = new kakao.maps.InfoWindow(
                        {
                           content : '<div style="width:150px;text-align:center;padding:6px 0;">'+obj.name+'</div>'
                        });
                  infowindow.open(map, marker);

                  // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                  map.setCenter(coords);
               }
            });
         }
         
      </script>
   </div>

</body>
</html>