# Pick Template (PPRO project for University of Hradec Králové)
App for template choosing.

This web application should enable quick and easy selection of web templates. There will be two ways to pick a template.

First way is the classic eshop way where you can pick what components of web you want and it will show you exactly right templates for your selection.

The second way is to show similar templates with variety in functionality. This part is based on voting for templates. When you vote for a template it will show you similar templates and if you vote again (for some other template) it will connect these two by your votes. So next time you vote (for the first template) it will show you the template that you voted for in the second round and some other ones.

Most voted templates will be displayed first in both approaches.

In the first case it's possible to get 0 results for your component selection. But that should not be the case in the second approach.

Current progress:
- Administration is complete.
- Eshop style frontend
- Images on front-end and fancybox

Current issues:
- Fix UTF-8 encoding
- User login + security
- Core functions by voting

# Dependencies

Main dependencies:
- Spring Framwork 4.0.1
- JSTL 1.2.2
- Hibernate 4.3.x
- Apache Tiles 3.0.5
- Commons Fileupload 1.3
- Commons IO 1.1
- FasterXML Jackson (annotations, core, databind)

Optional Dependencies:
- Commons-beanutils 1.8
- Commons-digester 2.0
- Aopalliance 1.0
- Log4j 1.2.17

# Server
GlassFish

Tomcat solution requires revision of dependencies (not priotity for now).