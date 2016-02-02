<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tiles:insertDefinition name="indexDefinition">
    <tiles:putAttribute name="body">
  
        <div id="main-area">
            <div id="template_detail_warp" class="container">
                <div id="template_detail" class="clearfix">
                    <div id="template_summary">
                        <h1>${template.name}</h1>
                        <div class="prices">
                            <p>Cena šablony: <span class="price_implement">${template.price_implement} ${money_sign}</span></p>
                            <p>Cena základní implementace: <span class="price_editing">${template.price_editing} ${money_sign}</span></p>
                        </div>
                        <div class="template_excerpt">${fn:substring(template.description, 0, 400)} </div>
                        <input type="hidden" name="template_info" value="${template.id_template}" />
                        <button type="submit" class="add_to_cart_button button">Objednat šablonu</button>
                    </div>
                
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
                                            <span class="helper"></span><img src="<spring:url value="/${image.thumbnail_src}" htmlEscape="true" />" title="${image.image_alt}" height="100px" width="100px" />
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </c:if>

                    </div>
                </div>
                
                <div id="template_content">
                    <h2 class="headin_main">Popis šablony</h2>
                    <p>${template.description}</p>
                </div>
            </div>
                     
        </div>

        
 
    </tiles:putAttribute>
</tiles:insertDefinition>