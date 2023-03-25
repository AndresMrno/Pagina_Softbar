import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Rol } from 'src/app/models/rol';
import { Usuario } from 'src/app/models/usuario';
import { UsuariosService } from 'src/app/services/usuarios.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-usuario-form',
  templateUrl: './usuario-form.component.html',
  styleUrls: ['./usuario-form.component.scss']
})
export class UsuarioFormComponent implements OnInit {

  usuario: Usuario = new Usuario();

  roles : Rol[] = [];
  snack: any;
  

  constructor(private usuarioService: UsuariosService, private activatedRoute:ActivatedRoute) { }

  ngOnInit(): void {

  this.usuarioService.getRol()
  .subscribe(response => this.roles=response);

  this.activatedRoute.params
  .subscribe(params=>{
    let id_usuario : number = params['id_usuario'];
    if(id_usuario){
      this.usuarioService.obtenerUsuario(id_usuario)
      .subscribe(response => this.usuario = response)
    }
  })
  
  }

  crearUsuario(){
    this.usuarioService.crearUsuario(this.usuario)
    .subscribe(response =>
      Swal.fire('Usuario creado','Usuario creado con exito','success')
    
    )
  }
  
  actualizarUsuario(){
    this.usuarioService.actualizarUsuario(this.usuario)
    .subscribe(response =>{

      if(this.usuario.edad < 18){
        this.snack.open('El usuario debe ser mayor de edad','Aceptar',{
          duration : 5000,
          verticalPosition : 'top',
          horizontalPosition: 'right'
        });
      }

      Swal.fire('Usuario Actualizado','Usuario actualizado con exito','success');
    })
  }


  }


