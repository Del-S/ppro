<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="indexDefinition">
    <tiles:putAttribute name="body">
  
        <div id="main-area">
            <div class="fullwidth_header_dark">
                <div class="container center">
                    <h1>${h1}</h1>
                </div>
            </div>
            
            <div id="content" class="container clearfix">

            </div>
                     
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>