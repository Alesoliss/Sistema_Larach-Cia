import { Injectable } from '@angular/core';
import {CategoriasViewModel} from '../Models/CategoriasViewModel';
import {HttpClient} from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class CategoriasServiceservice {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/API/Categoria/Listado';

  getCategoria (){
    return this.http.get<CategoriasViewModel[]>(this.Url);
  }
}