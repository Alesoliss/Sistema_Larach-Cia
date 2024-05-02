export class ImpuestosViewModel {
    impue_Id!: number;
    impue_Descripcion!: number;
    impue_UsuarioCreacion!: number;
    impue_FechaCreacion!: Date;
    impue_UsuarioModificacion?: number | null;
    impue_FechaModificacion?: Date | null;
    impue_Estado?: boolean | null;
    usuarioCreacion?: string;
    usuarioModificacion?: string;
}
