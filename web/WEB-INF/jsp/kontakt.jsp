<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="indexDefinition">
    <tiles:putAttribute name="body">
  
        <div id="main-area">
            
            <div id="content" class="container clearfix">
                <h1>${h1}</h1>
                <div id="contact" class="left">
                    <p><strong>Ing. Jméno Příjmení</strong><br />
                        <strong>Tel.:</strong> 123 456 789<br />
                        <strong>E-mail:</strong> pick@template.cz<br />
                    </p>

                    <p><strong>Adresa:</strong><br />
                        North Pole<br />
                        AK 99705<br />
                    </p>
                </div>
                
                <div id="google_map" class="right">
                    <iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0"width="900" height="400" src="https://maps.google.com/maps?hl=en&q=North Pole&ie=UTF8&t=h&z=10&iwloc=B&output=embed">
                        <div><small><a href="http://embedgooglemaps.com">embed google map</a></small></div>
                        <div><small><a href="http://googlemapsgenerator.com/">Google maps generator</a></small></div>
                    </iframe>
                </div>
            </div>
                     
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>