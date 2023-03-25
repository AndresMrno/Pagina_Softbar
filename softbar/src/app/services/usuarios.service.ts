import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Rol } from '../models/rol';
import { Usuario } from '../models/usuario';

@Injectable({
  providedIn: 'root'
})
export class UsuariosService {

  url: String = 'http://localhost:8083/usuario';

  constructor(private http: HttpClient) { }

  getUsuario(): Observable<Usuario[]> {
    return this.http.get<Usuario[]>(this.url + '/listar');
  }

  getRol(): Observable<Rol[]> {
    return this.http.get<Rol[]>(this.url + '/rol')
  }

  crearUsuario(usuario: Usuario): Observable<Usuario> {
    return this.http.post<Usuario>(this.url + '/agregar', usuario);
  }

  obtenerUsuario(id_usuario: number): Observable<Usuario> {
    return this.http.get<Usuario>(this.url + '/' + id_usuario);
  }

  actualizarUsuario(usuario: Usuario): Observable<Usuario> {
    return this.http.put<Usuario>(this.url + '/actualizar/' + usuario.id_usuario, usuario)
  }

  eliminarUsuario(id_usuario: number): Observable<any> {
    return this.http.delete<any>(this.url + '/eliminar/' + id_usuario);
  }

}
