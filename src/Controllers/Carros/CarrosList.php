<?php

namespace Controllers\Carros;

use Controllers\PrivateController;
use Dao\Carros\Carros;
use Views\Renderer;

class CarrosList extends PrivateController
{
    public function run(): void
    {
        $carrosDao = Carros::obtenerCarros();
        $viewCarros = [];
        $estadosDscArr = [
            "DSP" => "Disponible",
            "RSV" => "Reservado",
            "SLD" => "Vendido"
        ];
        foreach ($carrosDao as $carro) {
            $carro["estadoDsc"] = $estadosDscArr[$carro["estado"]];
            $viewCarros[] = $carro;
        }
        $viewData = [
            "carros" => $viewCarros
        ];

        Renderer::render('carros/carros_list', $viewData);
    }
}