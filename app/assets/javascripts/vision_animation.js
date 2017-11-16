$(document).ready(function() {
  setTimeout(function() {
    $(".vision-animation").each(function(index, element){
      $(element).css({
        "z-index": -1 * index,
        "transform": "translateY(" + i * 100 + "%)"
      })
    }, 1000)
  })
})