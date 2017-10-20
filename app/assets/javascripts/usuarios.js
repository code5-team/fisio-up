$('#calendar').fullCalendar({
  header: {
    right:  'agendaWeek,month,today prev,next'
  },
    selectable: true,
    selectHelper: true,
    editable: true,
    eventLimit: true,
    events: '/events.json',
    
     select: function(start, end) {
        $.getScript('/events/new');
        
      calendar.fullCalendar('unselect');
      }
});
