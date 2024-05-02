export class MunicipiosViewModel {
    munic_Id!: string;
    munic_Descripcion!: string;
    depar_Id!: string;
    munic_UsuarioCreacion!: number;
    munic_FechaCreacion!: Date;
    munic_UsuarioModificacion?: number | null;
    munic_FechaModificacion?: Date | null;
    depar_Descripcion?: string;
    munic_Estado?: boolean | null;
    usuarioCreacion?: string;
    usuarioModificacion?: string;
}
