import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
    selector: 'app-inicio-de-sesion',
    templateUrl:'./login.component.html',
    styleUrls: ['./login.component.css']
  })
export class LoginComponent {
    constructor(private router: Router) {}

    irAPaginaPrincipal() {
      this.router.navigate(['/app/Principal']); 
    }
  }


