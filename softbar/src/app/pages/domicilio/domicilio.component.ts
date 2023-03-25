import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'app-domicilio',
  templateUrl: './domicilio.component.html',
  styleUrls: ['./domicilio.component.scss']
})
export class DomicilioComponent implements OnInit {

  @ViewChild ('divMap') divMap!: ElementRef;
  @ViewChild ('inputPlaces') inputPlaces!: ElementRef;


  constructor() { }

  ngOnInit(): void {
  }

}
