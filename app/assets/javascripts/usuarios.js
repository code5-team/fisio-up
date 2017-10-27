var calendar = $('#calendar');
calendar.fullCalendar({
  header: {
    right:  'agendaWeek,month,today prev,next'
  },
  displayEventTime : false,
  selectable: true,
  selectHelper: true,
  editable: true,
  events: '/events.json?unidade=1',
  
 select: function(start, end) {
      if (moment(start).format('YYYY-MM-DD') < moment(Date.now()).format('YYYY-MM-DD')){
        alert('Não pode criar um evento no passado!');
        return;
      }
        $.getScript('/events/new?start=' + moment(start).format('YYYY-MM-DD HH:mm:ss') , function() {
          $('#event_date_range').val(moment(start).format("DD/MM/YYYY HH:mm") + ' - ' + moment(end).format("DD/MM/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
        });

        calendar.fullCalendar('unselect');
      },
      
      
  eventClick: function(event, jsEvent, view) {
    $.getScript(event.edit_url, function() {
     $('#event_date_range').val(moment(event.start).format("DD/MM/YYYY HH:mm") + ' - ' + moment(event.end).format("DD/MM/YYYY HH:mm"))
      date_range_picker();
      $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
      $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
      });
      }
});

$('.side-bar ul li').each(function() {
  $(this).on('click', function() {
    url = '/events.json?unidade=' + $(this).data('filter');
    $.ajax({
      url: url,
      success: function(events) {
        calendar.fullCalendar('removeEvents');
        calendar.fullCalendar('addEventSource', events);
        calendar.fullCalendar('rerenderEvents' );
      }
    });
    $('.side-bar ul li').removeClass('active');
    $(this).addClass('active');
  });
});

$(document).on('turbolinks:load');