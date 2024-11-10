<form action="index.php?page=Security-FuncionesForm&mode=INS" method="POST">
    <div class="row col-8 offset-2">
        <label for="fncod">Código de Función:</label>
        <input type="text" id="fncod" name="fncod" maxlength="15" required>
    </div>

    <div class="row col-8 offset-2">
        <label for="fndsc">Descripción:</label>
        <input type="text" id="fndsc" name="fndsc" maxlength="100" required>
    </div>

    <div class="form-group">
        <label for="fnest">Estado:</label>
        <select id="fnest" name="fnest" required>
            <option value="ACT">Activo</option>
            <option value="INA">Inactivo</option>
        </select>
    </div>

    <div class="form-group">
        <label for="fntyp">Tipo:</label>
        <select id="fntyp" name="fntyp" required>
            <option value="FNC">Función</option>
            <option value="CTG">Categoría</option>
        </select>
    </div>

    <button type="submit">Crear Función</button>
</form>
