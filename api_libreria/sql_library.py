import pymysql


def mysql_connect():
    conn = pymysql.connect(host='db-mysql', port=3306, user='api_user', password='api_user', db='api_demo', charset='utf8',
                           use_unicode=True, cursorclass=pymysql.cursors.DictCursor)
    return conn


def mysql_select(query, params=None):
    conn = mysql_connect()
    with conn.cursor() as cursor:
        try:
            cursor.execute(query, params)
            data = cursor.fetchall()
        except Exception as _:
            data = []
    fetched = True if len(data) > 0 else False
    return fetched, data


def mysql_alter(query, params=None):
    conn = mysql_connect()
    with conn.cursor() as cursor:
        try:
            cursor.execute(query, params)
            conn.commit()
            last_row = cursor.lastrowid
            commited = True
        except Exception as error:
            conn.rollback()
            commited = False
            last_row = error
    return commited, last_row
