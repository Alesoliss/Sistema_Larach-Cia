import { Injectable } from '@angular/core';
import {UnidadesViewModel} from '../Models/UnidadesViewModel';
import {HttpClient} from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class UnidadServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/API/Unidades/Listado';

  getUnidades (){
    return this.http.get<UnidadesViewModel[]>(this.Url);
  }
}