<%-- 
    Document   : Ciudades
    Created on : 18-mar-2015, 19:24:41
    Author     : Diego
--%>

<%@page import="DAO.CiudadesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.CiudadesDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/jquery.js"></script>
    	<script type="text/javascript" src="../js/jquery.validate.js"></script>
    	<script type="text/javascript" src="../js/additional-methods.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <form name="Ciudades" action="../../GestionCiudades"  method="post">
            IdCiudad: <input type="text" name="idCiudad" value="" /></br> </br>
            Nombre Ciudad: <input type="text" name="nombreCiudad" value="" />
            
            <input type="submit" name="boton" value="enviar" />
            <input type="submit" name="boton" value="consultar" />
            
            
            
           
           
          
           
        </form>
        
        <%
            if(request.getParameter("Estado")!=null){
                
            out.print("<h3>"+request.getParameter("Estado")+"</h3>");
            }
            %>
        
         <h2>Lista Ciudades!</h2>
        <table border="1">
          
            <tbody>
                <tr>
                    <td>idCiudad</td>
                    <td>nombreCiudad</td>
                     <th>Opciones</th>
                     <td> </td>
                </tr>
                
                    
                    <%
                        
                    CiudadesDto ObjDtoC = new CiudadesDto();
                    CiudadesDao ObjDaoC = new CiudadesDao();   
                    ArrayList<CiudadesDto> listado=new ArrayList<CiudadesDto>();
                    listado =ObjDaoC.ConsultarTodos();
              
                    for( int a = 0 ; a <listado.size() ; a++ ){
                        
                    out.print("<tr><td>"+listado.get(a).getIdCiudad()+"</td>");
                    out.print("<td>"+listado.get(a).getNombreCiudad()+"</td>");
                    //out.print("<td><a href='../../GestionCiudades?boton=Eliminar&pos="+listado.get(a).getIdCiudad()+"'>Eliminar</a></td></tr>");
                    %>
            <td><a href="../../GestionCiudades?boton=Eliminar&pos=<%=listado.get(a).getIdCiudad()%>" onclick="return confirmation()">Eliminar</a></td>
            <td><a href="../../GestionCiudades?boton=Actualizar&pos=<%=listado.get(a).getIdCiudad()%>" >Actualizar</a></td>
        </tr>
       
        <script type="text/javascript">

        function confirmation() {
	var elim = confirm('esta seguro de eliminar la ciudad ?');
	if (elim){
		alert("Ciudad Eliminada");
                return true;
	} else{
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
