import { Injectable } from '@angular/core';
import {MetodosPagoViewModel} from '../Models/MetodosPagoViewModel';
import {HttpClient} from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class MetodopagoServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/Listado';

  getMetodoPago (){
    return this.http.get<MetodosPagoViewModel[]>(this.Url);
  }
}