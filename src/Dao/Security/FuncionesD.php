<?php

namespace Dao\Security;

use Dao\Table;

class FuncionesD extends Table {

    public static function obtenerFunciones() {
        $sqlstr = 'SELECT * FROM funciones';
        $funciones = self::obtenerRegistros($sqlstr, []);
        return $funciones;
    }

    public static function obtenerFuncionesPorId($fncod) {
        $sqlstr = 'SELECT * FROM funciones WHERE fncod = :fncod;';
        $funcion = self::obtenerUnRegistro($sqlstr, ["fncod" => $fncod]);
        return $funcion;
    }

    public static function agregarFuncion($fncod, $fndsc, $fnest, $fntyp) {
         // Asegúrate de obtener la instancia de la base de datos correctamente
        $sql = "INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES (:fncod, :fndsc, :fnest, :fntyp)";
    
        // Inicializar el arreglo de datos
        $data = [];
        $data['fncod'] = $fncod;
        $data['fndsc'] = $fndsc;
        $data['fnest'] = $fnest;
        $data['fntyp'] = $fntyp;
    
        
        return self::executeNonQuery($sql, $data);
    }
    

    public static function actualizarFuncion($funcion) {
        unset($funcion['creado']);
        unset($funcion['actualizado']);
        
        $sqlstr = 'UPDATE funciones 
                   SET fndsc = :fndsc, fnest = :fnest, fnexp = :fnexp 
                   WHERE fncod = :fncod;';
        
        return self::executeNonQuery($sqlstr, $funcion);
    }

    public static function eliminarFuncion($fncod) {
        $sqlstr = 'DELETE FROM funciones WHERE fncod = :fncod;';
        return self::executeNonQuery($sqlstr, ["fncod" => $fncod]);
    }
}
