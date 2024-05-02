import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { MetodosPagoViewModel } from '../../api/Models/MetodosPagoViewModel';
import { MetodopagoServiceService } from '../../api/Services/metodosPago-service.service';

@Component({
  selector: 'app-list',
  templateUrl: './listMetodopago.component.html',
  styleUrls: ['./listMetodopago.component.css']
})

export class MetodoPagoListadoComponent implements OnInit {
  impuesto!: MetodosPagoViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
  deleteModal: boolean = false;
  impuestoSeleccionado: MetodosPagoViewModel = { 
    mtPag_Id: 0, 
    mtPag_Descripcion: '', 
    mtPag_UsuarioCreacion: 0, 
    mtPag_FechaCreacion: new Date(), 
    mtPag_UsuarioModificacion: null, 
    mtPag_Estado: null, 
    mtPag_FechaModificacion: null, 
    usuarioCreacion: '', 
    usuarioModificacion: '' 
  };

  constructor(private service: MetodopagoServiceService, private router: Router) {}

  ngOnInit(): void {
    this.getMetodoPago();
  }

  onGlobalFilter(event: any): void {
    const searchText = event.target.value.toLowerCase();
    this.impuesto = this.impuesto.filter((impuesto: MetodosPagoViewModel) => {
      return (
        impuesto.mtPag_Id.toString().toLowerCase().includes(searchText) ||
        impuesto.mtPag_Descripcion.toLowerCase().includes(searchText) ||
        impuesto.mtPag_UsuarioCreacion.toString().toLowerCase().includes(searchText) ||
        (impuesto.mtPag_FechaCreacion && impuesto.mtPag_FechaCreacion.toString().toLowerCase().includes(searchText)) ||
        (impuesto.mtPag_UsuarioModificacion && impuesto.mtPag_UsuarioModificacion.toString().toLowerCase().includes(searchText)) ||
        ((impuesto.mtPag_FechaModificacion && impuesto.mtPag_FechaModificacion.toString().toLowerCase().includes(searchText))) ||
        ((impuesto.mtPag_Estado !== null && impuesto.mtPag_Estado.toString().toLowerCase().includes(searchText)))
      );
    });
  }

  getMetodoPago(): void {
    this.service.getMetodoPago().subscribe(
      (response: any) => {
        console.log(response);
        this.impuesto = response.data;
      },
      error => {
        console.log(error);
      }
    );
  }

  clear(): void {
    this.getMetodoPago();
  }

  openModal(): void {
    this.showModal = true;
  }

  closeModal(): void {
    this.showModal = false;
  }

  editDepartamento(depto: MetodosPagoViewModel): void {
    this.impuestoSeleccionado = depto;
    this.editModal = true;
  }

  guardarCambios(): void {
    this.editModal = false;
  }

  deleteDepartamento(depto: MetodosPagoViewModel): void {
    this.impuestoSeleccionado = depto;
    this.deleteModal = true;
  }

  eliminarDepartamento(): void {
    this.deleteModal = false;
  }
}

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    TableModule,
    ButtonModule,
    InputTextModule,
    DialogModule
  ],
  declarations: [MetodoPagoListadoComponent]
})
export class MetodoPagoListadoModule {}
