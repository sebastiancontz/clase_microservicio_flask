from flask import Flask, jsonify, request
from flask_httpauth import HTTPBasicAuth
from werkzeug.security import generate_password_hash, check_password_hash
import requests
from waitress import serve
import sql_library

app = Flask(__name__)
auth = HTTPBasicAuth()

@auth.verify_password
def verify_password(username, password):
    request = requests.post('http://0.0.0.0:5001/auth/validate-user', json={'user': username, 'password': password})
    if request.status_code == 200:
        return username
    else:
        return None


@app.errorhandler(404)
def not_found_error(error):
    return "<h2><b> Ooops, parece que no hay nada por aca!</b></h2>"


@app.route("/libro", methods=["GET"])
def get_libros():

    query = "SELECT * FROM libros"
    fetched, data = sql_library.mysql_select(query)

    return jsonify(data)


@app.route("/libro/<int:libro_id>", methods=["GET"])
def get_libro_by_id(libro_id):

    query = """
    SELECT 
        * 
    FROM 
        libros 
    WHERE 
        isbn = %(libro_id)s
    """

    params = {"libro_id": libro_id}

    fetched, data = sql_library.mysql_select(query, params)
    if fetched is False:
        resultado = {
            "error": f"No se encontraron resultados asociados a la id {libro_id}"}
        estado = 404
    else:
        resultado = data
        estado = 200

    return jsonify(resultado), estado


@app.route("/editorial", methods=["GET"])
def get_editoriales():

    query = "SELECT * FROM editoriales"
    fetched, data = sql_library.mysql_select(query)

    return jsonify(data)


@app.route("/editorial/<editorial_id>", methods=["GET"])
def get_editorial_by_id(editorial_id):

    query = """
    SELECT 
        * 
    FROM 
        editoriales 
    WHERE 
        codigo = %(editorial_id)s
    """

    params = {"editorial_id": editorial_id}

    fetched, data = sql_library.mysql_select(query, params)
    if fetched is False:
        resultado = {
            "error": f"No se encontraron resultados asociados a la id {editorial_id}"}
        estado = 404
    else:
        resultado = data
        estado = 200

    return jsonify(resultado), estado


@app.route("/autor", methods=["GET"])
def get_autores():

    query = "SELECT * FROM autores"
    fetched, data = sql_library.mysql_select(query)

    return jsonify(data)


@app.route("/autor/<int:autor_id>", methods=["GET"])
def get_autor_by_id(autor_id):

    query = """
    SELECT 
        * 
    FROM 
        autores 
    WHERE 
        id = %(autor_id)s
    """

    params = {"autor_id": autor_id}

    fetched, data = sql_library.mysql_select(query, params)
    if fetched is False:
        resultado = {
            "error": f"No se encontraron resultados asociados a la id {autor_id}"}
        estado = 404
    else:
        resultado = data
        estado = 200

    return jsonify(resultado), estado


@app.route("/topico", methods=["GET"])
def get_topicos():

    query = "SELECT * FROM topicos"
    fetched, data = sql_library.mysql_select(query)

    return jsonify(data)


@app.route("/topico/<topico_id>", methods=["GET"])
def get_topico_by_id(topico_id):

    query = """
    SELECT 
        * 
    FROM 
        topicos 
    WHERE 
        codigo = %(topico_id)s
    """

    params = {"topico_id": topico_id}

    fetched, data = sql_library.mysql_select(query, params)
    if fetched is False:
        resultado = {
            "error": f"No se encontraron resultados asociados a la id {topico_id}"}
        estado = 404
    else:
        resultado = data
        estado = 200

    return jsonify(resultado), estado


@app.route("/admin/add-libro", methods=["POST"])
@auth.login_required
def add_libro():

    titulo = request.json['titulo']
    autor_id = int(request.json['autor_id'])
    tema_id = request.json['tema_id']
    editorial_id = request.json['editorial_id']
    año = int(request.json['año'])
    lugar_de_edicion = request.json['lugar_de_edicion']
    numero_edicion = int(request.json['numero_edicion'])
    precio = int(request.json['precio'])
    cubierta = request.json['cubierta']
    paginas = int(request.json['paginas'])

    query = """
    INSERT INTO 
        libros (
            titulo, 
            fk_autor, 
            fk_temas, 
            fk_editorial, 
            año, 
            lugar_de_edicion, 
            numero_edicion, 
            precio, 
            cubierta, 
            paginas
        )
    VALUES (
        %(titulo)s,
        %(autor_id)s,
        %(tema_id)s,
        %(editorial_id)s,
        %(año)s,
        %(lugar_de_edicion)s,
        %(numero_edicion)s,
        %(precio)s,
        %(cubierta)s,
        %(paginas)s
    )
    """
    params = {
        "titulo": titulo,
        "autor_id": autor_id,
        "tema_id": tema_id,
        "editorial_id": editorial_id,
        "año": año,
        "lugar_de_edicion": lugar_de_edicion,
        "numero_edicion": numero_edicion,
        "precio": precio,
        "cubierta": cubierta,
        "paginas": paginas
    }

    commited, nuevo_libro_id = sql_library.mysql_alter(query, params)

    if commited is True:
        return jsonify({"resultado": f"Se creo el nuevo libro {titulo} con la id {nuevo_libro_id}"}), 200
    else:
        return jsonify({"resultado": f"Falló en la creación de Libro, error en {nuevo_libro_id}"}), 400


@app.route("/libro-detalle/<int:libro_id>", methods=["GET"])
def get_libro_detallado(libro_id):
    query = """
    SELECT
        libros.isbn,
        libros.titulo,
        autores.nombre as 'autor_nombre',
        autores.pais as 'autor_pais_nac',
        autores.ciudad as 'autor_ciudad_nac',
        autores.estudios as 'autor_estudios',
        autores.año_nacimiento as 'autor_año_nac',
        autores.año_fallecimiento as 'autor_año_def',
        topicos.tema,
        editoriales.nombre as 'editorial_nombre',
        editoriales.telefono as 'editorial_telefono',
        editoriales.persona_de_contacto as 'editorial_persona_de_contacto',
        editoriales.direccion as 'editorial_direccion',
        editoriales.ciudad as 'editorial_ciudad',
        libros.año,
        libros.lugar_de_edicion,
        libros.numero_edicion,
        libros.precio,
        libros.cubierta,
        libros.paginas
    FROM
        libros
    INNER JOIN
        autores
    ON
        libros.fk_autor = autores.id
    INNER JOIN
        editoriales
    ON
        libros.fk_editorial = editoriales.codigo
    INNER JOIN
        topicos
    ON
        libros.fk_temas = topicos.codigo
    WHERE
        isbn = %(libro_id)s
    """

    params = {"libro_id": libro_id}

    fetched, data = sql_library.mysql_select(query, params)
    if fetched is False:
        resultado = {
            "error": f"No se encontraron resultados asociados a la id {libro_id}"}
        estado = 404
    else:        
        resultado = data
        estado = 200

    return jsonify(resultado), estado


@app.route("/admin/update-libro/<int:libro_id>", methods=["PATCH"])
@auth.login_required
def update_libro(libro_id):

    if 'campo_a_actualizar' not in request.json:
        return jsonify({"error": "Es necesario especificar el campo que se desea actualizar"}), 400

    campo_a_actualizar = request.json['campo_a_actualizar']
    nuevo_valor = request.json['nuevo_valor']

    query = """
    UPDATE
        libros
    SET 
        %(campo_a_actualizar)s = 
    """

    param_campo = {"campo_a_actualizar": campo_a_actualizar}

    query = query%param_campo + """    
    %(nuevo_valor)s
    WHERE
        isbn = %(libro_id)s
    """
    
    param_campo = {"campo_a_actualizar": campo_a_actualizar}
    params_query = {"nuevo_valor": nuevo_valor, "libro_id": libro_id}

    commited, id_actualizada = sql_library.mysql_alter(query, params_query)

    if commited is True:
        return jsonify({"resultado": f"Se actualizo el campo {campo_a_actualizar} con el valor {nuevo_valor} para el libro id {libro_id}"}), 200
    else:
        return jsonify({"resultado": f"Falló en la actualización del libro, error en {id_actualizada}"}), 400


@app.route("/admin/delete-libro/<int:libro_id>", methods=["DELETE"])
@auth.login_required
def delete_libro(libro_id):

    query = """
    DELETE FROM
        libros
    WHERE
        isbn = %(libro_id)s
    """

    params = {'libro_id': libro_id}

    commited, _ = sql_library.mysql_alter(query, params)

    if commited is True:
        return jsonify({"resultado": f"Se eliminó exitosamente el libro id {libro_id}"}), 200
    else:
        return jsonify({"resultado": f"Falló en la eliminación del libro id {libro_id}, error en {id_eliminada}"}), 400


if __name__ == '__main__':
    #app.run(debug=True, port=5000) útil sólo para el desarrollo
    serve(app, host='0.0.0.0', port=5000)