<form action="index.php?page=Security-FuncionesForm&mode={{mode}}" method="POST" style="margin: 10px;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-8">
                <div class="form-group" style="margin-bottom: 10px;">
                    <label for="fncod">Código de Función:</label>
                    <input type="text" id="fncod" name="fncod" maxlength="15" required class="form-control" style="width: 100%; padding-left: 10px;">
                </div>

                <div class="form-group" style="margin-bottom: 10px;">
                    <label for="fndsc">Descripción:</label>
                    <input type="text" id="fndsc" name="fndsc" maxlength="100" required class="form-control" style="width: 100%; padding-left: 10px;">
                </div>

                <div class="form-group" style="margin-bottom: 10px;">
                    <label for="fnest">Estado:</label>
                    <select id="fnest" name="fnest" required class="form-control" style="width: 100%; padding-left: 10px;">
                        <option value="ACT">Activo</option>
                        <option value="INA">Inactivo</option>
                    </select>
                </div>

                <div class="form-group" style="margin-bottom: 10px;">
                    <label for="fntyp">Tipo:</label>
                    <select id="fntyp" name="fntyp" required class="form-control" style="width: 100%; padding-left: 10px;">
                        <option value="FNC">Función</option>
                        <option value="CTG">Categoría</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary btn-block" style="margin-top: 10px;">Crear Función</button>
            </div>
        </div>
    </div>
</form>
