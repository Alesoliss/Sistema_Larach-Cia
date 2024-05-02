import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { ImpuestosViewModel } from '../../api/Models/ImpuestosViewModel';
import { ImpuestoServiceService } from '../../api/Services/impuestos-service.service';

@Component({
  selector: 'app-list',
  templateUrl: './listImpuesto.component.html',
  styleUrls: ['./listImpuesto.component.css']
})
export class ImpuestoListadoComponent implements OnInit {
  impuesto!: ImpuestosViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
  deleteModal: boolean = false;
  impuestoSeleccionado: ImpuestosViewModel = { 
    impue_Id: 0, 
    impue_Descripcion: 0, 
    impue_UsuarioCreacion: 0, 
    impue_FechaCreacion: new Date(), 
    impue_UsuarioModificacion: null, 
    impue_FechaModificacion: null, 
    impue_Estado: null, 
    usuarioCreacion: '', 
    usuarioModificacion: '' 
  };

  constructor(private service: ImpuestoServiceService, private router: Router) {}

  ngOnInit(): void {
    this.getImpuesto();
  }

  onGlobalFilter(event: any): void {
    const searchText = event.target.value.toLowerCase();
    this.impuesto = this.impuesto.filter((impuesto: ImpuestosViewModel) => {
      return (
        impuesto.impue_Id.toString().toLowerCase().includes(searchText) ||
        impuesto.impue_Descripcion.toString().toLowerCase().includes(searchText) ||
        impuesto.impue_UsuarioCreacion.toString().toLowerCase().includes(searchText) ||
        (impuesto.impue_FechaCreacion && impuesto.impue_FechaCreacion.toString().toLowerCase().includes(searchText)) ||
        (impuesto.impue_UsuarioModificacion && impuesto.impue_UsuarioModificacion.toString().toLowerCase().includes(searchText)) ||
        ((impuesto.impue_FechaModificacion && impuesto.impue_FechaModificacion.toString().toLowerCase().includes(searchText))) ||
        ((impuesto.impue_Estado !== null && impuesto.impue_Estado.toString().toLowerCase().includes(searchText)))
      );
    });
  }

  getImpuesto(): void {
    this.service.getImpuesto().subscribe(
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
    this.getImpuesto();
  }

  openModal(): void {
    this.showModal = true;
  }

  closeModal(): void {
    this.showModal = false;
  }

  editDepartamento(depto: ImpuestosViewModel): void {
    this.impuestoSeleccionado = depto;
    this.editModal = true;
  }

  guardarCambios(): void {
    this.editModal = false;
  }

  deleteDepartamento(depto: ImpuestosViewModel): void {
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
  declarations: [ImpuestoListadoComponent]
})
export class ImpuestoListadoModule {}
