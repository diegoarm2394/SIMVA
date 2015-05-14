<%-- 
    Document   : formCategorias
    Created on : 05-abr-2015, 0:32:20
    Author     : Jairo
--%>

<%@page import="DTO.FuncionarioRolDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CategoriasDao"%>
<%@page import="DTO.CategoriasDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.js"></script>
        <script type="text/javascript" src="../js/additional-methods.js"></script>
        <title>Formulario Categorias</title>
        <%
            HttpSession miSession = request.getSession();
            if (miSession.getAttribute("usuario") != null) {
                FuncionarioRolDto usuario = new FuncionarioRolDto();

                usuario = (FuncionarioRolDto) miSession.getAttribute("usuario");
                String nomUsuario = usuario.getUsuarioLogin();
        %>
    </head>
    <%
        } else {
            response.sendRedirect("/ProyectoSimva/spanish/index-es.jsp");
        }
    %>
    <body>
    <center>
        <h1>LISTADO GENERAL DE CATEGORIAS DE LICENCIAS DE CONDUCCION</h1>
        <h2>SIMVA</h2>
    </center>
    <form name="categoria" action="../../GestionCategorias"  method="post">
        Codigo: <input type="text" name="idCategoria" value="" /></br> </br>
        Nombre: <input type="text" name="descripcionCategoria" value="" />

        <input type="submit" name="boton" value="enviar" />
        <input type="submit" name="boton" value="consultar" />

    </form>

    <%
        if (request.getParameter("Estado") != null) {

            out.print("<h3>" + request.getParameter("Estado") + "</h3>");
        }
    %>

    <h2>Lista Categorias Licencias de Conducción</h2>
    <table border="2">

        <tbody>
            <tr>
                <td>Codigo</td>
                <td>Nombre</td>
                <th>Opciones</th>
                <td> </td>
            </tr>
            <%
                CategoriasDto ObjDtoCate = new CategoriasDto();
                CategoriasDao ObjDaoCate = new CategoriasDao();
                ArrayList<CategoriasDto> listadoCategorias = new ArrayList<CategoriasDto>();
                listadoCategorias = ObjDaoCate.ConsultarCategoriasTodas();

                for (int a = 0; a < listadoCategorias.size(); a++) {

                    out.print("<tr><td>" + listadoCategorias.get(a).getIdCategoria() + "</td>");
                    out.print("<td>" + listadoCategorias.get(a).getDescripcionCategoria() + "</td>");
            %>      
        <td><a href="../../GestionCategorias?boton=Eliminar&pos=<%=listadoCategorias.get(a).getIdCategoria()%>" onclick="return confirmation()">Eliminar</a></td>
        <td><a href="../../GestionCategorias?boton=Actualizar&pos=<%=listadoCategorias.get(a).getIdCategoria()%>" >Actualizar</a></td>
    </tr>

    <script type="text/javascript">

        function confirmation() {
            var elim = confirm('Esta seguro de eliminar la Categoria de la licencia de Conducción ?');
            if (elim) {
                alert("Categoria Licencia de Conduccion Eliminada");
                return true;
            } else {
                alert("Cancelado!");
                return false;
            }
        }

    </script>
    <%}%>
</tbody>
</table>
</body>
</html>
