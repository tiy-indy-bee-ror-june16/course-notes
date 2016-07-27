$(document).ready(function(){

  function totalPages(num) {
    return Math.ceil(num / 10)
  }

  function paginationLinks(pages, current_page){
    console.log(current_page)
    if($('nav').length === 0){
      $('#stuff').prepend(
        "<nav aria-label=\"Page navigation\"><ul class=\"pagination\"></ul></nav>"
      )
    }
    $('.pagination').html("")
    for(i=0;i<pages;i++){
      console.log(i)
      if((i + 1) == current_page){
        $('.pagination').append("<li class=\"active\"><a href=\"" + (i + 1) + "\">" + (i + 1) + "</a></li>")
      } else {
        $('.pagination').append("<li><a href=\"" + (i + 1) + "\">" + (i + 1) + "</a></li>")
      }
    }
  }

  function fetchPage(num) {
    $.getJSON('http://swapi.co/api/people/', 'page=' + num, function(data){
      paginationLinks(totalPages(data.count), num)
      displayData(data.results)
    })
  }

  function fetchPerson(url){
    $.getJSON(url, function(data){
      $("#myModal .modal-title").text(data.name)
      $("#myModal .modal-body").html("<p>Has " + data.eye_color + " eyes, " + data.hair_color + " hair, and " + data.skin_color + " skin</p>")
    })
  }

  function displayData(arr) {
    $('#stuff h1').remove()
    $.each(arr, function(i, rhre){
      $('#stuff').append("<h1><a href=\"" + rhre.url + "\" data-remote=\"false\" data-toggle=\"modal\" data-target=\"#myModal\">" + rhre.name + "</a></h1>")
    })
  }

  fetchPage(1)

  $(document.body).on('click', '.pagination li a', function(ev){
    ev.preventDefault()
    console.log(ev)
    fetchPage($(ev.target).attr('href'))
  })

  $(document.body).on('show.bs.modal', function(ev){
    console.log(ev)
    fetchPerson(ev.relatedTarget.href)
  })

})
