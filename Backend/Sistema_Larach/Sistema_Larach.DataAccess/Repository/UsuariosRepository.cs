﻿using AHM.Total.Travel.DataAccess.Repositories;
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
using Sistema_Larach.DataAccess.Repository;
using Sistema_Larach.DataAccess;

namespace Sistema_Larach.DataAccess.Repository
{
    public class UsuariosRepository
    {


        public RequestStatus Delete(int Usuar_Id)
        {
            string sql = ScriptDataBase.Usuarios_Delete;

            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Usuar_Id", Usuar_Id);
                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                return new RequestStatus { CodeStatus = result, MessageStatus = "" };
            }

            throw new NotImplementedException();
        }

        public RequestStatus Delete(tbUsuarios item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbUsuarios> Details(int? Usuar_Id)
        {
            string sql = ScriptDataBase.Usuarios_Buscar;

            List<tbUsuarios> result = new List<tbUsuarios>();

            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                var parameters = new { Usuar_Id };
                result = db.Query<tbUsuarios>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public IEnumerable<tbUsuarios> find(int Usuar_Id)
        {
            string sql = ScriptDataBase.Usuarios_Buscar;

            List<tbUsuarios> result = new List<tbUsuarios>();

            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                var parameters = new { Usuar_Id };
                result = db.Query<tbUsuarios>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public tbUsuarios find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbUsuarios item)
        {
            string sql = "[Acce].[SP_Usuarios_Insertar]";

            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                var parameter = new DynamicParameters();
                parameter.Add("@Usuar_Usuario", item.Usuar_Usuario);
                parameter.Add("@Usuar_Contrasena", item.Usuar_Contrasena);
                parameter.Add("@Perso_Id", item.Perso_Id); 
                parameter.Add("@Roles_Id", item.Roles_Id);
                parameter.Add("@Usuar_Admin", item.Usuar_Admin);
                parameter.Add("@Usuar_Tipo", item.Usuar_Tipo); 
                parameter.Add("@Usuar_UsuarioCreacion", 1);
                parameter.Add("@Usuar_FechaCreacion", DateTime.Now);

                var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);

                return new RequestStatus { CodeStatus = result, MessageStatus = "" };
            }
        }



        public IEnumerable<tbUsuarios> List()
        {
            string sql = ScriptDataBase.Usuarios_Listar;
            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbUsuarios>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }
        }




        public IEnumerable<UsuariosViewModel> ListRol()
        {
            string sql = ScriptDataBase.Usuarios_RolDDL;

            List<tbRoles> result = new List<tbRoles>();

            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbRoles>(sql, commandType: CommandType.Text).ToList();

                return result.Select(u => new UsuariosViewModel
                {
                    Roles_Id = u.Roles_Id,
                    Roles_Descripcion = u.Roles_Descripcion

                });
            }
        }



        public IEnumerable<UsuariosViewModel> LisEmpleado()
        {
            string sql = ScriptDataBase.Usuarios_EmpleadoDDL;

            List<tbUsuarios> result = new List<tbUsuarios>();

            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbUsuarios>(sql, commandType: CommandType.Text).ToList();

                return result.Select(u => new UsuariosViewModel
                {
                    Emple_Id = u.Emple_Id,
                    empleado = u.empleado

                });
            }
        }
        public tbUsuarios Login(string Usuario, string Contra)
        {
            string sql = ScriptDataBase.Usuarios_Login;

            List<tbUsuarios> result = new List<tbUsuarios>();

            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                var parameters = new { @Usuario = Usuario, @Contrasena = Contra };
                result = db.Query<tbUsuarios>(sql, parameters, commandType: CommandType.StoredProcedure).ToList();

                var list = new tbUsuarios();

                if(result.Count > 0)
                {
                    list = result.First();
                }

                return list;
            }
        }

        public RequestStatus Update(tbUsuarios item)
        {
            try
            {
                string sql = "Acce.SP_Usuarios_Modificar"; 

                using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
                {
                    var parameter = new DynamicParameters();
                    parameter.Add("@Usuar_Id", item.Usuar_Id);
                    parameter.Add("@Usuar_Usuario", item.Usuar_Usuario);
                    parameter.Add("@Perso_Id", item.Perso_Id);
                    parameter.Add("@Roles_Id", item.Roles_Id);
                    parameter.Add("@Usuar_Admin", item.Usuar_Admin);
                    parameter.Add("@Usuar_Tipo", item.Usuar_Tipo); 
                    parameter.Add("@Usuar_UsuarioModificacion", 1);
                    parameter.Add("@Usuar_FechaModificacion", DateTime.Now);

                    var result = db.Execute(sql, parameter, commandType: CommandType.StoredProcedure);
                    return new RequestStatus { CodeStatus = result, MessageStatus = "" };
                }
            }
            catch (Exception ex)
            {
                // Manejo de errores
                return new RequestStatus { CodeStatus = -1, MessageStatus = ex.Message };
            }
        }

        public RequestStatus InsertarCodigo(string codigo, int id)
        {
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Usua_Codigo", codigo);
                parametro.Add("Usua_Id", id);


                var result = db.Execute(ScriptDataBase.Usuarios_Codigo,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";

                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public IEnumerable<tbUsuarios> SiExisteCodigo(string codigo)
        {


            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                var parameters = new { Usua_CodigoVerificacion = codigo };
                result = db.Query<tbUsuarios>(ScriptDataBase.Usuario_MostrarCodigo, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public IEnumerable<tbUsuarios> ValidarReestablecer(string usuario)
        {


            List<tbUsuarios> result = new List<tbUsuarios>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                var parameters = new { Usua_Usuario = usuario };
                result = db.Query<tbUsuarios>(ScriptDataBase.Usuarios_ValidarReestablecer, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public RequestStatus RestablecerContra(tbUsuarios item)
        {
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("@Usuar_Id", item.Usuar_Id);
                parametro.Add("@Usuar_Contrasena", item.Usuar_Contrasena);

                var result = db.Execute(ScriptDataBase.Usua_Restablecer,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

    }
}
