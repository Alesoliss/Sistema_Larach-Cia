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
import { MensajeViewModel } from '../../api/Models/MensajeViewModel';
import { ToastModule } from 'primeng/toast'; 
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
  showDeleteConfirmation: boolean = false;
  MensajeViewModel!: MensajeViewModel[];
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
  deparSeleccionadoId: string = '';

  eliminarcategoria(departamentoId: string): void {
      console.log('ID:', departamentoId);
      // Almacena el ID del municipio seleccionado
      this.deparSeleccionadoId = departamentoId.toString();
      // Muestra el modal de confirmación
      this.showDeleteConfirmation = true;
  }

  
  confirmarEliminacion(): void {
    if (this.deparSeleccionadoId) {
        this.service.eliminardepartamento(parseInt(this.deparSeleccionadoId)).subscribe(
            (response) => {
                console.log('Municipio eliminado exitosamente', response);
  
                // Añadimos un mensaje de éxito aquí para verificar si se ejecuta
                // this.messageService.add({ severity: 'success', summary: 'Success Message', detail: 'Municipio eliminado correctamente' });
  
                this.getDepartamentos();
                this.deparSeleccionadoId = '';
            },
            (error) => {
              // this.messageService.add({ severity: 'Error', summary: 'Danger Message', detail: 'El Municipio no se eliminado correctamente' });
                this.deparSeleccionadoId = '';
            }
        );
    } else {
        console.error('ID del municipio seleccionado está vacío');
    }
    this.showDeleteConfirmation = false;
  }

  cancelarEliminacion(): void {
    this.showDeleteConfirmation = false;
    this.deparSeleccionadoId = '';
  }
    //Funcionan como regex
    ValidarNumeros(event: KeyboardEvent) {
      if (!/[0-9]/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab') {
          event.preventDefault();
      }
  }
  validarTexto(event: KeyboardEvent) {

      if (!/^[a-zA-Z\s]+$/.test(event.key) && event.key !== 'Backspace' && event.key !== 'Tab' && event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') {
          event.preventDefault();
      }
  }


  openModal(tipo: string, departamento?: DepartamentosViewModel): void {
    if (tipo === 'nuevo') {
        // Limpiar el objeto impuestoSeleccionado antes de abrir el modal de inserción
        this.departamentoSeleccionado = {
            depar_Id: '',
            depar_Descripcion: '',
            depar_UsuarioCreacion: 0,
            depar_FechaCreacion: new Date(),
            depar_UsuarioModificacion: null,
            depar_FechaModificacion: null,
            usuarioCreacion: '',
            usuarioModificacion: ''
        };
        this.showModal = true;
    } else if (tipo === 'editar') {
        this.departamentoSeleccionado = departamento!;
        this.editModal = true;
    } else if (tipo === 'eliminar') {
        this.deleteModal = true;
    }
  }


  closeModal(tipo: string): void {
    if (tipo === 'nuevo') {
      this.showModal = false;
    } else if (tipo === 'editar') {
      this.editModal = false;
    } else if (tipo === 'eliminar') {
      this.deleteModal = false;
    }
  }

  
  guardarNuevodepar(): void {
    this.service.insertardepartamento(this.departamentoSeleccionado).subscribe(
       (response: any) => {
        console.log('Municipio insertado correctamente:', response);
  
        // this.messageService.add({ severity: 'success', summary: 'Success Message', detail: 'Municipio insertado correctamente' });
  
         this.getDepartamentos();
        this.closeModal('nuevo');
      },
      error => {
        console.error('Error al insertar el municipio:', error);
        // this.showToast('error', 'Error Message', 'Error al insertar el municipio');
  
       }
     );
   }
   guardarCambios(): void {
    this.service.actualizardepartamento(this.departamentoSeleccionado).subscribe(
      (response) => {
        console.log('departamento actualizado correctamente:', response);
        // this.showToast('success', 'Success Message', 'Municipio actualizado correctamente');
        this.getDepartamentos();
        this.closeModal('editar');
      },
      (error) => {
        console.error('Error al actualizar el departamento:', error);
        // this.showToast('error', 'Error Message', 'Error al actualizar el municipio');
      }
    );
  }

  // editDepartamento(depto: DepartamentosViewModel): void {
  //   this.departamentoSeleccionado = depto;
  //   this.editModal = true;
  // }

  // guardarCambios(): void {
  //   // Lógica para guardar los cambios en el departamento
  //   this.editModal = false;
  // }

  // deleteDepartamento(depto: DepartamentosViewModel): void {
  //   // Lógica para eliminar el departamento
  //   this.departamentoSeleccionado = depto;
  //   this.deleteModal = true;
  // }

  // eliminarDepartamento(): void {
  //   // Lógica para confirmar y eliminar el departamento
  //   this.deleteModal = false;
  // }


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
