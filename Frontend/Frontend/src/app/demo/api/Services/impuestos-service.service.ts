import { Injectable } from '@angular/core';
import {ImpuestosViewModel,Fill} from '../Models/ImpuestosViewModel';
import {HttpClient} from '@angular/common/http';
import { Observable,map } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ImpuestoServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/API/Impuesto/Listado';
  private baseUrl = 'https://localhost:44300/API/Impuesto';

  
  insertarImpuesto(formData: any): Observable<any> {
    return this.http.post<any>(this.baseUrl + '/Create/', formData).pipe(
      map(response => {
        return response;
      }),
    );
  }


  actualizarImpuesto(categoria: ImpuestosViewModel): Observable<any> {
    const url = `${this.baseUrl}/Actualizar`;
    return this.http.put(url, categoria);
  }
  
  getDetalles(codigo: number): Observable<Fill> {
    return this.http.get<Fill>(`${'https://localhost:44300/API/EstadosCiviles/Detalles/' + codigo}`);
  }

  eliminarImpuesto(categoriaId: number): Observable<any> {
    const url = `${this.baseUrl}/Eliminar/${categoriaId}`;
    return this.http.delete(url);
  }

  getImpuesto (){
    return this.http.get<ImpuestosViewModel[]>(this.Url);
  }
}