import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

if(location.pathname.match("^/users/([0-9]+)$")){
  document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    timeZone: 'Asia/Tokyo',
    locale: 'ja',
    businessHours: true,
    headerToolbar: {
      left: false,
      center: "title",
      },
    buttonText: {
      toda: '今月',
    },
  });
  

  calendar.render();
});
}
