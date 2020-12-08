import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import googleCalendarPlugin from '@fullcalendar/google-calendar';

if(location.pathname.match("^/users$")){
  document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar');

    var calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin, interactionPlugin, googleCalendarPlugin ],
      dayCellContent: function(e) {
        e.dayNumberText = e.dayNumberText.replace('日', '');
      },
      googleCalendarApiKey: process.env.GOOGLE_CALENDAR_API_KEY,
      eventSources: [
        {
          googleCalendarId: 'ja.japanese#holiday@group.v.calendar.google.com',
          display:'background', 
          backgroundColor: 'lightgrey',
          overlap:true,
          className: 'holiday'
        },
        { url: '/users.json',
          textColor: 'black',
          backgroundColor: 'lightblue',
          editable: true,
          resourceEditable: true,
          navLinks: true,
          selectable: true,
          editable:  true
        }
      ],

      headerToolbar: {
        left: 'prev,next today',
        center: "title",
        right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
      buttonText: {
        today: '今日',
        month: '月',
        week: '週',
        day: '日'
      },

      locale: 'ja',
      height: 'auto',
      firstDay: 0,
      navLinks: true,
      selectable: true,
      businessHours: true,
      eventClick: function(info){
        info.jsEvent.preventDefault();
        window.location.href = `/events/${info.event.id}/edit`
      },
    });

    calendar.render();
  });
}

