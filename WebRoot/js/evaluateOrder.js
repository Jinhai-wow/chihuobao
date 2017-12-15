
$( function() {
    $( "#slider" ).slider({
        range: "min",
        value: 20,
        min: 1,
        max: 120,
        slide: function( event, ui ) {
            // 分钟 unicode \u5206\u949f
            $( "#amount" ).val(+ ui.value+"\u5206\u949f" );
        }
    });

    $( "#amount" ).val( $( "#slider" ).slider( "value" )+"分钟"  );
});