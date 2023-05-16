<?php
    $mysqliconnect = new mysqli("localhost", "root", "", "sigdb" , "3307");
if ($mysqliconnect->connect_errno) {
    echo "Error al conectar la base de datos: " . $mysqliconnect->connect_error;
    exit();
}   

    $IdCategoria=$_POST['categoria'];
    $Observaciones=$_POST['Observaciones'];
    $serial=$_POST['serial'];
    $fechaGarantia=$_POST['fechaGarantia'];

   $insertar = "insert into existencias VALUES (null,'$IdCategoria', '$Observaciones', '$serial', '$fechaGarantia')";

   

   $resultado = $mysqliconnect->query("SELECT * FROM existencias");
   $resultado = $mysqliconnect->query($insertar);

   if($resultado){
    echo "Datos agregados";
   }else{
    echo "Error al guardar los datos";
   }

   mysqli_close($mysqliconnect);
?>
