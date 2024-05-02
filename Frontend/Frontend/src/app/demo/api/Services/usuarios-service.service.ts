import { Injectable } from '@angular/core';
import {UsuariosViewModel} from '../Models/UsuariosViewModel';
import {HttpClient} from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class UsuariosServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/api/Usuario/Listado';
  getUsuarios (){
    return this.http.get<UsuariosViewModel[]>(this.Url);
  }
}