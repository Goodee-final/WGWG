<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<?xml version="1.0" encoding="UTF-8"?>
<reservations>
    <c:forEach var="rsv" items="${rsvList}">
        <reservation>
        	<c:if test="${rsv.res_dt != null}">
        		<res_dt>${rsv.res_dt}</res_dt>
        		<res_et>${rsv.res_et}</res_et>
        		<title>${rsv.res_title}</title>
        	</c:if>
        </reservation>
    </c:forEach>
</reservations>