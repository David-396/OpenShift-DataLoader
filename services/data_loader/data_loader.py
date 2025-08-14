import mysql.connector


class DAL:
    def __init__(self, database, port=3306, host="localhost", user="root", password=None):
        self.port = port
        self.host = host
        self.user = user
        self.database = database
        self.password = password


    def flex_query(self, query: str, return_=False):
        try:
            mydb = mysql.connector.connect(
                host=self.host, user=self.user, database=self.database, port=self.port, password=self.password
            )

            mycursor = mydb.cursor()
            mycursor.execute(query)

            returned_vals = []
            if return_:
                returned_vals = mycursor.fetchall()

            mycursor.close()
            mydb.close()

            if return_:
                return returned_vals

        except Exception as e:
            print(e)