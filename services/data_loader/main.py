import os
from fastapi import FastAPI
from starlette.responses import JSONResponse
import data_loader

dal_obj = data_loader.DAL(database=os.environ.get('MYSQL_DATABASE', 'DataLoaderDB'),
                          port=os.environ.get('MYSQL_PORT', 3306),
                          host=os.environ.get('MYSQL_HOST', 'localhost'),
                          user=os.environ.get('MYSQL_USER', 'root'),
                          password=os.environ.get('MYSQL_PASSWORD', 'pwd'))

table_name = os.environ.get('TABLE_NAME', 'table1')

app = FastAPI()

@app.get('/get-data')
def get_data():
    query = f'SELECT * FROM {table_name};'
    data = dal_obj.flex_query(query, return_=True)
    return JSONResponse(data)
