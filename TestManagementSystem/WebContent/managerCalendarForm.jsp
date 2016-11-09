<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- fullCalendar 2.2.5-->
  <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.min.css">
  <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.print.css" media="print">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
<div class="wrapper">

	<jsp:include page="header/managerHeader.jsp" flush="true"></jsp:include>
	<jsp:include page="sidebar/managerSidebar.jsp" flush="true"></jsp:include>
	<jsp:include page="manager/managerCalendar.jsp" flush="true"></jsp:include>
	<jsp:include page="footer/footer.jsp" flush="true"></jsp:include>

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/fullcalendar/fullcalendar.js"></script>
<!-- Page specific script -->
<script>
  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex: 1070,
          revert: true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        });

      });
    }

    ini_events($('#external-events div.external-event'));

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date();
    var d = date.getDate(),
        m = date.getMonth(),
        y = date.getFullYear();
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      //Random default events
      events: [
               {
                   title: '1차 기능사 필기',
                   start: new Date(2015, 0, 25,9,30),
                   end: new Date(2015, 0, 25,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '2차 기능사 필기',
                   start: new Date(2015, 3, 4,9,30),
                   end: new Date(2015, 3, 4,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '4차 기능사 필기',
                   start: new Date(2015, 6, 19,9,30),
                   end: new Date(2015, 6, 19,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '5차 기능사 필기',
                   start: new Date(2015, 9, 10,9,30),
                   end: new Date(2015, 9, 10,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '1차 기능사 실기',
                   start: new Date(2015, 2, 20,9,30),
                   end: new Date(2015, 2, 20,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '2차 기능사 실기',
                   start: new Date(2015, 4, 29,9,30),
                   end: new Date(2015, 4, 29,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '3차 기능사 실기',
                   start: new Date(2015, 5, 19,9,30),
                   end: new Date(2015, 5, 19,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '4차 기능사 실기',
                   start: new Date(2015, 8, 11,9,30),
                   end: new Date(2015, 8, 11,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '5차 기능사 실기',
                   start: new Date(2015, 10, 27,9,30),
                   end: new Date(2015, 10, 27,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '1차 기능사 필기',
                   start: new Date(2016, 0, 24,9,30),
                   end: new Date(2016, 0, 24,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '2차 기능사 필기',
                   start: new Date(2016, 3, 2,9,30),
                   end: new Date(2016, 3, 2,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '4차 기능사 필기',
                   start: new Date(2016, 6, 10,9,30),
                   end: new Date(2016, 6, 10,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '5차 기능사 필기',
                   start: new Date(2016, 8, 4,9,30),
                   end: new Date(2016, 8, 4,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '1차 기능사 실기',
                   start: new Date(2016, 2, 13,9,30),
                   end: new Date(2016, 2, 13,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '2차 기능사 실기',
                   start: new Date(2016, 4, 22,9,30),
                   end: new Date(2016, 4, 22,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '3차 기능사 실기',
                   start: new Date(2016, 5, 12,9,30),
                   end: new Date(2016, 5, 12,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '4차 기능사 실기',
                   start: new Date(2016, 7, 28,9,30),
                   end: new Date(2016, 7, 28,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
                 {
                   title: '5차 기능사 실기',
                   start: new Date(2016, 10, 27,9,30),
                   end: new Date(2016, 10, 27,12,30),
                   backgroundColor: "#f56954", //red
                   borderColor: "#f56954" //red
                 },
        {
          title: '1차 기사 필기',
          start: new Date(2015, 2, 8, 9, 30),
          end: new Date(2015, 2, 8, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '2차 기사 필기',
          start: new Date(2015, 4, 31, 9, 30),
          end: new Date(2015, 4, 31, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '3차 기사 필기',
          start: new Date(2015, 7, 16, 9, 30),
          end: new Date(2015, 7, 16, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '4차 기사 필기',
          start: new Date(2015, 8, 19, 9, 30),
          end: new Date(2015, 8, 19, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '1차 기사 실기',
          start: new Date(2015, 3, 24, 9, 30),
          end: new Date(2015, 3, 24, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '2차 기사 실기',
          start: new Date(2015, 6, 17, 9, 30),
          end: new Date(2015, 6, 17, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '3차 기사 실기',
          start: new Date(2015, 9, 9, 9, 30),
          end: new Date(2015, 9, 9, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '4차 기사 실기',
          start: new Date(2015, 10, 12, 9, 30),
          end: new Date(2015, 10, 12, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '1차 기사 필기',
          start: new Date(2016, 2, 6, 9, 30),
          end: new Date(2016, 2, 6, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '2차 기사 필기',
          start: new Date(2016, 4, 8, 9, 30),
          end: new Date(2016, 4, 8, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '3차 기사 필기',
          start: new Date(2016, 7, 21, 9, 30),
          end: new Date(2016, 7, 21, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '4차 기사 필기',
          start: new Date(2016, 9, 1, 9, 30),
          end: new Date(2016, 9, 1, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '1차 기사 실기',
          start: new Date(2016, 3, 17, 9, 30),
          end: new Date(2016, 3, 17, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '2차 기사 실기',
          start: new Date(2016, 5, 26, 9, 30),
          end: new Date(2016, 5, 26, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '3차 기사 실기',
          start: new Date(2016, 9, 16, 9, 30),
          end: new Date(2016, 9, 16, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '4차 기사 실기',
          start: new Date(2016, 10, 12, 9, 30),
          end: new Date(2016, 10, 12, 16, 30),
          backgroundColor: "#f39c12", //yellow
          borderColor: "#f39c12" //yellow
        },
        {
          title: '기술사 105회 필기',
          start: new Date(2015, 1, 1, 9),
          end: new Date(2015, 1, 1, 17, 20),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 106회 필기',
          start: new Date(2015, 4, 10, 9),
          end: new Date(2015, 4, 10, 17, 20),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 107회 필기',
          start: new Date(2015, 7, 1, 9),
          end: new Date(2015, 7, 1, 17, 20),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 105회 면접',
          start: new Date(2015, 4, 1),
          end: new Date(2015, 4, 1),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 106회 면접',
          start: new Date(2015, 6, 31),
          end: new Date(2015, 6, 31),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 107회 면접',
          start: new Date(2015, 9, 23),
          end: new Date(2015, 9, 23),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 108회 필기',
          start: new Date(2016, 0, 31, 9),
          end: new Date(2016, 0, 31, 17, 20),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 109회 필기',
          start: new Date(2016, 4, 15, 9),
          end: new Date(2016, 4, 15, 17, 20),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 110회 필기',
          start: new Date(2016, 6, 30, 9),
          end: new Date(2016, 6, 30, 17, 20),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 108회 면접',
          start: new Date(2016, 3, 24),
          end: new Date(2016, 3, 24),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 109회 면접',
          start: new Date(2016, 7, 14),
          end: new Date(2016, 7, 14),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기술사 110회 면접',
          start: new Date(2016, 9, 23),
          end: new Date(2016, 9, 23),
          backgroundColor: "#00c0ef", //Info (aqua)
          borderColor: "#00c0ef" //Info (aqua)
        },
        {
          title: '기능장 57회 필기',
          start: new Date(2015, 3, 4, 11, 30),
          end: new Date(2015, 3, 4, 12, 30),
          backgroundColor: "#00ef70", //Info (aqua)
          borderColor: "#00ef70" //Info (aqua)
        },
        {
          title: '기능장 58회 필기',
          start: new Date(2015, 6, 19, 11, 30),
          end: new Date(2015, 6, 19, 12, 30),
          backgroundColor: "#00ef70", //Info (aqua)
          borderColor: "#00ef70" //Info (aqua)
        },
        {
          title: '기능장 57회 실기',
          start: new Date(2015, 5, 5, 11, 30),
          end: new Date(2015, 5, 5, 12, 30),
          backgroundColor: "#00ef70", //Info (aqua)
          borderColor: "#00ef70" //Info (aqua)
        },
        {
          title: '기능장 58회 실기',
          start: new Date(2015, 8, 18, 11, 30),
          end: new Date(2015, 8, 18, 12, 30),
          backgroundColor: "#00ef70", //Info (aqua)
          borderColor: "#00ef70" //Info (aqua)
        },
        {
          title: '기능장 59회 필기',
          start: new Date(2016, 3, 2, 11, 30),
          end: new Date(2016, 3, 2, 12, 30),
          backgroundColor: "#00ef70", //Info (aqua)
          borderColor: "#00ef70" //Info (aqua)
        },
        {
          title: '기능장 60회 필기',
          start: new Date(2016, 6, 10, 11, 30),
          end: new Date(2016, 6, 10, 12, 30),
          backgroundColor: "#00ef70", //Info (aqua)
          borderColor: "#00ef70" //Info (aqua)
        },
        {
          title: '기능장 59회 실기',
          start: new Date(2016, 5, 5, 11, 30),
          end: new Date(2016, 5, 5, 12, 30),
          backgroundColor: "#00ef70", //Info (aqua)
          borderColor: "#00ef70" //Info (aqua)
        },
        {
          title: '기능장 60회 실기',
          start: new Date(2016, 8, 11, 11, 30),
          end: new Date(2016, 8, 11, 12, 30),
          backgroundColor: "#00ef70", //Info (aqua)
          borderColor: "#00ef70" //Info (aqua)
        },
      ],
      editable: false,
      droppable: true, // this allows things to be dropped onto the calendar !!!
      drop: function (date, allDay) { // this function is called when something is dropped

        // retrieve the dropped element's stored Event Object
        var originalEventObject = $(this).data('eventObject');

        // we need to copy it, so that multiple events don't have a reference to the same object
        var copiedEventObject = $.extend({}, originalEventObject);

        // assign it the date that was reported
        copiedEventObject.start = date;
        copiedEventObject.allDay = allDay;
        copiedEventObject.backgroundColor = $(this).css("background-color");
        copiedEventObject.borderColor = $(this).css("border-color");

        // render the event on the calendar
        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

        // is the "remove after drop" checkbox checked?

      }
    });

    /* ADDING EVENTS */
    var currColor = "#3c8dbc"; //Red by default
    //Color chooser button
    var colorChooser = $("#color-chooser-btn");
    $("#color-chooser > li > a").click(function (e) {
      e.preventDefault();
      //Save color
      currColor = $(this).css("color");
      //Add color effect to button
      $('#add-new-event').css({"background-color": currColor, "border-color": currColor});
    });
    $("#add-new-event").click(function (e) {
      e.preventDefault();
      //Get value and make sure it is not null
      var val = $("#new-event").val();
      if (val.length == 0) {
        return;
      }

      //Create events
      var event = $("<div />");
      event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
      event.html(val);
      $('#external-events').prepend(event);

      //Add draggable funtionality
      ini_events(event);

      //Remove event from text input
      $("#new-event").val("");
    });
  });
</script>
</body>
