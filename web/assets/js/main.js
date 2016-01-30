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
        
        // Send checked components to Ajax
        var components = [];
        $('.filter-row input[type=checkbox]').each(function() {
            if($(this).is(':checked')) { components.push($(this).val()); }
        });
        var data_send = {"components": components };
        
        // Ajax call and update
        $.ajax({
            type: "POST",
            url: "update_template_display",
            data: JSON.stringify(data_send),
            dataType: 'json',
            headers: { 
                'Accept': 'application/json', 
                'Content-Type': 'application/json' 
            },
            success: function(data){
                 console.log('success');
            }
        });
    });
});