$(function(){
  $('.js-room-search').on('keyup', function(){
    var name = $.trim($(this).val());

    $.ajax({
      type: 'GET',
      url: '/user/rooms/suggest',
      data: {name: name},
      dataType: 'json'
    })
    .done(function(data) {
      $('.js-rooms li').remove();
      $(data).each(function (i, room) {
        $('.js-rooms').append(
        `<li><a href="/user/rooms/${room.id}">${room.name}</a></li>`
        );
      });
    })
  });
});