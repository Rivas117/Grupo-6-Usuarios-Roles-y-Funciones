<?php
namespace Controllers\Security;

use Controllers\PublicController;
use Dao\Security\FuncionesD;
use Views\Renderer;
use Utilities\Site;

class FuncionesList extends PublicController {

        public function run(): void{
            $funcionesD=FuncionesD::obtenerFunciones();
            $viewFunciones=[];

            foreach($funcionesD as $funcion){
                $viewFunciones[]=$funcion;
            }
            $viewData=[
                "funciones"=>$viewFunciones
            ];
            Renderer::render('security/funcionesList',$viewData);
        }
}
?>