import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { DepartamentoServiceService } from '../../api/Services/departamento-service.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { EstadosCivilesServiceService } from '../../api/Services/estadosCiviles-service.service';
import { EstadosCivilesViewModel } from '../../api/Models/EstadosCivilesViewModel';

@Component({
  selector: 'app-list',
  templateUrl: './listEstado.component.html',
  styleUrls: ['./listEstado.component.css']
})
export class EstadoCivilListadoComponent implements OnInit {
  estado!: EstadosCivilesViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
  deleteModal: boolean = false;
  estadoSeleccionado: EstadosCivilesViewModel = { 
    estad_Id: 0, 
    estad_Descripcion: '', 
    estad_UsuarioCreacion: 0, 
    estad_FechaCreacion: new Date(), 
    estad_UsuarioModificacion: null, 
    estad_FechaModificacion: null, 
    estad_Estado: null, 
    usuarioCreacion: '', 
    usuarioModificacion: '' 
  };

  constructor(private service: EstadosCivilesServiceService, private router: Router) {}

  ngOnInit(): void {
    this.getEstado();
  }

  onGlobalFilter(event: any): void {
    const searchText = event.target.value.toLowerCase();
    this.estado = this.estado.filter((estado: EstadosCivilesViewModel) => {
      return (
        estado.estad_Id.toString().toLowerCase().includes(searchText) ||
        estado.estad_Descripcion.toLowerCase().includes(searchText) ||
        estado.estad_UsuarioCreacion.toString().toLowerCase().includes(searchText) ||
        (estado.estad_FechaCreacion && estado.estad_FechaCreacion.toString().toLowerCase().includes(searchText)) ||
        (estado.estad_UsuarioModificacion && estado.estad_UsuarioModificacion.toString().toLowerCase().includes(searchText)) ||
        ((estado.estad_FechaModificacion && estado.estad_FechaModificacion.toString().toLowerCase().includes(searchText))) ||
        ((estado.estad_Estado !== null && estado.estad_Estado.toString().toLowerCase().includes(searchText)))
      );
    });
  }

  getEstado(): void {
    this.service.getEstado().subscribe(
      (response: any) => {
        console.log(response);
        this.estado = response.data;
      },
      error => {
        console.log(error);
      }
    );
  }

  clear(): void {
    this.getEstado();
  }

  openModal(): void {
    this.showModal = true;
  }

  closeModal(): void {
    this.showModal = false;
  }

  editDepartamento(depto: EstadosCivilesViewModel): void {
    this.estadoSeleccionado = depto;
    this.editModal = true;
  }

  guardarCambios(): void {
    this.editModal = false;
  }

  deleteDepartamento(depto: EstadosCivilesViewModel): void {
    this.estadoSeleccionado = depto;
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
  declarations: [EstadoCivilListadoComponent]
})
export class EstaciCivilListadoModule {}
