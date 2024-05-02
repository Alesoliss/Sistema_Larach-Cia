import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ToolbarModule } from 'primeng/toolbar';

import { DepartamentosListadoComponent } from './listRol.component';

@NgModule({
    declarations: [DepartamentosListadoComponent],
    imports: [
        CommonModule,
        ToolbarModule
    ]
})
export class DepartamentosListadoModule { }
