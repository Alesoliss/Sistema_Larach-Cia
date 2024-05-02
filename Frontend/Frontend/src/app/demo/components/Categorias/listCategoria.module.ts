import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ToolbarModule } from 'primeng/toolbar';

import { CategoriaListadoComponent } from './listCategoria.component';

@NgModule({
    declarations: [CategoriaListadoComponent],
    imports: [
        CommonModule,
        ToolbarModule
    ]
})
export class CategoriaListadoModule { }
