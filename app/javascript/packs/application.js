// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require popper
//= require turbolinks
//= require bootstrap
//= require_tree.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require("@popperjs/core")
import "bootstrap"
require("../stylesheets/application")

import { Calendar } from '@fullcalendar/core'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener('turbolinks:load', function() {
    var calendarEl = document.getElementById('calendar');
  
    var calendar = new Calendar(calendarEl, {
      
      plugins: [ dayGridPlugin, timeGridPlugin, listPlugin ],

      initialView: 'dayGridMonth',

      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,listWeek'
      },
  
      events: "/events.json",
  
    });
  
    calendar.render();
    
});

$("#modal-window").find(".modal-content").html("<%= j (render 'new') %>");
$("#modal-window").modal();