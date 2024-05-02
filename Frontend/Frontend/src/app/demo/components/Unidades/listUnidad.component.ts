import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { UnidadesViewModel } from '../../api/Models/UnidadesViewModel';
import { UnidadServiceService } from '../../api/Services/unidades-service.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';

@Component({
  selector: 'app-list',
  templateUrl: './listUnidad.component.html',
  styleUrls: ['./listUnidad.component.css']
})
export class UnidadesListadoComponent implements OnInit {
  unidades: UnidadesViewModel[] = [];
  showModal: boolean = false;
  editModal: boolean = false;
  deleteModal: boolean = false;
  unidadSeleccionada: UnidadesViewModel = { 
    unida_Id: 0, 
    unida_Descripcion: '', 
    unida_UsuarioCreacion: 0, 
    unida_FechaCreacion: new Date(), 
    unida_UsuarioModificacion: null, 
    unida_FechaModificacion: null, 
    unida_Estado: null, 
    usuarioCreacion: '', 
    usuarioModificacion: '' 
};
  
constructor(private service: UnidadServiceService, private router: Router) {}

  ngOnInit(): void {
    this.getUnidades();
  }

  onGlobalFilter(event: any): void {
    const searchText = event.target.value.toLowerCase();
    this.unidades = this.unidades.filter((unidad: UnidadesViewModel) => {
      return (
        unidad.unida_Id.toString().toLowerCase().includes(searchText) ||
        unidad.unida_Descripcion.toLowerCase().includes(searchText)
      );
    });
  }

  getUnidades(): void {
    this.service.getUnidades().subscribe(
      (response: any) => {
        console.log(response);
        this.unidades = response.data;
      },
      error => {
        console.log(error);
      }
    );
  }

  clear(): void {
    this.getUnidades(); // Recargar las unidades originales
  }

  openModal(): void {
    this.showModal = true;
  }

  closeModal(): void {
    this.showModal = false;
  }

  editUnidad(unidad: UnidadesViewModel): void {
    this.unidadSeleccionada = unidad;
    this.editModal = true;
  }

  guardarCambios(): void {
    this.editModal = false;
  }

  deleteUnidad(unidad: UnidadesViewModel): void {
    this.unidadSeleccionada = unidad;
    this.deleteModal = true;
  }

  eliminarUnidad(): void {
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
  declarations: [UnidadesListadoComponent]
})
export class UnidadesListadoModule {}
