$(document).ready(function () {
  $( "#vision-goals" ).show();

  $('.tabs li' ).click(function(e){
    var selector = $(this).find("a").attr("href");
    var $tab = $(this)

    $("div.tab-content").hide();
    $(selector).show();

    $( ".tabs li").removeClass("active");
    $tab.addClass('active');
    });
});