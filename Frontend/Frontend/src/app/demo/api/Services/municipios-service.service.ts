import { Injectable } from '@angular/core';
import {MunicipiosViewModel} from '../Models/MunicipiosViewModel';
import {HttpClient} from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class MunicipiosServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/API/Municipios/Listado';

  getMunicipio (){
    return this.http.get<MunicipiosViewModel[]>(this.Url);
  }
}