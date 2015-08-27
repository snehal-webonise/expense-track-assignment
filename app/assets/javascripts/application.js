// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID

    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div><input type="text" name="email[]" tabindex="1"  placeholder="Email Address" class="form-control autocomplete ui-autocomplete-input" autocomplete="off"/><a href="#" class="remove_field">Remove</a></div>'); //add input box
        }
    });

    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })

    var arr = []
    $.ajax({
            type: 'GET',
            url: '/users/get_registered_users',
            data: { },
            dataType: 'json',
            complete: function(data) {
              console.log("data "+JSON.stringify(data["responseJSON"]["users"]))
               arr = data["responseJSON"]["users"]
            }
        });

    console.log("arr "+arr);
    // $(".autocomplete").each(function(){
    //    $(this).autocomplete({
    //       source: arr
    //     });
    //  })

     $( "#email" )
        // don't navigate away from the field on tab when selecting an item
        .bind( "keydown", function( event ) {
        if ( event.keyCode === $.ui.keyCode.TAB &&
        $( this ).autocomplete( "instance" ).menu.active ) {
        event.preventDefault();
        }
        })
        .autocomplete({
        minLength: 0,
        source: function( request, response ) {
        // delegate back to autocomplete, but extract the last term
        response( $.ui.autocomplete.filter(
        arr, extractLast( request.term ) ) );
        },
        focus: function() {
        // prevent value inserted on focus
        return false;
        },
        select: function( event, ui ) {
        var terms = split( this.value );
        // remove the current input
        terms.pop();
        // add the selected item
        terms.push( ui.item.value );
        // add placeholder to get the comma-and-space at the end
        terms.push( "" );
        this.value = terms.join( ", " );
        return false;
        }
        });
});



function split( val ) {
return val.split( /,\s*/ );
}
function extractLast( term ) {
return split( term ).pop();
}
