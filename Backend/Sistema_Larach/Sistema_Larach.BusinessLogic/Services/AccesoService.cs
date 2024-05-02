﻿using Sistema_Larach.Common.Models;
using Sistema_Larach.DataAccess.Repository;
using Sistema_Larach.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sistema_Larach.BusinessLogic.Services
{
   public class AccesoService
    {
        private readonly UsuariosRepository _usuariosRepository;
        private readonly ClientesRepository _clientesRepository;
        private readonly RolesRepository _rolesRepository;




        public AccesoService(UsuariosRepository usuariosRepository, ClientesRepository
            clientesRepository, RolesRepository rolesRepository)
        {
            _usuariosRepository = usuariosRepository;
            _clientesRepository = clientesRepository;
            _rolesRepository = rolesRepository;

        }

        #region Usuarios
        public ServiceResult Listadousuarios()
        {
            var result = new ServiceResult();
            try
            {
                var list = _usuariosRepository.List();
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }



        public IEnumerable<UsuariosViewModel> ListRol()
        {
            try
            {
                var usuarios = _usuariosRepository.ListRol();
                return usuarios;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"errorrr: {ex.Message}");

                throw;
            }
        }


        public IEnumerable<UsuariosViewModel> ListEmpleado()
        {
            try
            {
                var usuarios = _usuariosRepository.LisEmpleado();
                return usuarios;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"errorrr: {ex.Message}");

                throw;
            }
        }
        public ServiceResult LoginUser(string usuario, string contrasena)
        {
            var result = new ServiceResult();

            try
            {
                var list = _usuariosRepository.Login(usuario, contrasena);
                if(list.Usuar_Id != 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    return result.Error(list);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"errorrr: {ex.Message}");

                throw;
            }
        }


        public IEnumerable<ClienteViewModel> ListEstadosCiviles()
        {
            try
            {
                var usuarios = _clientesRepository.ListEstadosCiviles();
                return usuarios;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"errorrr: {ex.Message}");

                throw;
            }
        }


        public IEnumerable<ClienteViewModel> ListMunicipios()
        {
            try
            {
                var usuarios = _clientesRepository.ListMunicipios();
                return usuarios;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"errorrr: {ex.Message}");

                throw;
            }
        }


        public ServiceResult InsertUsuarios(tbUsuarios item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuariosRepository.Insert(item);
                if (lost.CodeStatus > 0)
                {
                    return result.Ok(lost);
                }
                else
                {
                    return result.Error(lost);
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }



        public ServiceResult InsertClientes(tbClientes item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _clientesRepository.Insert(item);
                if (lost.CodeStatus > 0)
                {
                    return result.Ok(lost);
                }
                else
                {
                    return result.Error(lost);
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }

        public ServiceResult UpdateUsuarios(tbUsuarios item)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuariosRepository.Update(item);
                if (lost.CodeStatus > 0)
                {
                    return result.Ok(lost);
                }
                else
                {
                    return result.Error(lost);
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }


        public ServiceResult DeleteUsuarios(int Usuar_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuariosRepository.Delete(Usuar_Id);
                if (lost.CodeStatus > 0)
                {
                    return result.Ok(lost);
                }
                else
                {
                    return result.Error(lost);
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }

        public ServiceResult CargarUsuarios(int Usuar_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuariosRepository.find(Usuar_Id);

                return result.Ok(lost);

            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }

        public ServiceResult DetallesUsuarios(int Usuar_Id)
        {
            var result = new ServiceResult();
            try
            {
                var lost = _usuariosRepository.Details(Usuar_Id);

                return result.Ok(lost);

            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }
        #endregion



        #region roles
        public ServiceResult ListadoRoles()
        {
            var result = new ServiceResult();
            try
            {
                var list = _rolesRepository.List();
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }

        #endregion

    }
}