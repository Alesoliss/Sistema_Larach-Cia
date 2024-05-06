import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { CargosViewModel } from '../../api/Models/CargosViewModel';
import { CategoriasServiceservice } from '../../api/Services/categorias-service.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { CategoriasViewModel } from '../../api/Models/CategoriasViewModel';
import { MensajeViewModel } from '../../api/Models/MensajeViewModel';
import { ToastModule } from 'primeng/toast'; 
@Component({
  selector: 'app-list',
  templateUrl: './listCategoria.component.html',
  styleUrls: ['./listCategoria.component.css']
})


export class CategoriaListadoComponent implements OnInit {
  categorias!: CategoriasViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
  showDeleteConfirmation: boolean = false;
  MensajeViewModel!: MensajeViewModel[];
  deleteModal: boolean = false;
  categoriaSeleccionada: CategoriasViewModel = { 
    categ_Id: 0, 
    categ_Descripcion: '', 
    cate_ImagenUrl: '',
    categ_UsuarioCreacion: 0, 
    categ_FechaCreacion: new Date(), 
    categ_UsuarioModificacion: null, 
    categ_FechaModificacion: null, 
    categ_Estado: null, 
    usuarioCreacion: '', 
    usuarioModificacion: '' 
};


  constructor(private service: CategoriasServiceservice, private router: Router) {}

  ngOnInit(): void {
    this.getCategoria();
  }
  onGlobalFilter(event: any): void {
    const searchText = event.target.value.toLowerCase();
    this.categorias = this.categorias.filter((categoria: CategoriasViewModel) => {
      return (
        categoria.categ_Id.toString().toLowerCase().includes(searchText) ||
        categoria.categ_Descripcion.toLowerCase().includes(searchText) ||
        categoria.categ_UsuarioCreacion.toString().toLowerCase().includes(searchText) ||
        (categoria.categ_FechaCreacion && categoria.categ_FechaCreacion.toString().toLowerCase().includes(searchText)) ||
        (categoria.categ_UsuarioModificacion && categoria.categ_UsuarioModificacion.toString().toLowerCase().includes(searchText)) ||
        ((categoria.categ_FechaModificacion && categoria.categ_FechaModificacion.toString().toLowerCase().includes(searchText))) ||
        ((categoria.categ_Estado !== null && categoria.categ_Estado.toString().toLowerCase().includes(searchText)))
      );
    });
  }
  

  getCategoria(): void {
    this.service.getCategoria().subscribe(
      (response: any) => {
        console.log(response);
        this.categorias = response.data;
      },
      error => {
        console.log(error);
      }
    );
  }

  clear(): void {
    this.getCategoria();
  }
  municipioSeleccionadoId: string = '';

  eliminarcategoria(municipioId: number): void {
      console.log('ID:', municipioId);
      // Almacena el ID del municipio seleccionado
      this.municipioSeleccionadoId = municipioId.toString();
      // Muestra el modal de confirmación
      this.showDeleteConfirmation = true;
  }

  confirmarEliminacion(): void {
    if (this.municipioSeleccionadoId) {
        this.service.eliminarCategoria(parseInt(this.municipioSeleccionadoId)).subscribe(
            (response) => {
                console.log('Municipio eliminado exitosamente', response);
  
                // Añadimos un mensaje de éxito aquí para verificar si se ejecuta
                // this.messageService.add({ severity: 'success', summary: 'Success Message', detail: 'Municipio eliminado correctamente' });
  
                this.getCategoria();
                this.municipioSeleccionadoId = '';
            },
            (error) => {
              // this.messageService.add({ severity: 'Error', summary: 'Danger Message', detail: 'El Municipio no se eliminado correctamente' });
                this.municipioSeleccionadoId = '';
            }
        );
    } else {
        console.error('ID del municipio seleccionado está vacío');
    }
    this.showDeleteConfirmation = false;
  }
  cancelarEliminacion(): void {
    this.showDeleteConfirmation = false;
    this.municipioSeleccionadoId = '';
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
  openModal(tipo: string, categoria?: CategoriasViewModel): void {
    if (tipo === 'nuevo') {
        // Limpiar el objeto impuestoSeleccionado antes de abrir el modal de inserción
        this.categoriaSeleccionada = {
            categ_Id: 0,
            categ_Descripcion: '',
            cate_ImagenUrl: '',
            categ_UsuarioCreacion: 0,
            categ_FechaCreacion: new Date(),
            categ_UsuarioModificacion: null,
            categ_FechaModificacion: null,
            usuarioCreacion: '',
            usuarioModificacion: ''
        };
        this.showModal = true;
    } else if (tipo === 'editar') {
        this.categoriaSeleccionada = categoria!;
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
    this.service.insertarCategoria(this.categoriaSeleccionada).subscribe(
       (response: any) => {
        console.log('Municipio insertado correctamente:', response);
  
        // this.messageService.add({ severity: 'success', summary: 'Success Message', detail: 'Municipio insertado correctamente' });
  
         this.getCategoria();
        this.closeModal('nuevo');
      },
      error => {
        console.error('Error al insertar el municipio:', error);
        // this.showToast('error', 'Error Message', 'Error al insertar el municipio');
  
       }
     );
   }
   guardarCambios(): void {
    this.service.actualizarCategoria(this.categoriaSeleccionada).subscribe(
      (response) => {
        console.log('Municipio actualizado correctamente:', response);
        // this.showToast('success', 'Success Message', 'Municipio actualizado correctamente');
        this.getCategoria();
        this.closeModal('editar');
      },
      (error) => {
        console.error('Error al actualizar el municipio:', error);
        // this.showToast('error', 'Error Message', 'Error al actualizar el municipio');
      }
    );
  }
  // editDepartamento(depto: CategoriasViewModel): void {
  //   this.categoriaSeleccionada = depto;
  //   this.editModal = true;
  // }

  // guardarCambios(): void {
  //   this.editModal = false;
  // }

  // deleteDepartamento(depto: CategoriasViewModel): void {
  //   this.categoriaSeleccionada = depto;
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
  declarations: [CategoriaListadoComponent]
})
export class DepartamentosListadoModule {}
