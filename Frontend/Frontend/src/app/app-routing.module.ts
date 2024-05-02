import { RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';
import { NotfoundComponent } from './demo/components/notfound/notfound.component';
import { AppLayoutComponent } from "./layout/app.layout.component";
import { LoginComponent } from './demo/components/Login/login.component';
import { DepartamentosListadoComponent } from "./demo/components/Departamentos/list.component";
import { CargosListadoComponent } from "./demo/components/Cargos/listCargo.component";
import { CategoriaListadoComponent } from './demo/components/Categorias/listCategoria.component';
import { EstadoCivilListadoComponent } from './demo/components/EstadosCiviles/listEstado.component';
import { ImpuestoListadoComponent } from './demo/components/Impuestos/listImpuesto.component';
import { MetodoPagoListadoComponent } from './demo/components/MetodosPago/listMetodopago.component';
import { MunicipioListadoComponent } from './demo/components/Municipios/listMunicipios.component';
import { UsuarioListadoComponent } from './demo/components/Usuarios/listUsuarios.component';
import { UnidadesListadoComponent } from './demo/components/Unidades/listUnidad.component';
import { RolesListadoComponent } from './demo/components/Roles/listRol.component';
import { ListDemoComponent } from './demo/components/uikit/list/listdemo.component';



@NgModule({
    imports: [
        RouterModule.forRoot([
            {
                path: '', component: LoginComponent 
            },
            {
                path: 'app', component: AppLayoutComponent,
                children: [
                    { path: 'Principal',  component:ListDemoComponent},
                    { path: 'dashboard', loadChildren: () => import('./demo/components/dashboard/dashboard.module').then(m => m.DashboardModule) },
                    { path: 'uikit', loadChildren: () => import('./demo/components/uikit/uikit.module').then(m => m.UIkitModule) },
                    { path: 'utilities', loadChildren: () => import('./demo/components/utilities/utilities.module').then(m => m.UtilitiesModule) },
                    { path: 'documentation', loadChildren: () => import('./demo/components/documentation/documentation.module').then(m => m.DocumentationModule) },
                    { path: 'blocks', loadChildren: () => import('./demo/components/primeblocks/primeblocks.module').then(m => m.PrimeBlocksModule) },
                    { path: 'pages', loadChildren: () => import('./demo/components/pages/pages.module').then(m => m.PagesModule) },
                    { path: 'departamentos', component: DepartamentosListadoComponent }, 
                    { path: 'cargos', component: CargosListadoComponent }, 
                    { path: 'categoria', component: CategoriaListadoComponent }, 
                    { path: 'EstadoCivil', component: EstadoCivilListadoComponent }, 
                    { path: 'Impuesto', component: ImpuestoListadoComponent }, 
                    { path: 'metodoPago', component: MetodoPagoListadoComponent }, 
                    { path: 'municipio', component: MunicipioListadoComponent },
                    { path: 'usuario', component: UsuarioListadoComponent }, 
                    { path: 'unidad', component: UnidadesListadoComponent },
                    { path: 'rol', component: RolesListadoComponent },
                     
                ]
            },
            { path: 'auth', loadChildren: () => import('./demo/components/auth/auth.module').then(m => m.AuthModule) },
            { path: 'landing', loadChildren: () => import('./demo/components/landing/landing.module').then(m => m.LandingModule) },
            { path: 'notfound', component: NotfoundComponent },
            { path: '**', redirectTo: '/notfound' },
        ], { scrollPositionRestoration: 'enabled', anchorScrolling: 'enabled', onSameUrlNavigation: 'reload' })
    ],
    exports: [RouterModule]
})
export class AppRoutingModule {
}



// import { RouterModule, Routes } from '@angular/router';
// import { NgModule } from '@angular/core';
// import { NotfoundComponent } from './demo/components/notfound/notfound.component';
// import { AppLayoutComponent } from "./layout/app.layout.component";
// import { LoginComponent } from './demo/components/Login/login.component';
// import { DepartamentosListadoComponent } from "./demo/components/Departamentos/list.component";
// import { CargosListadoComponent } from "./demo/components/Cargos/listCargo.component";
// import { CategoriaListadoComponent } from './demo/components/Categorias/listCategoria.component';
// import { EstadoCivilListadoComponent } from './demo/components/EstadosCiviles/listEstado.component';
// import { ImpuestoListadoComponent } from './demo/components/Impuestos/listImpuesto.component';
// import { MetodoPagoListadoComponent } from './demo/components/MetodosPago/listMetodopago.component';
// import { MunicipioListadoComponent } from './demo/components/Municipios/listMunicipios.component';
// import { UsuarioListadoComponent } from './demo/components/Usuarios/listUsuarios.component';
// import { UnidadesListadoComponent } from './demo/components/Unidades/listUnidad.component';
// import { RolesListadoComponent } from './demo/components/Roles/listRol.component';

// const routes: Routes = [
//     { path: 'login', component: LoginComponent }, // Ruta para el componente de inicio de sesión
//     {
//         path: '', component: AppLayoutComponent, children: [
//             { path: '', loadChildren: () => import('./demo/components/dashboard/dashboard.module').then(m => m.DashboardModule) },
//             { path: 'uikit', loadChildren: () => import('./demo/components/uikit/uikit.module').then(m => m.UIkitModule) },
//             { path: 'utilities', loadChildren: () => import('./demo/components/utilities/utilities.module').then(m => m.UtilitiesModule) },
//             { path: 'documentation', loadChildren: () => import('./demo/components/documentation/documentation.module').then(m => m.DocumentationModule) },
//             { path: 'blocks', loadChildren: () => import('./demo/components/primeblocks/primeblocks.module').then(m => m.PrimeBlocksModule) },
//             { path: 'pages', loadChildren: () => import('./demo/components/pages/pages.module').then(m => m.PagesModule) },
//             { path: 'departamentos', component: DepartamentosListadoComponent }, 
//             { path: 'cargos', component: CargosListadoComponent }, 
//             { path: 'categoria', component: CategoriaListadoComponent }, 
//             { path: 'EstadoCivil', component: EstadoCivilListadoComponent }, 
//             { path: 'Impuesto', component: ImpuestoListadoComponent }, 
//             { path: 'metodoPago', component: MetodoPagoListadoComponent }, 
//             { path: 'municipio', component: MunicipioListadoComponent },
//             { path: 'usuario', component: UsuarioListadoComponent }, 
//             { path: 'unidad', component: UnidadesListadoComponent },
//             { path: 'rol', component: RolesListadoComponent }, 
//         ]
//     },
//     { path: 'auth', loadChildren: () => import('./demo/components/auth/auth.module').then(m => m.AuthModule) },
//     { path: 'landing', loadChildren: () => import('./demo/components/landing/landing.module').then(m => m.LandingModule) },
//     { path: 'notfound', component: NotfoundComponent },
//     { path: '**', redirectTo: '/notfound' },
// ];

// @NgModule({
//     imports: [
//         RouterModule.forRoot(routes, { scrollPositionRestoration: 'enabled', anchorScrolling: 'enabled', onSameUrlNavigation: 'reload' })
//     ],
//     exports: [RouterModule]
// })
// export class AppRoutingModule { }
