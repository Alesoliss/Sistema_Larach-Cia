import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ToolbarModule } from 'primeng/toolbar';

import { CargosListadoComponent } from './listEstado.component';

@NgModule({
    declarations: [CargosListadoComponent],
    imports: [
        CommonModule,
        ToolbarModule
    ]
})
export class CargosListadoModule { }
