import { Component, OnInit, NgModule } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DialogModule } from 'primeng/dialog';
import { MunicipiosViewModel } from '../../api/Models/MunicipiosViewModel';
import { MunicipiosServiceService } from '../../api/Services/municipios-service.service';

@Component({
  selector: 'app-list',
  templateUrl: './listMunicipios.component.html',
  styleUrls: ['./listMunicipios.component.css']
})
export class MunicipioListadoComponent implements OnInit {
  impuesto!: MunicipiosViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
  deleteModal: boolean = false;
  impuestoSeleccionado: MunicipiosViewModel = { 
    munic_Id: '', 
    munic_Descripcion: '', 
    depar_Id: '', 
    munic_UsuarioCreacion: 0, 
    munic_FechaCreacion: new Date(), 
    munic_UsuarioModificacion: null, 
    munic_FechaModificacion: null, 
    depar_Descripcion: '', 
    munic_Estado: null, 
    usuarioCreacion: '', 
    usuarioModificacion: '' 
  };

  constructor(private service: MunicipiosServiceService, private router: Router) {}

  ngOnInit(): void {
    this.getMunicipio();
  }

  onGlobalFilter(event: any): void {
    const searchText = event.target.value.toLowerCase();
    this.impuesto = this.impuesto.filter((impuesto: MunicipiosViewModel) => {
      return (
        impuesto.munic_Id.toLowerCase().includes(searchText) ||
        impuesto.munic_Descripcion.toLowerCase().includes(searchText) ||
        impuesto.depar_Id.toLowerCase().includes(searchText) ||
        impuesto.depar_Descripcion.toLowerCase().includes(searchText) ||
        impuesto.munic_UsuarioCreacion.toString().toLowerCase().includes(searchText) ||
        (impuesto.munic_FechaCreacion && impuesto.munic_FechaCreacion.toString().toLowerCase().includes(searchText)) ||
        (impuesto.munic_UsuarioModificacion && impuesto.munic_UsuarioModificacion.toString().toLowerCase().includes(searchText)) ||
        ((impuesto.munic_FechaModificacion && impuesto.munic_FechaModificacion.toString().toLowerCase().includes(searchText))) ||
        ((impuesto.munic_Estado !== null && impuesto.munic_Estado.toString().toLowerCase().includes(searchText)))
      );
    });
  }

  getMunicipio(): void {
    this.service.getMunicipio().subscribe(
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
    this.getMunicipio();
  }

  openModal(): void {
    this.showModal = true;
  }

  closeModal(): void {
    this.showModal = false;
  }

  editDepartamento(depto: MunicipiosViewModel): void {
    this.impuestoSeleccionado = depto;
    this.editModal = true;
  }

  guardarCambios(): void {
    this.editModal = false;
  }

  deleteDepartamento(depto: MunicipiosViewModel): void {
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
  declarations: [MunicipioListadoComponent]
})
export class MetodoPagoListadoModule {}
