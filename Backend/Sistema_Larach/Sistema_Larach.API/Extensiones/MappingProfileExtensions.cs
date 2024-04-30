using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Sistema_Larach.Common.Models;
using Sistema_Larach.Entities;

namespace Sistema_Larach.API.Extensiones
{
    public class MappingProfileExtensions : Profile
    {
        public MappingProfileExtensions()
        {
            CreateMap<DepartamentosViewModel, tbDepartamentos>().ReverseMap();
            //CreateMap<ComprasDetalleViewModel, tbComprasDetalle>().ReverseMap();
            //CreateMap<UsuariosViewModel, tbUsuarios>().ReverseMap();


        }
    }
}
