import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ToolbarModule } from 'primeng/toolbar';

import { MetodoPagoListadoComponent } from './listMetodopago.component';

@NgModule({
    declarations: [MetodoPagoListadoComponent],
    imports: [
        CommonModule,
        ToolbarModule
    ]
})
export class CargosListadoModule { }
