$('#calendar').fullCalendar({
  header: {
    right:  'agendaDay,agendaWeek,today prev,next'
  },
  events: [
    {
      title: 'Event1',
      start: '2017-09-21',
      editable: true
    },
    {
      title: 'Event2',
      start: '2017-09-22',
      editable: true,
      color: 'yellow',
      textColor: 'black'
    }
  ]
});
