import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { CargosViewModel } from '../Models/CargosViewModel';


@Injectable({
  providedIn: 'root'
})
export class CargosServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/API/Cargo/Listado';

  getCargo (){
    return this.http.get<CargosViewModel[]>(this.Url);
  }
}