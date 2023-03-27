import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Rol } from '../../models/rol';
import { Usuario } from '../../models/usuario';
import { baserUrl } from '../helper';

@Injectable({
  providedIn: 'root',
})
export class UsuariosService {
  url: string = baserUrl + '/usuarios';

  constructor(private http: HttpClient) {}

  registrarUsuario(user) {
    return this.http.post(`${this.url}/usuario/crear`, user);
  }

  getUsuario(): Observable<Usuario[]> {
    return this.http.get<Usuario[]>(this.url);
  }

  getRol(): Observable<Rol[]> {
    return this.http.get<Rol[]>(baserUrl + '/roles');
  }

  crearUsuario(usuario: Usuario): Observable<Usuario> {
    return this.http.post<Usuario>(this.url, usuario.getWithFK());
  }

  obtenerUsuario(id_usuario: number): Observable<Usuario> {
    return this.http.get<Usuario>(baserUrl + '/usuario?id=' + id_usuario);
  }

  actualizarUsuario(usuario: Usuario): Observable<Usuario> {
    console.log(usuario)
    return this.http.put<Usuario>(
      this.url,
      usuario
    );
  }

  eliminarUsuario(id_usuario: number): Observable<any> {
    return this.http.delete<any>(this.url + '?id=' + id_usuario);
  }
}
