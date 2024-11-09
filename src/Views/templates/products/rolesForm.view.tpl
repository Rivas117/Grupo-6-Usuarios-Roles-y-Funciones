<h1>{{modes_dsc}}</h1>
<section>
    <form action="index.php?page=products-rolesForm&mode{{mode}}&codigo{{rolescod}}" method="post" class="row">
        {{with rol}}
        <div class="row col-8 offset-2">
            <label class="col-4" for="rolescod">Codigo Rol</label>
            <input class="col-8" type="text" name="rolescod" id="rolescod" value="{{rolescod}}" {{readonly}}>
        </div>
        <div class="row col-8 offset-2">
            <label class="col-4" for="rolesdsc">Descripcion del rol</label>
            <input class="col-8" type="text" name="rolesdsc" id="rolesdsc" value="{{rolesdsc}}" {{~readonly}}>
        </div>
        <div class="row col-8 offset-2">
            <label class="col-4" for="rolesest">Estado del rol</label>
            <input class="col-8" type="rolesest" name="rolesest" id="rolesest" value="{{rolesest}}" {{~readonly}}>
        </div>
        <div class="row flex-center">
            {{if ~showConfirm}}
            <button type="submit" class="primary">Confirmar</button> &nbsp;
            {{endif ~showConfirm}}
            <button class="btn" id="btnCancelar">Cancelar</button>
        </div>
        {{endwith rol}}
    </form>
    
</section>