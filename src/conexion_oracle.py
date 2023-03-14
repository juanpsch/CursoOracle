import cx_Oracle

try:
    connection=cx_Oracle.connect(
    user='hr',
    password='hr',
    dsn='10.73.53.178:1522/EJEMPODB',
    encoding='UTF-8'
    )
    print(connection.version)
    cursor=connection.cursor()
    cursor.execute("SELECT * FROM EMPLOYEES")
    rows=cursor.fetchall()
    for row in rows:
        print(row)


except Exception as ex:    
    print(ex)

finally:
    connection.close()
    print("Coneccion Finalizada")