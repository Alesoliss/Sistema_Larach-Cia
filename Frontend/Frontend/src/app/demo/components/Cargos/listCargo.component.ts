import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { CargosViewModel } from '../../api/Models/CargosViewModel';
import { DepartamentoServiceService } from '../../api/Services/departamento-service.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { CargosServiceService } from '../../api/Services/cargos-service.service';

@Component({
  selector: 'app-list',
  templateUrl: './listCargo.component.html',
  styleUrls: ['./listCargo.component.css']
})
export class CargosListadoComponent implements OnInit {
  cargo!: CargosViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
  deleteModal: boolean = false;
   cargoSeleccionado: CargosViewModel = { 
    cargo_Id: 0, 
    cargo_Descripcion: '', 
    cargo_UsuarioCreacion: 0, 
    cargo_FechaCreacion: new Date(), 
    cargo_UsuarioModificacion: null, 
    cargo_FechaModificacion: null, 
    cargo_Estado: null, 
    usuarioCreacion: '', 
    usuarioModificacion: '' 
};
  constructor(private service: CargosServiceService, private router: Router) {}

  ngOnInit(): void {
    this.getCargo();
  }

onGlobalFilter(event: any): void {
  const searchText = event.target.value.toLowerCase();
  this.cargo = this.cargo.filter((cargo: CargosViewModel) => {
    return (
      cargo.cargo_Id.toString().toLowerCase().includes(searchText) ||
      cargo.cargo_Descripcion.toLowerCase().includes(searchText) ||
      cargo.cargo_UsuarioCreacion.toString().toLowerCase().includes(searchText) ||
      (cargo.cargo_FechaCreacion && cargo.cargo_FechaCreacion.toString().toLowerCase().includes(searchText)) ||
      (cargo.cargo_UsuarioModificacion && cargo.cargo_UsuarioModificacion.toString().toLowerCase().includes(searchText)) ||
      ((cargo.cargo_FechaModificacion && cargo.cargo_FechaModificacion.toString().toLowerCase().includes(searchText))) ||
      ((cargo.cargo_Estado !== null && cargo.cargo_Estado.toString().toLowerCase().includes(searchText)))
    );
  });
}


  getCargo(): void {
    this.service.getCargo().subscribe(
      (response: any) => {
        console.log(response);
        this.cargo = response.data;
      },
      error => {
        console.log(error);
      }
    );
  }

  clear(): void {
    this.getCargo();
  }

  openModal(): void {
    this.showModal = true;
  }

  closeModal(): void {
    this.showModal = false;
  }

  editDepartamento(depto: CargosViewModel): void {
    this.cargoSeleccionado = depto;
    this.editModal = true;
  }

  guardarCambios(): void {
    this.editModal = false;
  }

  deleteDepartamento(depto: CargosViewModel): void {
    this.cargoSeleccionado = depto;
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
  declarations: [CargosListadoComponent]
})
export class DepartamentosListadoModule {}
