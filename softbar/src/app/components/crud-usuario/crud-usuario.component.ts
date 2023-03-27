import { TmplAstVariable } from '@angular/compiler';
import { Component, OnInit } from '@angular/core';
import { Usuario } from 'src/app/models/usuario';
import { ExporterExcelService } from 'src/app/services/exporter/exporter-excel.service';
import { UsuariosService } from 'src/app/services/user/usuarios.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-crud-usuario',
  templateUrl: './crud-usuario.component.html',
  styleUrls: ['./crud-usuario.component.scss']
})
export class CrudUsuarioComponent implements OnInit {

  usuarios : Usuario[] = [];

  

  constructor(private usuarioService : UsuariosService, private excelService: ExporterExcelService) { }

  

  ngOnInit(): void {

    this.usuarioService.getUsuario()
    .subscribe(response => this.usuarios=response);
  } 

  eliminarUsuario(id_usuario){
    this.usuarioService.eliminarUsuario(id_usuario)
    .subscribe(response =>{
      if(response===true){
        this.usuarios.pop();
      }
      Swal.fire('Usuario Eliminado','Usuario eliminado con exito','success');
    })
  }

  exportAsXLSX():void{
    this.excelService.exportToExcel(this.usuarioService.getUsuario(), 'my_export')
  }

}
