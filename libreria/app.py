from flask import Flask, jsonify

app = Flask(__name__)

libros = [
    {"id": 1, "nombre": "El Senor De Los Anillos La Comunidad Del Anillo", "precio": 20000, "autor": 1, "editorial": "Santillana"},
    {"id": 2, "nombre": "Juego de Tronos (Cancion de Hielo y Fuego #1)", "precio": 10200, "autor": 2, "editorial": "Debolsillo"},
    {"id": 3, "nombre": "Choque de reyes", "precio": 15000, "autor": 2, "editorial": "Debolsillo"},
    {"id": 4, "nombre": "Tormenta de espadas", "precio": 12000, "autor": 2, "editorial": "Debolsillo"},
    {"id": 5, "nombre": "Dune (Las Crónicas de Dune 1)", "precio": 15000, "autor": 3, "editorial": "Debolsillo"}
]

autores = {
    1: {"nombre": "J.R.R. Tolkien"},
    2: {"nombre": "George R.R. Martin"},
    3: {"nombre": "Frank Herbert"}
}

@app.route("/libro", methods=["GET"])
def get_libros():
    
    for libro in libros:
        libro['autor'] = autores.get(libro['autor'])
    
    return jsonify(libros)

@app.route("/libro/<int:libro_id>", methods=["GET"])
def get_libro_by_id(libro_id):

    resultado = None

    for libro in libros:
        if libro['id'] == libro_id:
            resultado = libro
            resultado['autor'] = autores.get(resultado['autor'])
    
    if resultado is None:
        resultado = {"error": f"No se encontraron resultados asociados a la id {libro_id}"}
        estado = 404
    else:
        estado = 200

    return jsonify(resultado), estado


@app.route("/autor/<int:autor_id>", methods=["GET"])
def get_autor(autor_id):

    resultado = autores.get(autor_id)
    
    if resultado is None:
        resultado = {"error": f"No se encontraron resultados asociados a la id {autor_id}"}
        estado = 404
    else:
        estado = 200

    return jsonify(resultado), estado

if __name__ == '__main__':
    app.run(debug=True)
