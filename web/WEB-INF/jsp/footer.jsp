<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
        <span class="icon_scroll_top scroll_top_hide"></span>       
        <div id="main-footer">
            <div id="footer-bottom">
                <div class="container clearfix">
                    <div id="footer-menu-nav" class="nav admin">
                        <ul id="footer-menu" class="nav">
                            <li class="menu-item"><a href="<spring:url value="/" htmlEscape="true" />">Domů</a></li>
                            <li class="menu-item"><a href="<spring:url value="/pick_template_eshop" htmlEscape="true" />">Šablony - Eshop</a></li>
                            <li class="menu-item"><a href="<spring:url value="/info" htmlEscape="true" />">Informace</a></li>
                            <li class="menu-item"><a href="<spring:url value="/kontakt" htmlEscape="true" />">Kontakt</a></li>
                        </ul>
                    </div> 
                    <p id="footer-info">
                        © 2016 Pick Template.<br />
                        web design: <a href="http://idefixx.cz/" alt="Webová dílna Idefixx" target="_blank">IdeFixx</a>, redakční systém vytvořili: <a href="http://idefixx.cz/kontakty" alt="Webová dílna Idefixx" target="_blank">David Sucharda</a> a Martin Kulhánek
                    </p>
                </div>	<!-- .container -->
            </div>
        </div>
        </div>
    </body>
</html>