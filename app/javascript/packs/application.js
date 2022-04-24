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
require("jquery")

import { Calendar } from '@fullcalendar/core'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import "trix";
import "@rails/actiontext";


Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener('turbolinks:load', function() {

    ////////////// CALENDAR HANDLING /////////////////////
    var calendarEl = document.getElementById('calendar');
  
    var calendar = new Calendar(calendarEl, {
      
      plugins: [ dayGridPlugin, timeGridPlugin, listPlugin ],

      initialView: 'dayGridMonth',

      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,listWeek'
      },
  
      events: async function() {
        const response = await fetch("/events.json");
        const data = await response.json();
        let active_mem = document.getElementById("active_mem").innerHTML;
        console.log("Active members status:", active_mem);
        if (active_mem === true){
          console.log("Current data: ", data);
          return data;
        }
        else {
          let data_not_active = [];
          for(let i = 0; i < data.length; ++i){
            if (data[i].active_mem == false){
              data_not_active.push(data[i]);
            }
          }
          console.log("Current data: ", data_not_active);
          return data_not_active;
        }
        
      }
  
    });
  
    calendar.render();

});
require("trix")
require("@rails/actiontext")

window.addEventListener("trix-file-accept", function(event) {
  event.preventDefault()
})