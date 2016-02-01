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
                <p>Tento nástroj má pomoci při výběru webové šablony. Využívat ho může kdokoliv od webdesignérů po zákazníky.</p>
                
                <div clas="section">
                    <h2>Jak funguje?</h2>
                    <p>První možností jak vybrat šablonu je klasický <strong>eshop přístup</strong>. Vyberete jaké komponenty v šabloně chcete a takovou šablonu dostanete.
                       Samozřejmě u této metody se může stát, že nedostanete žádný výsledek.
                    </p>

                    <p>Druhá možnost je vybírání šablon podle <strong>podobnosti a předchozím hodnocení</strong>. Po výběru komponent, které chcete můžete ohodnotit šablonu, která se Vám líbí. 
                        Následně se zobrazí ty šablony, které mají nejlepší hodnocení a jsou podobné. 
                    </p>
                </div>
                
                <div clas="section">
                    <h2>Proč používat?</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi convallis facilisis consectetur. Integer nisi purus, consequat a placerat quis, fermentum in justo. 
                        Nullam ipsum mauris, facilisis at tellus fringilla, eleifend accumsan nunc. Mauris elementum pharetra ex, a semper libero mattis nec. 
                        Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
                        Quisque quis sapien ac erat pharetra maximus. Nam eu urna risus. Proin elementum lectus enim, et pellentesque eros finibus mollis. Nam nec egestas nibh. 
                        Morbi sagittis volutpat ultrices. Nullam at imperdiet augue. Cras sagittis at magna non mollis. Vestibulum tincidunt leo a lectus rhoncus bibendum a et neque. 
                        Nulla auctor, enim vitae bibendum malesuada, ante augue pulvinar nisi, tempus molestie elit tortor quis quam. Morbi luctus, felis vitae facilisis rutrum, nulla 
                        nulla egestas nisi, eu tincidunt diam ligula sed elit. Nulla accumsan a elit eget euismod.
                    </p>

                    <h2>Lorem ipsum rules !!!!!</h2>
                    <p>Cras eu nisl non purus molestie volutpat. Aliquam vel elementum erat. Curabitur vitae nunc in odio hendrerit tristique et sed lorem. Duis ac nunc porta, 
                        porttitor purus in, convallis leo. Etiam imperdiet lobortis risus. Integer ultricies lorem et mauris faucibus, at venenatis elit rutrum. Maecenas quis 
                        elit imperdiet, blandit felis eu, facilisis nisl. Quisque vel metus egestas, ullamcorper dui id, vehicula ligula. Maecenas malesuada rutrum luctus. 
                        Aenean elementum non leo sit amet volutpat.
                    </p>
                </div>
            </div>
                     
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>