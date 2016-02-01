<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tiles:insertDefinition name="indexDefinition">
    <tiles:putAttribute name="body">
        
        <div id="main-area">
            <div class="fullwidth_header_dark">
                <div class="container center">
                    <h1>${h1}</h1>
                </div>
            </div>
            <div class="main-content">
                <div class="container clearfix">
                    
                    <div id="sidebar">
                        <h2>Filtry</h2>
                        <c:forEach var="componentGroup" items="${componentGroups}">
                            <div class="component_group">
                                <h3 class="component_group_heading">
                                    <span class="title">${componentGroup.name}</span>
                                    <i class="ico-arrow-up right"></i>
                                </h3>
                                <c:if test="${not empty componentGroup.components}">
                                    <ul class="components">
                                </c:if>
                                <c:forEach var="component" items="${componentGroup.components}">
                                    <li class="filter-row">
                                        <input type="checkbox" name="comp_checkbox" value="${component.id_component}" />
                                        <a class="comp_checkbox_span">${component.name}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${not empty componentGroup.components}">
                                    </ul>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div id="templates">
                        <h2>Šablony</h2>
                        <div class="template_wrap">
                        <c:forEach var="template" items="${templates}" varStatus="count">
                            <c:if test="${((count.index mod 4) == 0)}">
                                <div class="template_row clearfix">
                            </c:if>
                            
                            <div class="template ${ ((count.index mod 4) == 0) ? "first" : ""} ${(((count.index+1) mod 4) == 0) ? "last" : ""}">
                                <div class="image-wrap">
                                    <a href="<spring:url value="/template_detail/${template.id_template}/" htmlEscape="true" />" class="image">
                                        <c:set var="thumbnail_src" value="assets/img/dummy_thumbnail.jpg" />
                                        <c:if test="${not empty template.thumbnail}">
                                            <c:set var="thumbnail_src" value="${template.thumbnail.thumbnail_src}" />
                                        </c:if>
                                        <img src="<spring:url value="/${thumbnail_src}" htmlEscape="true" />" title="${template.name}" height="225px" width="225px" />        
                                    </a>
                                </div>
                                <div class="template_description">
                                    <a href="<spring:url value="/template_detail/${template.id_template}/" htmlEscape="true" />">${template.name}</a>
                                    <p>${fn:substring(template.description, 0, 255)}<p>
                                </div>
                            </div> 
                            
                            <c:if test="${(((count.index+1) mod 4) == 0)}">
                                </div>
                            </c:if>
                        </c:forEach>
                        </div>
                    </div>
                    
                </div>
            </div>  
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>