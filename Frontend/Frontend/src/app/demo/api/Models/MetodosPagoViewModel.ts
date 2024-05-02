export class MetodosPagoViewModel {
    mtPag_Id!: number;
    mtPag_Descripcion!: string;
    mtPag_UsuarioCreacion!: number;
    mtPag_FechaCreacion!: Date;
    mtPag_UsuarioModificacion?: number | null;
    mtPag_Estado?: boolean | null;
    mtPag_FechaModificacion?: Date | null;
    usuarioCreacion?: string;
    usuarioModificacion?: string;
}
