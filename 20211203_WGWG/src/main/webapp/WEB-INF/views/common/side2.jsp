<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!-- Sidebar -->
	<!--  w3-light-grey -->
	<div class="w3-sidebar w3-bar-block"
		style="width: 180px; background-color: white; border-right: 2px solid #073865; border-left: 2px solid #073865; margin-left: 150px;">
		<ul>
			<li class="w3-bar-item nav1"><i class="fas fa-file-signature"></i><a href="#">전자결재</a>
				<ul class="nav-flyout">
					<li class="li-btn"><button class="w3-btn w3-blue w3-round btn">기안하기</button></li>
					<li><a href="./signlist.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전자서명 관리</a></li>
					<li><a href="./signinsert.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전자서명 등록</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전자서명만들기</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결재 진행함</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결재 대기함</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결재 완료함</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참조문서함</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인문서함</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;임시문서함</a></li>
				</ul></li>
				
			<li class="w3-bar-item nav1"><i class="fas fa-business-time"></i><a href="#">근태관리</a>
				<ul class="nav-flyout">
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;근태관리</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;근태관리</a></li>
				</ul></li>
				
			<li class="w3-bar-item nav1"><i class="fas fa-thumbtack"></i> <a href="#">공지사항</a>
				<ul class="nav-flyout">
					<li><a href="./noticeList.do" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항</a></li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar"></i> <a href="#">일정관리</a>
				<ul class="nav-flyout">
					<li><a href="./loadForm.do" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일정관리</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일정관리</a></li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar-check"></i><a href="#">예약관리</a>
				<ul class="nav-flyout">
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약관리</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약관리</a></li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-file"></i><a href="#">업무일지</a>
				<ul class="nav-flyout">
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업무일지</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업무일지</a></li>
				</ul></li>
				
			<li class="w3-bar-item nav1"><i class="fas fa-sms"></i><a href="#">채팅</a>
				<ul class="nav-flyout">
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;채팅</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;채팅</a></li>
				</ul>
			</li>
			<li class="w3-bar-item nav1"><i class="fas fa-sms"></i><a href="#">양식함</a>
				<ul class="nav-flyout">
					<li><a href="./formlist.do" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;양식목록</a></li>
					<li><a href="./forminsert.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;양식등록</a></li>
				</ul>
			</li>
		</ul>
	</div>