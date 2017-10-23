var calendar = $('#calendar');
calendar.fullCalendar({
  header: {
    right:  'agendaWeek,month,today prev,next'
  },
  selectable: true,
  selectHelper: true,
  editable: true,
  eventLimit: true,
  events: '/events.json?unidade=1',

 select: function(start, end) {
        $.getScript('/events/new', function() {
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
$(document).on('turbolinks:load')