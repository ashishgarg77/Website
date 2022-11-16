// generate events
var eventDates = {}
let day1 = formatDate(new Date(new Date().setMonth(new Date().getDate())))
eventDates[day1] = [
  'Event 1, Location',
  'Event 2, Location 2'
]
let day2 = formatDate(new Date(new Date().setDate(new Date().getDate() + 17)))
eventDates[day2] = [
  'Event 2, Location 3',
]
let day3 = formatDate(new Date(new Date().setDate(new Date().getDate() + 40)))
eventDates[day3] = [
  'Event 4, Location 4',
]

let day4 = formatDate(new Date(new Date().setDate(new Date().getDate() + 3)))
eventDates[day4] = [
  'Event 5, Location 5',
]
let day5 = formatDate(new Date(new Date().setDate(new Date().getDate())))
eventDates[day5] = [
  'Event 6, Location 6',
]
console.log(day5);
// set maxDates
var maxDate = {
  1: new Date(new Date().setMonth(new Date().getMonth() + 11)),
  2: new Date(new Date().setMonth(new Date().getMonth() + 10)),
  3: new Date(new Date().setMonth(new Date().getMonth() + 9))
}

var flatpickr = $('#calendar .placeholder').flatpickr({
  function (date, str, inst) {
    var contents = '';
    if (date.length) {
      for (i = 0; i < eventDates[str].length; i++) {
        contents += '<div class="event"><div class="date">' + flatpickr.formatDate(date[0], 'l J F') + '</div><div class="location">' + eventDates[str][i] + '</div></div>';
      }
    }
  },
  inline: true,
  minDate: 'today',
  maxDate: maxDate[3],
  showMonths: 1,
  enable: Object.keys(eventDates),
  disableMobile: "true",
  onChange: function (date, str, inst) {
    //console.log('ready')
    var contents = '';
    if (date.length) {
      for (i = 0; i < eventDates[str].length; i++) {
        contents += '<div class="event"><div class="date">' + flatpickr.formatDate(date[0], 'l J F') + '</div><div class="location">' + eventDates[str][i] + '</div></div>';
      }
    }
    $('#calendar .calendar-events').html(contents)
  },
  locale: {
    weekdays: {
      shorthand: ["S", "M", "T", "W", "T", "F", "S"],
      longhand: [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
      ]
    }
  }
})


console.log()



eventCaledarResize($(window));
$(window).on('resize', function () {
  eventCaledarResize($(this))
})

function eventCaledarResize($el) {
  var width = $el.width()
  if (flatpickr.selectedDates.length) {
    flatpickr.clear()
  }
  if (width >= 992 && flatpickr.config.showMonths !== 3) {
    flatpickr.set('showMonths', 1)
    flatpickr.set('maxDate', maxDate[3])
  }
  if (width < 992 && width >= 768 && flatpickr.config.showMonths !== 2) {
    flatpickr.set('showMonths', 1)
    flatpickr.set('maxDate', maxDate[2])
  }
  if (width < 768 && flatpickr.config.showMonths !== 1) {
    flatpickr.set('showMonths', 1)
    flatpickr.set('maxDate', maxDate[1])
    $('.flatpickr-calendar').css('width', '')
  }
}

function formatDate(date) {
  let d = date.getDate();
  let m = date.getMonth() + 1; //Month from 0 to 11
  let y = date.getFullYear();
  return '' + y + '-' + (m <= 9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d);
}