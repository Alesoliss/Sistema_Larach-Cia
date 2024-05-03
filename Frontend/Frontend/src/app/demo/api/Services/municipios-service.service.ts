import { Injectable } from '@angular/core';
import { Observable } from 'rxjs'; // Importa Observable desde RxJS
import { MunicipiosViewModel } from '../Models/MunicipiosViewModel';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class MunicipiosServiceService {

  constructor(private http: HttpClient) { }
  Url = 'https://localhost:44300/API/Municipios/Listado';
  private baseUrl = 'https://localhost:44300/API/Municipios';

  insertarMunicipio(municipio: MunicipiosViewModel) {
    return this.http.post<MunicipiosViewModel>(`${this.baseUrl}/Create`, municipio);
  }

  eliminarMunicipio(municipioId: string): Observable<any> {
    const url = `${this.baseUrl}/Eliminar/${municipioId}`;
    return this.http.delete(url);
  }

  getMunicipio() {
    return this.http.get<MunicipiosViewModel[]>(this.Url);
  }
}
