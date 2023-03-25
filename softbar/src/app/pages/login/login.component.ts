import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Rol } from 'src/app/models/rol';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  

  loginData = {
    "identificacion" : '',
    "contrasena" : '',
   

  }

  constructor(private snack: MatSnackBar) { }

  ngOnInit(): void {
  }

  formSubmit(){
    if(this.loginData.identificacion == '' || this.loginData.identificacion == null){
      this.snack.open('La identificación es requerido','Aceptar',{
        duration : 5000,
        verticalPosition : 'top',
        horizontalPosition: 'right'
      });
      return;
    }
      if(this.loginData.contrasena == '' || this.loginData.contrasena == null){
        this.snack.open('La contraseña es requerida','Aceptar',{
          duration : 5000,
          verticalPosition : 'top',
          horizontalPosition: 'right'
        });
        return;
      }
    }
  }


