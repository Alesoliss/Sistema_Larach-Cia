using AHM.Total.Travel.DataAccess.Repositories;
using Microsoft.Data.SqlClient;
using Dapper;
using Sistema_Larach.Common.Models;

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Sistema_Larach.Entities;

namespace Sistema_Larach.DataAccess.Repository
{
    public class ClientesRepository
    {
        public RequestStatus Insert(tbClientes item)
        {
            string sql = "[Gral].[Cliente_Insertar]";

            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@PrimerNombre", item.Clien_PrimerNombre);
                parameter.Add("@SegundoNombre", item.Clien_SegundoNombre);
                parameter.Add("@PrimerApellido", item.Clien_PrimerApellido);
                parameter.Add("@SegundoApellido", item.Clien_SegundoApellido);
                parameter.Add("@Sexo", item.Clien_Sexo);
                parameter.Add("@EstadId", item.Estad_Id);
                parameter.Add("@Telefono", item.Clien_Telefono);
                parameter.Add("@Correo", item.Clien_Correo);
                parameter.Add("@MunicId", item.Munic_Id);
                parameter.Add("@Direccion", item.Clien_Direccion);
                parameter.Add("@UsuarioCreacion", 1);
                parameter.Add("@FechaCreacion", DateTime.Now);
                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);

                return new RequestStatus { CodeStatus = result, MessageStatus = "" };
            }
        }


        public IEnumerable<ClienteViewModel> ListEstadosCiviles()
        {
            string sql = ScriptDataBase.Clientes_EstadoCivilDDL;

            List<tbClientes> result = new List<tbClientes>();

            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbClientes>(sql, commandType: CommandType.Text).ToList();

                return result.Select(u => new ClienteViewModel
                {
                    Estad_Id = u.Estad_Id,
                    Estad_Descripcion = u.Estad_Descripcion
                });
            }
        }



        public IEnumerable<tbClientes> List()
        {
            string sql = ScriptDataBase.ClientesListar;
            List<tbClientes> result = new List<tbClientes>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbClientes>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }
        }


        public IEnumerable<ClienteViewModel> ListMunicipios()
        {
            string sql = ScriptDataBase.Clientes_MunicipioDDL;

            List<tbClientes> result = new List<tbClientes>();

            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbClientes>(sql, commandType: CommandType.Text).ToList();

                return result.Select(u => new ClienteViewModel
                {
                    Munic_Id = u.Munic_Id,
                    Munic_Descripcion = u.Munic_Descripcion
                });
            }
        }



    }
}
