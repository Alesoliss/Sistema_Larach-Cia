import { Injectable } from '@angular/core';
import {LoginVieweMOdel} from '../Models/LoginViewModel';
import {HttpClient} from '@angular/common/http';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ServiceUsuario {
  private baseUrl = 'https://localhost:44320/api/Usuario'; // Ajusta la base URL si es necesario

  constructor(private http: HttpClient) {}




  // Método para iniciar sesión (nuevo método)
  login(usuario: string, contraseña: string): Observable<any> {
    const url = ${this.baseUrl}/Login/${encodeURIComponent(usuario)},${encodeURIComponent(contraseña)};
    return this.http.get<any>(url);
  }
}
 