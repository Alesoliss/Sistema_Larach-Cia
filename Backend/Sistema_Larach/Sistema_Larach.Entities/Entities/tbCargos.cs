﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace Sistema_Larach.Entities
{
    public partial class tbCargos
    {
        public tbCargos()
        {
            tbEmpleados = new HashSet<tbEmpleados>();
        }

        public int Cargo_Id { get; set; }
        public string Cargo_Descripcion { get; set; }
        public int Cargo_UsuarioCreacion { get; set; }
        public DateTime Cargo_FechaCreacion { get; set; }
        public int? Cargo_UsuarioModificacion { get; set; }
        public DateTime? Cargo_FechaModificacion { get; set; }
        public bool? Cargo_Estado { get; set; }
        [NotMapped]
        public string UsuarioCreacion { get; set; }
        [NotMapped]
        public string UsuarioModificacion { get; set; }

        public virtual tbUsuarios Cargo_UsuarioCreacionNavigation { get; set; }
        public virtual tbUsuarios Cargo_UsuarioModificacionNavigation { get; set; }
        public virtual ICollection<tbEmpleados> tbEmpleados { get; set; }
    }
}