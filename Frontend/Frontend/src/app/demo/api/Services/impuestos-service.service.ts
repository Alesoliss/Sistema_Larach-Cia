import { Injectable } from '@angular/core';
import {ImpuestosViewModel} from '../Models/ImpuestosViewModel';
import {HttpClient} from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class ImpuestoServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/API/Impuesto/Listado';

  getImpuesto (){
    return this.http.get<ImpuestosViewModel[]>(this.Url);
  }
}