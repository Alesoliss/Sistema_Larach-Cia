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
import { DepartamentoServiceService } from '../../api/Services/departamento-service.service'; 

@Component({
  selector: 'app-list',
  templateUrl: './listMunicipios.component.html',
  styleUrls: ['./listMunicipios.component.css']
})
export class MunicipioListadoComponent implements OnInit {
  impuesto!: MunicipiosViewModel[];
  showModal: boolean = false;
  editModal: boolean = false;
  showDeleteConfirmation: boolean = false;

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

  constructor(private service: MunicipiosServiceService, private departamentoService: DepartamentoServiceService) {}

  dropdownOptions: any[] = []; 

  ngOnInit(): void {
    this.getMunicipio();
    this.getDepartamentos();

  }
  onDropdownChange(event: any): void {
    this.impuestoSeleccionado.depar_Id = event.value;
}

getDepartamentos(): void {
  this.departamentoService.getDepartamento().subscribe(
    (response: any) => {
      console.log(response);
      this.dropdownOptions = response.data.map((departamento: any) => {
        return { label: departamento.depar_Descripcion, value: departamento.depar_Id };
      });
      console.log(this.dropdownOptions); // Verificar datos asignados al dropdown
    },
    error => {
      console.log(error);
    }
  );
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


  municipioSeleccionadoId: string = '';

eliminarMunicipio(municipioId: string): void {
    console.log('ID del municipio a eliminar:', municipioId);
    // Almacena el ID del municipio seleccionado
    this.municipioSeleccionadoId = municipioId;
    // Muestra el modal de confirmación
    this.showDeleteConfirmation = true;
}

confirmarEliminacion(): void {
  // Verificar si el ID del municipio seleccionado no está vacío
  if (this.municipioSeleccionadoId) {
      // Llamar al servicio para eliminar el municipio
      this.service.eliminarMunicipio(this.municipioSeleccionadoId).subscribe(
          (response) => {
              // Manejar la respuesta de eliminación exitosa, si es necesario
              console.log('Municipio eliminado exitosamente', response);
              this.getMunicipio()
              // Aquí puedes actualizar la lista de municipios o cualquier otra acción necesaria

              // Reiniciar la variable municipioSeleccionadoId a un valor vacío o nulo
              this.municipioSeleccionadoId = '';
          },
          (error) => {
              // Manejar cualquier error de eliminación, si es necesario
              console.error('Error al eliminar el municipio', error);

              // Reiniciar la variable municipioSeleccionadoId a un valor vacío o nulo
              this.municipioSeleccionadoId = '';
          }
      );
  } else {
      // Si el ID del municipio seleccionado está vacío, muestra un mensaje de error o maneja la situación según sea necesario
      console.error('ID del municipio seleccionado está vacío');
  }

  // Ocultar el modal de confirmación después de confirmar la eliminación
  this.showDeleteConfirmation = false;
}


cancelarEliminacion(): void {
  // Simplemente oculta el modal de confirmación y restablece el ID del municipio seleccionado
  this.showDeleteConfirmation = false;
  this.municipioSeleccionadoId = '';
}


  

  openModal(tipo: string, municipio?: MunicipiosViewModel): void {
    if (tipo === 'nuevo') {
      this.showModal = true;
    } else if (tipo === 'editar') {
      this.impuestoSeleccionado = municipio!;
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

  // guardarNuevoMunicipio(): void {
  //   this.service.insertarMunicipio(this.impuestoSeleccionado).subscribe(
  //     (response: any) => {
  //       console.log('Municipio insertado correctamente:', response);
 
  //       this.getMunicipio();
  //       this.closeModal('nuevo');
  //     },
  //     error => {
  //       console.error('Error al insertar el municipio:', error);
  //     }
  //   );
  // }


  // guardarNuevoMunicipio(): void {
  //   // Verificar si hay campos vacíos
  //   if (!this.impuestoSeleccionado.munic_Descripcion || !this.impuestoSeleccionado.depar_Id) {
  //     // Mostrar mensaje de error con iziToast
  //     iziToast.error({
  //       title: 'Error',
  //       message: 'Por favor complete todos los campos.',
  //       position: 'topRight'
  //     });
  //     return; // Detener el proceso si hay campos vacíos
  //   }
  
  //   this.service.insertarMunicipio(this.impuestoSeleccionado).subscribe(
  //     (response: any) => {
  //       console.log('Municipio insertado correctamente:', response);
        
  //       // Mostrar mensaje de éxito con iziToast
  //       iziToast.success({
  //         title: 'Éxito',
  //         message: 'Municipio insertado correctamente.',
  //         position: 'topRight'
  //       });
        
  //       this.getMunicipio();
  //       this.closeModal('nuevo');
  //     },
  //     error => {
  //       console.error('Error al insertar el municipio:', error);
        
  //       // Mostrar mensaje de error con iziToast
  //       iziToast.error({
  //         title: 'Error',
  //         message: 'Error al insertar el municipio. Por favor, inténtelo de nuevo.',
  //         position: 'topRight'
  //       });
  //     }
  //   );
  // }

  guardarCambios(): void {
    this.editModal = false;
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
