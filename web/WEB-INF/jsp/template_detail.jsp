<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="indexDefinition">
    <tiles:putAttribute name="body">
  
        <div id="main-area">
            <div class="fullwidth_header_dark">
                <div class="container center">
                    <h1>${template.name}</h1>
                </div>
            </div>
            
            <div id="template_detail" class="container clearfix">
                <div id="gallery_wrap">                    
                    <c:choose>
                        <c:when test="${not empty thumbnail}">
                            <a href="<spring:url value="/${thumbnail.image_src}" htmlEscape="true" />" class="fancybox" rel="template">
                                <img src="<spring:url value="/${thumbnail.image_src}" htmlEscape="true" />" title="${thumbnail.image_alt}" height="480px" width="480px" />
                            </a>
                        </c:when>
                        <c:otherwise>
                            <img src="<spring:url value="/assets/img/dummy_image.jpg" htmlEscape="true" />" title="${template.name}" height="480px" width="480px" />
                        </c:otherwise>
                    </c:choose>
                    
                    <c:if test="${not empty images}">
                        <div id="gallery" class="clearfix">
                            <c:forEach var="image" items="${images}" varStatus="count">
                                <c:if test="${ !(image.id_image == thumbnail.id_image) }">
                                    <a href="<spring:url value="/${image.image_src}" htmlEscape="true" />" class="fancybox" rel="template" >
                                        <img src="<spring:url value="/${image.thumbnail_src}" htmlEscape="true" />" title="${image.image_alt}" height="100px" width="100px" />
                                    </a>
                                </c:if>
                            </c:forEach>
                        </div>
                    </c:if>
                    
                </div>
                
                <div id="template_content">
                    <p>${template.description}</p>
                    <div class="prices">
                        <span class="price_implement">${template.price_implement}</span>
                        <span class="price_editing">${template.price_editing}</span>
                    </div>
                    <div class="components">
                        <p>${allComponents}</p>
                    </div>
                </div>
            </div>
                     
        </div>

        
 
    </tiles:putAttribute>
</tiles:insertDefinition>