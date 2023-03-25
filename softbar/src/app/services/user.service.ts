import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import baserUrl from './helper';
@Injectable({
  providedIn: 'root'
})
export class UserService {
  url: String = 'http://localhost:8083/usuario';

  constructor(private httpClient: HttpClient) { }
  
  public registrarUsuario(user ){
    return this.httpClient.post(`${baserUrl}/usuario/crear`,user);
  }





}
