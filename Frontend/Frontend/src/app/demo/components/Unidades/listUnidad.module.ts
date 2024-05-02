import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ToolbarModule } from 'primeng/toolbar';

import { UnidadesListadoComponent } from './listUnidad.component';

@NgModule({
    declarations: [UnidadesListadoComponent],
    imports: [
        CommonModule,
        ToolbarModule
    ]
})
export class DepartamentosListadoModule { }
