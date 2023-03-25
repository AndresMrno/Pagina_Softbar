import { Component, OnInit, ViewChild } from '@angular/core';
import { FullCalendarComponent, FullCalendarModule } from '@fullcalendar/angular';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import esLocale from '@fullcalendar/core/locales/es';

@Component({
  selector: 'app-reserva',
  templateUrl: './reserva.component.html',
  styleUrls: ['./reserva.component.scss']
})


export class ReservaComponent implements OnInit {

  @ViewChild('calendar') calendarComponent: FullCalendarComponent


public events: any[];
public options: any;



  constructor() { }
 

  ngOnInit(): void {

    this.options = {
      plugins : [dayGridPlugin, timeGridPlugin, interactionPlugin  ],
      defaultDate: new Date(),
      locale: esLocale,
      header:{
        left: 'prev,next',
        center:'title',
        right: 'dayGridMonth,timeGridweek, timeGridDay'
      },
      editable: false,
    }

    this.events = [{
      title: "Reserva 1",
      start: new Date(),
      description: "Reserva 1"
    },
    {
      title: "Reserva 2",
      start: new Date().getTime() + 86400000,
      description: "Reserva 3"
    },

    {
      title: "Reserva 3",
      start: new Date().getTime() + 86400000 *2,
      end: new Date().getTime() + 86400000 *3,
      description: "Reserva 3"
    },

  
  
  ]
    
  }

   

}
