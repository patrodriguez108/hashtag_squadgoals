$(document).ready(function() {
 // setTimeout(function() {
    console.log($(".vision-animation"))
    $(".vision-animation").each(function(index, element){
      $(element).css({
        "z-index": -1 * index,
        "transform": "translateY(" + index * 100 + "%)"
      })
//    }, 1000)
  })
})