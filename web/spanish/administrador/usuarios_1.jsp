<%@page import="java.util.ArrayList"%>
<%@page import="DAO.FuncionarioDao"%>
<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="DTO.FuncionariosDto"%>
<html><!-- InstanceBegin template="/Templates/Template.dwt" codeOutsideHTMLIsLocked="false" -->
    <head>
        <meta charset="utf-8">
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>Gestión de usuarios</title>
        <!-- InstanceEndEditable -->

        <link href="../css/lib/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
        <link href="../css/bootstrap/bootstrap-overrides.css" rel="stylesheet" type="text/css"/>
        <link href="../css/compiled/datatables.css" rel="stylesheet" type="text/css"/>
        <link type="text/css" rel="stylesheet" href="../css/estilos.css">
        <link type="text/css" rel="stylesheet" href="../css/font-awesome.css">
        <link rel="shortcut icon" href="../img/logos/logo.ico" type="image/x-icon">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />
        <link type="text/css" rel="stylesheet" href="../css/adminTable.css">
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.js"></script>
        <script type="text/javascript" src="../js/additional-methods.js"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
        <script src="../js/jquery.dataTables.js" type="text/javascript"></script>


        <!-- InstanceEndEditable -->
        <%
            HttpSession miSession = request.getSession();
            if (miSession.getAttribute("usuario") != null) {
                FuncionarioRolDto usuario = new FuncionarioRolDto();

                usuario = (FuncionarioRolDto) miSession.getAttribute("usuario");
                String nomUsuario = usuario.getUsuarioLogin();
        %>


    </head>
    <header>
        <div id="logo" title="Logo SIMVA">
            <img src="../img/logos/logo.png" alt="logo" width="110" height="110" />
        </div>	
        <div id="texto">
            <p id="h1"> SIMVA <br />  </p>
            <p id="h2"> Sistema de información de Control y Mantenimiento de Vehículos Automotores </p>
        </div>
        <div id="logo2" title="Logo Ejercito Nacional">
            <img src="../img/logos/logo2.png" alt="logodos" width="110" height="110" />
        </div>
        <!-- InstanceBeginEditable name="user" -->
        <div id="user" title="Esta conectado como Administrador"> Admin
            <!-- InstanceEndEditable -->
            <span class="fa fa-user fa-3x"> </span>
            <span class="trianguloar"></span>
        </div>
    </header>
    <%
        } else {
            response.sendRedirect("/ProyectoSimva/spanish/index-es.jsp");
        }
    %>
    <div id="espacio1"></div>
    <!-- InstanceBeginEditable name="nav" -->

    <nav>
        <a href="../administrador.jsp" title="Menu principal"><span class="fa fa-home fa-1x"></span>Inicio</a>
        <a href="usuarios.jsp" title="Gestión de usuarios"><span class="fa fa-users fa-1x"> Gestión de usuarios</a>
        <a href="menu2.jsp" title="Herramientas Administrativas"><span class="fa fa-gears fa-1x"> Herramientas Administrativas</a>
        <a href="asignacionPriv.jsp" title="Asignación de privilegios"><span class="fa fa-user fa-1x"> Asignación de privilegios</a>
        <a href="../index-es.jsp" title="Cerrar sección"><span class="fa fa-sign-in fa-1x"></span>Desconectar</a>
    </nav>
    <!-- InstanceEndEditable -->

    <div id="espacio2"></div>
    <!-- InstanceBeginEditable name="Body" -->
    <body>
        <section>
            <div id="area"> 

                <div id="miga">
                    <br>
                    <ol class="breadcrumb">
                        <li><a href="../administrador.jsp">Inicio</a></li>
                        <li class="active">Gestión de usuarios</li>   
                    </ol>
                </div>  

                <%
                    FuncionarioRolDto ObjDtoF = new FuncionarioRolDto();
                    FuncionarioDao ObjDaoF = new FuncionarioDao();

                    ArrayList<FuncionarioRolDto> listado = new ArrayList<FuncionarioRolDto>();
                    listado = ObjDaoF.ConsultarTodos();
                %>          

                <div class="content">

                    <div id="pad-wrapper table1" class="datatables-page">

                        <div class="row">
                            <div class="col-md-12">

                                <table cellpadding="1" cellspacing="1" id="example" class="table table-hover table-bordered table-striped">
                                    <thead> 
                                        <tr>
                                            <th tabindex="0" rowspan="1" colspan="1"><h5>No.</h5>
                                            </th>
                                            <th tabindex="0" rowspan="1" colspan="1"><h5>Rol</h5>
                                            </th>
                                            <th tabindex="0" rowspan="1" colspan="1"><h5>No. Documento</h5>
                                            </th>                                
                                            <th tabindex="0" rowspan="1" colspan="1"><h5>Nombre de Usuario</h5>
                                            </th>
                                            <th tabindex="0" rowspan="1" colspan="1"><h5>Contraseña</h5>
                                            </th>
                                            <th tabindex="0" rowspan="1" colspan="1"><h5>Fecha de Creacion</h5>
                                            </th>
                                            <th tabindex="0" rowspan="1" colspan="1"><h5>Opciones</h5>
                                            </th>
                                        </tr>
                                    </thead>

                                    <tbody

                                        <%
                                            int idRol = 0;
                                            String idRol2 = "";
                                            for (int a = 0; a < listado.size(); a++) {

                                                idRol = listado.get(a).getIdRol();

                                                if (idRol == 100) {
                                                    idRol2 = "Administrador";
                                                    out.print("<tr><td>" + listado.get(a).getIdFuncionarioRol() + "</td>");
                                                    out.print("<td>" + idRol2 + "</td>");
                                                    out.print("<td>" + listado.get(a).getNumeroDocumento() + "</td>");
                                                    out.print("<td>" + listado.get(a).getUsuarioLogin() + "</td>");
                                                    out.print("<td>" + listado.get(a).getContraseña() + "</td>");
                                                    out.print("<td>" + listado.get(a).getFechaCreacion() + "</td>");
                                                } else if (idRol == 200) {
                                                    idRol2 = "Asignacion";
                                                    out.print("<tr><td>" + listado.get(a).getIdFuncionarioRol() + "</td>");
                                                    out.print("<td>" + idRol2 + "</td>");
                                                    out.print("<td>" + listado.get(a).getNumeroDocumento() + "</td>");
                                                    out.print("<td>" + listado.get(a).getUsuarioLogin() + "</td>");
                                                    out.print("<td>" + listado.get(a).getContraseña() + "</td>");
                                                    out.print("<td>" + listado.get(a).getFechaCreacion() + "</td>");
                                                } else if (idRol == 300) {
                                                    idRol2 = "Mantenimiento";
                                                    out.print("<tr><td>" + listado.get(a).getIdFuncionarioRol() + "</td>");
                                                    out.print("<td>" + idRol2 + "</td>");
                                                    out.print("<td>" + listado.get(a).getNumeroDocumento() + "</td>");
                                                    out.print("<td>" + listado.get(a).getUsuarioLogin() + "</td>");
                                                    out.print("<td>" + listado.get(a).getContraseña() + "</td>");
                                                    out.print("<td>" + listado.get(a).getFechaCreacion() + "</td>");
                                                } else if (idRol == 400) {
                                                    idRol2 = "Consulta";
                                                    out.print("<tr><td>" + listado.get(a).getIdFuncionarioRol() + "</td>");
                                                    out.print("<td>" + idRol2 + "</td>");
                                                    out.print("<td>" + listado.get(a).getNumeroDocumento() + "</td>");
                                                    out.print("<td>" + listado.get(a).getUsuarioLogin() + "</td>");
                                                    out.print("<td>" + listado.get(a).getContraseña() + "</td>");
                                                    out.print("<td>" + listado.get(a).getFechaCreacion() + "</td>");
                                                } else if (idRol == 500) {
                                                    idRol2 = "Conductor";
                                                    out.print("<tr><td>" + listado.get(a).getIdFuncionarioRol() + "</td>");
                                                    out.print("<td>" + idRol2 + "</td>");
                                                    out.print("<td>" + listado.get(a).getNumeroDocumento() + "</td>");
                                                    out.print("<td>" + listado.get(a).getUsuarioLogin() + "</td>");
                                                    out.print("<td>" + listado.get(a).getContraseña() + "</td>");
                                                    out.print("<td>" + listado.get(a).getFechaCreacion() + "</td>");
                                                }

                                        %>
                                                    <td>&nbsp;<a href="../../GestionUsuarios?boton=Eliminar&pos=<%=listado.get(a).getIdFuncionarioRol()%>" onclick="return confirmation()" title=" Eliminar a <%=listado.get(a).getUsuarioLogin()%>">  <img  src="../img/del.png" width="14" height="14" alt="del"/></a>
                                                        &nbsp;&nbsp;<a href="usuarios_3.jsp?pos=<%=listado.get(a).getNumeroDocumento()%>" >  <img src="../img/upd.png" width="14" height="14" alt="upd"/>
                                                        </a> </td> </tr> 
                                            </div>
                                                        <%
                                                            String Mensaje = (String) request.getAttribute("mensaje");
                                                            if (request.getAttribute("mensaje") != null) {
                                                                out.print(Mensaje);

                                                        %>
                                                    <script type="text/javascript"> alert(Estado);</script>  

                    <%                }
                    %>        

                    <script type="text/javascript">
                        function confirmation() {
                            var elim = confirm('esta seguro que desea eliminar este usuario?');
                            if (elim) {
                                alert("Usuario Eliminada");
                                return true;
                            } else {
                                alert("Cancelado!");

                                return false;
                            }
                        }
                    </script>

                    <%}%>
                    </tbody>
                    </div>
                    </div>
                    </div>

                    <script src="../js/jquery-latest.js" type="text/javascript"></script>
                    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
                    <script src="../js/jquery.dataTables.js" type="text/javascript"></script>
                    <script src="../js/theme.js" type="text/javascript"></script>



                    <script type="text/javascript">
                                    $(document).ready(function () {
                                        $('#example').dataTable({
                                            "sPaginationType": "full_numbers"
                                        });
                                    });
                    </script> 


                    <script src="../js/jquery.battatech.excelexport.js" type="text/javascript"></script>

                    <script>
                                    $(document).ready(function () {
                                        $("#botonExportar").click(function () {
                                            $("#example").battatech_excelexport({
                                                containerid: "example",
                                                datatype: 'table'
                                            });
                                        });
                                    });
                    </script>

                    </table>

                <button id="botonExportar" type="button" class="btn btn-info">Exportar</button>
            </section>
        </body>	<!-- InstanceEndEditable -->

        <div id="espacio3"></div>

        <foot>
            <div class="pie">Versión 1.0 | COPYRIGHT   &copy;2014 SIMVA | Contóctenos: 3108549716 | E-mail: contactenos@simva.url.ph</div> 
        </foot>

        <div id="espacio4"></div>

<!-- InstanceEnd --></html>