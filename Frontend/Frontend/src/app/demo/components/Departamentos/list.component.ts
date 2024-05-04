import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { DepartamentosViewModel } from '../../api/Models/DepartamentosViewModel';
import { DepartamentoServiceService } from '../../api/Services/departamento-service.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { Message, MessageService } from 'primeng/api';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css'],
  providers: [MessageService]

})
export class DepartamentosListadoComponent implements OnInit {
  departamento!: DepartamentosViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
  deleteModal: boolean = false;
  departamentoSeleccionado: DepartamentosViewModel = { 
    depar_Id: '', 
    depar_Descripcion: '', 
    depar_UsuarioCreacion: 0, 
    depar_FechaCreacion: new Date(), 
    depar_UsuarioModificacion: null, 
    depar_FechaModificacion: null, 
    depar_Estado: null, 
    usuarioCreacion: '', 
    usuarioModificacion: '' 
};
  constructor(private service: DepartamentoServiceService, private router: Router) {}

  ngOnInit(): void {
    this.getDepartamentos();
  }

  onGlobalFilter(event: any): void {
    const searchText = event.target.value.toLowerCase();
    this.departamento = this.departamento.filter((depto: DepartamentosViewModel) => {
      return (
        depto.depar_Id.toLowerCase().includes(searchText) ||
        depto.depar_Descripcion.toLowerCase().includes(searchText)
      );
    });
  }

  getDepartamentos(): void {
    this.service.getDepartamento().subscribe(
      (response: any) => {
        console.log(response);
        this.departamento = response.data;
      },
      error => {
        console.log(error);
      }
    );
  }

  clear(): void {
    this.getDepartamentos(); // Recargar los departamentos originales
  }

  openModal(): void {
    this.showModal = true;
  }

  closeModal(): void {
    this.showModal = false;
  }

  editDepartamento(depto: DepartamentosViewModel): void {
    this.departamentoSeleccionado = depto;
    this.editModal = true;
  }

  guardarCambios(): void {
    // Lógica para guardar los cambios en el departamento
    this.editModal = false;
  }

  deleteDepartamento(depto: DepartamentosViewModel): void {
    // Lógica para eliminar el departamento
    this.departamentoSeleccionado = depto;
    this.deleteModal = true;
  }

  eliminarDepartamento(): void {
    // Lógica para confirmar y eliminar el departamento
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
  declarations: [DepartamentosListadoComponent]
})
export class DepartamentosListadoModule {}
