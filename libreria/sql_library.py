import sqlite3
from contextlib import closing

def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d


def db_connect(database='library.db'):
    conn = sqlite3.connect(database)
    conn.row_factory = dict_factory
    return conn


def sql_select(query):
    conn = db_connect()
    cursor = conn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()
    if data != []:
        return True, data
    else:
        return False, data


def sql_insert(query, params=None):
    conn = db_connect()
    cursor = conn.cursor()
    cursor.executemany(query, [params])
    conn.commit()
    last_row_id = cursor.lastrowid
    return last_row_id


#query = "SELECT * FROM libros WHERE isbn = %(libro_id)s"
query = "SELECT * FROM libros"
params = {"libro_id": 1}
fetched, data = sql_select(query)
print(data)


'''
query = """
    INSERT INTO libros ( 
        titulo, 
        autor,
        temas,
        editorial,
        año,
        lugar_de_edicion,
        numero_edicion,
        precio,
        cubierta,
        paginas
        )
    VALUES (
        ?,
        ?,
        ?,
        ?,
        ?,
        ?,
        ?,
        ?,
        ?,
        ?
    )
"""
params = ("Prueba", 15, "FIL", "LAR", 2021, "Chile", 1, 15000, "Blanda", 150)

result = sql_insert(query, params)
print(result)
'''