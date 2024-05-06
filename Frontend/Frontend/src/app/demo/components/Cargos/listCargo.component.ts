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
import { MensajeViewModel } from '../../api/Models/MensajeViewModel';
import { ToastModule } from 'primeng/toast'; 
@Component({
  selector: 'app-list',
  templateUrl: './listCargo.component.html',
  styleUrls: ['./listCargo.component.css']
})
export class CargosListadoComponent implements OnInit {
  cargo!: CargosViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
  showDeleteConfirmation: boolean = false;
  MensajeViewModel!: MensajeViewModel[];
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
  cargoSeleccionadoId: string = '';

  eliminarcategoria(municipioId: number): void {
      console.log('ID:', municipioId);
      // Almacena el ID del municipio seleccionado
      this.cargoSeleccionadoId = municipioId.toString();
      // Muestra el modal de confirmación
      this.showDeleteConfirmation = true;
  }

  confirmarEliminacion(): void {
    if (this.cargoSeleccionadoId) {
        this.service.eliminarCargo(parseInt(this.cargoSeleccionadoId)).subscribe(
            (response) => {
                console.log('Municipio eliminado exitosamente', response);
  
                // Añadimos un mensaje de éxito aquí para verificar si se ejecuta
                // this.messageService.add({ severity: 'success', summary: 'Success Message', detail: 'Municipio eliminado correctamente' });
  
                this.getCargo();
                this.cargoSeleccionadoId = '';
            },
            (error) => {
              // this.messageService.add({ severity: 'Error', summary: 'Danger Message', detail: 'El Municipio no se eliminado correctamente' });
                this.cargoSeleccionadoId = '';
            }
        );
    } else {
        console.error('ID del municipio seleccionado está vacío');
    }
    this.showDeleteConfirmation = false;
  }

  cancelarEliminacion(): void {
    this.showDeleteConfirmation = false;
    this.cargoSeleccionadoId = '';
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
  openModal(tipo: string, categoria?: CargosViewModel): void {
    if (tipo === 'nuevo') {
        // Limpiar el objeto impuestoSeleccionado antes de abrir el modal de inserción
        this.cargoSeleccionado = {
            cargo_Id: 0,
            cargo_Descripcion: '',
            cargo_UsuarioCreacion: 0,
            cargo_FechaCreacion: new Date(),
            cargo_UsuarioModificacion: null,
            cargo_FechaModificacion: null,
            usuarioCreacion: '',
            usuarioModificacion: ''
        };
        this.showModal = true;
    } else if (tipo === 'editar') {
        this.cargoSeleccionado = categoria!;
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
    this.service.insertarCargo(this.cargoSeleccionado).subscribe(
       (response: any) => {
        console.log('Municipio insertado correctamente:', response);
  
        // this.messageService.add({ severity: 'success', summary: 'Success Message', detail: 'Municipio insertado correctamente' });
  
         this.getCargo();
        this.closeModal('nuevo');
      },
      error => {
        console.error('Error al insertar el municipio:', error);
        // this.showToast('error', 'Error Message', 'Error al insertar el municipio');
  
       }
     );
   }
   guardarCambios(): void {
    this.service.actualizarCargo(this.cargoSeleccionado).subscribe(
      (response) => {
        console.log('Municipio actualizado correctamente:', response);
        // this.showToast('success', 'Success Message', 'Municipio actualizado correctamente');
        this.getCargo();
        this.closeModal('editar');
      },
      (error) => {
        console.error('Error al actualizar el municipio:', error);
        // this.showToast('error', 'Error Message', 'Error al actualizar el municipio');
      }
    );
  }

  // editDepartamento(depto: CargosViewModel): void {
  //   this.cargoSeleccionado = depto;
  //   this.editModal = true;
  // }

  // guardarCambios(): void {
  //   this.editModal = false;
  // }

  // deleteDepartamento(depto: CargosViewModel): void {
  //   this.cargoSeleccionado = depto;
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
    DialogModule,
    ToastModule 
  ],
  declarations: [CargosListadoComponent]
})
export class DepartamentosListadoModule {}
