import { Injectable } from '@angular/core';
import {EstadosCivilesViewModel} from '../Models/EstadosCivilesViewModel';
import {HttpClient} from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class EstadosCivilesServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/API/EstadosCiviles/Listado';

  getEstado (){
    return this.http.get<EstadosCivilesViewModel[]>(this.Url);
  }
}