<?php 
namespace Controllers\Products;

use Controllers\PublicController;
use Dao\Products\RolesD;
use Views\Renderer;

class RolesList extends PublicController{
    public function run(): void{
        $rolesD=RolesD::obtenerRoles();
        $viewRoles=[];
        

        foreach($rolesD as $rol){
            $viewrol[]=$rol;
        }
        $viewData=[
            "roles"=>$viewrol
        ];
        Renderer::render('products/rolesList',$viewData);
    }
}

?>