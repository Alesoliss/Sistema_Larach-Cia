import { Injectable } from '@angular/core';
import {DepartamentosViewModel} from '../Models/DepartamentosViewModel';
import {HttpClient} from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class DepartamentoServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/API/Departamento/Listado';

  getDepartamento (){
    return this.http.get<DepartamentosViewModel[]>(this.Url);
  }
}