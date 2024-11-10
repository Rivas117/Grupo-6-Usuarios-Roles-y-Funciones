<?php

namespace Controllers\Security;
use Controllers\PublicController;
use Dao\Security\FuncionesD;
use Views\Renderer;
use Utilities\Site;

class FuncionesForm extends PublicController {
    private $viewData = [];
    private $modeDscArr = [
        "INS" => "Nueva Función",
        "UPD" => "Editar %s",
        "DSP" => "Detalle de %s",
        "DEL" => "Eliminar %s"
    ];
    private $mode = '';
    private $funcion = [
        "fncod" => "",
        "fndsc" => "",
        "fnest" => "ACT",
        "fntyp" => "FNC"
    ];
    private $readonly = '';
    private $showCommitBtn = true;

    public function run(): void {
        try {
            $this->inicializarForm();
            if ($_SERVER["REQUEST_METHOD"] === "POST") {
                if ($this->validarDatosFormulario($_POST)) {
                    $this->procesarAccion();
                } else {
                    $this->viewData["hasErrors"] = true;
                    $this->viewData["errors"][] = "Datos de formulario inválidos";
                }
            }
            $this->generarViewData();
            Renderer::render("Security/FuncionesForm", $this->viewData);
        } catch (\Exception $ex) {
            Site::redirectToWithMsg("index.php?page=Security-FuncionesList", "Error al procesar la acción");
        }
    }

    private function inicializarForm(): void {
       /* var_dump($this->funcion); // Agrega esto en `inicializarForm` después de cargar la función
exit;*/
        $this->mode = $_GET["mode"] ?? "NOF";
        if (isset($this->modeDscArr[$this->mode])) {
            $this->readonly = $this->mode === "DEL" ? "readonly" : "";
            $this->showCommitBtn = $this->mode !== "DSP";
            if ($this->mode !== "INS") {
                $fncod = $_GET["id"] ?? "";
                $this->funcion = FuncionesD::obtenerFuncionesPorId($fncod);
                if (!$this->funcion) {
                    throw new \Exception("Función no encontrada", 1);
                }
            }
        } else {
            throw new \Exception("Formulario cargado en modalidad inválida", 1);
        }
    }

    private function validarDatosFormulario($post): bool {
        $this->funcion["fncod"] = $post["fncod"] ?? "";
        $this->funcion["fndsc"] = $post["fndsc"] ?? "";
        $this->funcion["fnest"] = $post["fnest"] ?? "";
        $this->funcion["fntyp"] = $post["fntyp"] ?? "";

        $errors = [];
        if (empty($this->funcion["fncod"]) || strlen($this->funcion["fncod"]) > 15) {
            $errors["fncod_error"] = "Código de función es requerido y debe tener máximo 15 caracteres";
        }
        if (empty($this->funcion["fndsc"]) || strlen($this->funcion["fndsc"]) > 45) {
            $errors["fndsc_error"] = "Descripción es requerida y debe tener máximo 45 caracteres";
        }
        if (!in_array($this->funcion["fnest"], ["ACT", "INA"])) {
            $errors["fnest_error"] = "Estado inválido";
        }
        if (!in_array($this->funcion["fntyp"], ["FNC", "CTG"])) {
            $errors["fntyp_error"] = "Tipo inválido";
        }

        if (!empty($errors)) {
            $this->viewData["errors"] = $errors;
            return false;
        }
        return true;
    }

    private function procesarAccion(): void {
        switch ($this->mode) {
            case "INS":
                $this->handleInsert();
                break;
            case "UPD":
                $this->handleUpdate();
                break;
            case "DEL":
                $this->handleDelete();
                break;
            default:
                throw new \Exception("Modo inválido", 1);
        }
    }

    private function handleInsert(): void {
        FuncionesD::agregarFuncion(
            $this->funcion["fncod"],
            $this->funcion["fndsc"],
            $this->funcion["fnest"],
            $this->funcion["fntyp"]
        );
        Site::redirectToWithMsg("index.php?page=Security-FuncionesList", "Función creada exitosamente");
    }

    private function handleUpdate(): void {
        FuncionesD::actualizarFuncion(
            $this->funcion["fncod"],
            $this->funcion["fndsc"],
            $this->funcion["fnest"],
            $this->funcion["fntyp"]
        );
        Site::redirectToWithMsg("index.php?page=Security-FuncionesList", "Función actualizada exitosamente");
    }

    private function handleDelete(): void {
        FuncionesD::eliminarFuncion($this->funcion["fncod"]);
        Site::redirectToWithMsg("index.php?page=Security-FuncionesList", "Función eliminada exitosamente");
    }

    private function generarViewData(): void {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["mode_dsc"] = sprintf($this->modeDscArr[$this->mode], $this->funcion["fncod"]);
        $this->viewData["funcion"] = $this->funcion;
        $this->viewData["readonly"] = $this->readonly;
        $this->viewData["showCommitBtn"] = $this->showCommitBtn;
    }
}
?>
