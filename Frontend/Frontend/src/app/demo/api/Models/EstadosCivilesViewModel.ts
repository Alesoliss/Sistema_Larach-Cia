export class EstadosCivilesViewModel {
    estad_Id!: number;
    estad_Descripcion!: string;
    estad_UsuarioCreacion!: number;
    estad_FechaCreacion!: Date;
    estad_UsuarioModificacion?: number | null;
    estad_FechaModificacion?: Date | null;
    estad_Estado?: boolean | null;
    usuarioCreacion?: string;
    usuarioModificacion?: string;
}
