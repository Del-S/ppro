jQuery(document).ready(function( $ ) {
    $("#gallery input[type=checkbox]").click(function() {
        var value = $(this).val();
        var option = '<option value="'+ value +'">'+ $(this).siblings("label").html() +'</option>';
        if($(this).is(":checked")) { $("#id_thumbnail_gallery").append(option) }
        else { 
            $("#id_thumbnail_gallery").children("option").each(function() {
                if( $(this).val() === value ) { $(this).remove(); }
            }); 
        }
    
    });
});

