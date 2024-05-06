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
import { MensajeViewModel } from '../../api/Models/MensajeViewModel';
import { ToastModule } from 'primeng/toast'; 
@Component({
  selector: 'app-list',
  templateUrl: './listEstado.component.html',
  styleUrls: ['./listEstado.component.css']
})
export class EstadoCivilListadoComponent implements OnInit {
  estado!: EstadosCivilesViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
  showDeleteConfirmation: boolean = false;
  MensajeViewModel!: MensajeViewModel[];
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
  civilSeleccionadoId: string = '';

  eliminarcategoria(civilId: number): void {
      console.log('ID:', civilId);
      // Almacena el ID del municipio seleccionado
      this.civilSeleccionadoId = civilId.toString();
      // Muestra el modal de confirmación
      this.showDeleteConfirmation = true;
  }
  confirmarEliminacion(): void {
    if (this.civilSeleccionadoId) {
        this.service.eliminarCivil(parseInt(this.civilSeleccionadoId)).subscribe(
            (response) => {
                console.log('Municipio eliminado exitosamente', response);
  
                // Añadimos un mensaje de éxito aquí para verificar si se ejecuta
                // this.messageService.add({ severity: 'success', summary: 'Success Message', detail: 'Municipio eliminado correctamente' });
  
                this.getEstado();
                this.civilSeleccionadoId = '';
            },
            (error) => {
              // this.messageService.add({ severity: 'Error', summary: 'Danger Message', detail: 'El Municipio no se eliminado correctamente' });
                this.civilSeleccionadoId = '';
            }
        );
    } else {
        console.error('ID del municipio seleccionado está vacío');
    }
    this.showDeleteConfirmation = false;
  }

  cancelarEliminacion(): void {
    this.showDeleteConfirmation = false;
    this.civilSeleccionadoId = '';
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

  openModal(tipo: string, departamento?: EstadosCivilesViewModel): void {
    if (tipo === 'nuevo') {
        // Limpiar el objeto impuestoSeleccionado antes de abrir el modal de inserción
        this.estadoSeleccionado = {
            estad_Id: 0,
            estad_Descripcion: '',
            estad_UsuarioCreacion: 0,
            estad_FechaCreacion: new Date(),
            estad_UsuarioModificacion: null,
            estad_FechaModificacion: null,
            usuarioCreacion: '',
            usuarioModificacion: ''
        };
        this.showModal = true;
    } else if (tipo === 'editar') {
        this.estadoSeleccionado = departamento!;
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
  guardarNuevocategoria(): void {
    this.service.insertarCivil(this.estadoSeleccionado).subscribe(
       (response: any) => {
        console.log('estadocivil insertado correctamente:', response);
  
        // this.messageService.add({ severity: 'success', summary: 'Success Message', detail: 'Municipio insertado correctamente' });
  
         this.getEstado();
        this.closeModal('nuevo');
      },
      error => {
        console.error('Error al insertar el estadocivil:', error);
        // this.showToast('error', 'Error Message', 'Error al insertar el municipio');
  
       }
     );
   }
   
   guardarCambios(): void {
    this.service.actualizarCivil(this.estadoSeleccionado).subscribe(
      (response) => {
        console.log('estadocivil actualizado correctamente:', response);
        // this.showToast('success', 'Success Message', 'Municipio actualizado correctamente');
        this.getEstado();
        this.closeModal('editar');
      },
      (error) => {
        console.error('Error al actualizar el estadocivil:', error);
        // this.showToast('error', 'Error Message', 'Error al actualizar el municipio');
      }
    );
  }
  // editDepartamento(depto: EstadosCivilesViewModel): void {
  //   this.estadoSeleccionado = depto;
  //   this.editModal = true;
  // }

  // guardarCambios(): void {
  //   this.editModal = false;
  // }

  // deleteDepartamento(depto: EstadosCivilesViewModel): void {
  //   this.estadoSeleccionado = depto;
  //   this.deleteModal = true;
  // }

  // eliminarDepartamento(): void {
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
  declarations: [EstadoCivilListadoComponent]
})
export class EstaciCivilListadoModule {}
