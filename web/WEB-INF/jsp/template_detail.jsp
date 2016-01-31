<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <div id="gallery">
                    <img src="#img_link" title="${template.name}" height="480px" width="480px" />
                    <img src="#img_link" title="${template.name}" height="70px" width="70px" />
                    <img src="#img_link" title="${template.name}" height="70px" width="70px" />
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