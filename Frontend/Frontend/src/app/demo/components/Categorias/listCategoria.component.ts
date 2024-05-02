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

@Component({
  selector: 'app-list',
  templateUrl: './listCategoria.component.html',
  styleUrls: ['./listCategoria.component.css']
})


export class CategoriaListadoComponent implements OnInit {
  categorias!: CategoriasViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
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

  openModal(): void {
    this.showModal = true;
  }

  closeModal(): void {
    this.showModal = false;
  }

  editDepartamento(depto: CategoriasViewModel): void {
    this.categoriaSeleccionada = depto;
    this.editModal = true;
  }

  guardarCambios(): void {
    this.editModal = false;
  }

  deleteDepartamento(depto: CategoriasViewModel): void {
    this.categoriaSeleccionada = depto;
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
  declarations: [CategoriaListadoComponent]
})
export class DepartamentosListadoModule {}
