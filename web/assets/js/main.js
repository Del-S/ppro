jQuery(document).ready(function( $ ) {   
    function header_data() {
        // Data main-header
        var header_height = $("#main-header").height();
        $("#main-header").attr("data-height-onload", header_height);
        $("#main-header").attr("data-height-loaded", "true");

        // Data logo
        $("<img>").attr("src", $("#logo").attr("src")).load(function(){
            var realWidth = this.width;
            var realHeight = this.height;
            $("#logo").attr("data-actual-width", realWidth);
            $("#logo").attr("data-actual-height", realHeight);
        });
        var percentage = Math.round( ($("#logo").height()/header_height)*100 );
        $("#logo").attr("data-height-percentage", percentage);

        // Data top-navigation
        var top_navigation_height = $("#top-navigation").height();
        $("#top-navigation").attr("data-height", top_navigation_height);
        $("#top-navigation").attr("data-fixed-height", top_navigation_height);

        $("#wrap").css("padding-top", header_height);
    }
    
    // Load header data
    header_data();
    
    // Scroll down call
    $(window).scroll(function() {
        // Slimmer menu
        if($(this).scrollTop() === 0) { $("#main-header").removeClass("fixed-header"); } 
        else { $("#main-header").addClass("fixed-header"); }
        // Show back up button
        if ($(this).scrollTop() > $('body').height() / 4) { $(".icon_scroll_top").addClass("scroll_top_show"); $(".icon_scroll_top").removeClass("scroll_top_hide"); }
        else { $(".icon_scroll_top").removeClass("scroll_top_show"); $(".icon_scroll_top").addClass("scroll_top_hide"); }
    });
    
    // Scroll to top on click to icon_scroll
    $('.icon_scroll_top').click(function() {
        $('html,body').animate({scrollTop: 0 }, 1000);
    });
    
    // Ico hide components
    $('.ico-arrow-up').on("click", function() {
        if($(this).parent().hasClass("collapsed")) {
            $(this).parent().removeClass("collapsed");
        } else {
            $(this).parent().addClass("collapsed");
        }
        
        var components = $(this).parents(".component_group").children(".components");
        if($(components).hasClass("hidden")) {
            $(components).removeClass("hidden");
            $(components).slideDown();
        } else {
            $(components).addClass("hidden");
            $(components).slideUp();
        }      
    });
    
    // Ajax loader
    function ajaxLoader (el, duration) {
	// Becomes this.options
	this.container 	= $(el);
	
	this.init = function() {
            var container = this.container;
            // Delete any other loaders
            this.remove(); 
            // Create the overlay 
            var overlay = $('<div></div>').addClass('ajax_overlay');
            // insert overlay and loader into DOM 
            container.append(
                overlay.append(
                    $('<div></div>').addClass('ajax_loader')
                ).fadeIn(duration)
            );
        };
	this.remove = function(){
            var overlay = this.container.children(".ajax_overlay");
            if (overlay.length) {
                overlay.fadeOut(false, function() {
                    overlay.remove();
                });
            }	
	}
        this.init();
    }   
    
    // Ajax to update templates
    $('.filter-row').children("input[type=checkbox], .comp_checkbox_span").on("click", function() {
        // Add class and check checkbox
        if($(this).parent().hasClass("checked")) {
            $(this).parent().removeClass("checked");
            if($(this).hasClass("comp_checkbox_span")) { $(this).siblings("input[type=checkbox]").prop('checked', false); }
        } else {
            $(this).parent().addClass("checked");
            if($(this).hasClass("comp_checkbox_span")) { $(this).siblings("input[type=checkbox]").prop('checked', true); }
        }
        
        // Show updating value
        var loader = new ajaxLoader($('#templates'), 500);
        
        // Send checked components to Ajax
        var components = [];
        $('.filter-row input[type=checkbox]').each(function() {
            if($(this).is(':checked')) { components.push($(this).val()); }
        });
        //var data_send = { components };
        
        // Ajax call and update
        $.ajax({
                url : "http://localhost:8080/ppro/update_template_display",
                type : "POST",
                traditional : true,
                contentType : "application/json",
                dataType : "json",
                data : JSON.stringify(components),
                headers: { 
                    'Accept': 'application/json', 
                    'Content-Type': 'application/json' 
                }
            }).done(function(templates) {
                var html = "";
                if($.trim(templates) == "") { html = '<p class="templates_empty">Žádné šablony neobsahují všechny vybrané komponenty</p>'; }
                $(templates).each(function( k, template ) {
                    var position = '';
                    if( k % 4 === 0) { position = "first";  html += '<div class="template_row clearfix">'; }
                    if( (k+1) % 4 === 0 ) { position = "last"; }
                    var img_link = "./assets/img/dummy_thumbnail.jpg";
                    if( !$.isEmptyObject(template.thumbnail) ) { img_link = template.thumbnail.thumbnail_src; }
                    
                    html += '<div class="template '+ position +'"> ' +
                        '<div class="image-wrap"> ' +
                            '<a href="./template_detail/'+ template.id_template +'/" class="image"> ' +
                                '<img src="'+ img_link +'" title="' + template.name + '" height="225px" width="225px" /> ' +
                            '</a> ' +
                        '</div> ' +
                        '<div class="template_description"> ' +
                            '<a href="./template_detail/'+ template.id_template +'/">' + template.name + '</a> ' +
                            '<p>'+ template.description.substring(0, 255) +'<p> ' +
                        '</div> ' +
                    '</div>';
                    if( (k+1) % 4 === 0 ) { html += '</div>'; }
                });
                
                $(".template_wrap").html(html);
            }).fail(function (response) {
                console.log('Error loading templates.' + response.responseText);
            });
            
        loader.remove();
    });	


    // Load fancybox
    $(".fancybox").fancybox();
});