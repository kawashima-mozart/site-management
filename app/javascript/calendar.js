import { Calendar, render } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import googleCalendarPlugin from '@fullcalendar/google-calendar';

if(location.pathname.match("^/users/([0-9]+)$")){
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
          className: 'holiday'
        }
      ],

      headerToolbar: {
        left: 'prev,next today',
        center: "title",
        right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
      buttonText: {
        today: '今月',
        month: '月',
        week: '週',
        day: '日'
      },

      locale: 'ja',
      height: 'auto',
      firstDay: 0,
      navLinks: true,
      businessHours: true,
      editable: true,
      eventClick: function(info){
        info.jsEvent.preventDefault();
        content(info);
      }
    });

    calendar.render();
  });
}
  

