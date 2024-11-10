<h1>Listado de Funciones</h1>
<section class="WWList">
    <table>
        <thead>
            <tr>
                <th>Código de Función</th>
                <th>Descripción de la Función</th>
                <th>Estado de la Función</th>
                <th>Tipo de Función</th>
                <th><a href="index.php?page=Security-FuncionesForm&mode=INS"><i class="fa-solid fa-plus"></i></a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach funciones}}
                <tr>
                    <td>{{fncod}}</td>
                    <td>{{fndsc}}</td>
                    <td>{{fnest == 'ACT' ? 'Activo' : 'Inactivo'}}</td>
                    <td>{{fntyp == 'FNC' ? 'Función' : 'Categoría'}}</td>
                    <td style="display: flex; gap:1rem; justify-content:center; align-items:center;">
                        <a href="index.php?page=Security-FuncionesForm&mode=UPD&fncod={{fncod}}"><i class="fa-solid fa-file-pen"></i></a>
                        <a href="index.php?page=Security-FuncionesForm&mode=DEL&fncod={{fncod}}"><i class="fa-solid fa-trash"></i></a>
                        <a href="index.php?page=Security-FuncionesForm&mode=DSP&fncod={{fncod}}"><i class="fa-solid fa-eye"></i></a>
                    </td>
                </tr>
            {{endfor funciones}}
        </tbody>
    </table>
</section>
