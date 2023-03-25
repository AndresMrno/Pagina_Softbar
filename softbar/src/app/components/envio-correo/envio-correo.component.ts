import { DataSource } from '@angular/cdk/collections';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-envio-correo',
  templateUrl: './envio-correo.component.html',
  styleUrls: ['./envio-correo.component.scss']
})
export class EnvioCorreoComponent implements OnInit {

  constructor(private http: HttpClient) { }

  datos : FormGroup;

  ngOnInit(): void {

    this.datos = new FormGroup({
      subject : new FormControl('',Validators.required),
      text : new FormControl('',Validators.required)
    });
  }
  
  enviarCorreo(){
    let params ={
      subject:this.datos.value.subject,
      text:this.datos.value.text,

    }
      this.http.post('http://localhost:3000/mails/sendMasiveMails',params).subscribe(response=>{
        console.log(response);
      })
  }



}
