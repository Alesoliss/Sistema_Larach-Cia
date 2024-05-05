import { Injectable } from '@angular/core';
import {MetodosPagoViewModel,Fill} from '../Models/MetodosPagoViewModel';
import {HttpClient} from '@angular/common/http';
import { Observable } from 'rxjs/internal/Observable';
import { map } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MetodopagoServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/Listado';

  getMetodoPago (){
    return this.http.get<MetodosPagoViewModel[]>(this.Url);
  }
  EnviarMetodoPago(formData: any): Observable<any> {
    return this.http.post<any>('API/MetodoPago/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }
  getFill(codigo: string): Observable<Fill> {
    return this.http.get<Fill>(`${'API/MetodoPago/Fill/' + codigo}`);
  }
  EliminarMetodoPago(ID): Observable<any>{
    return this.http.delete<any>(`${ 'API/MetodoPago/Delete/' + ID}`)
  }
  ActualizarMetodoPago(formData){
    return this.http.put( 'API/MetodoPago/Edit/', formData)
  }
}