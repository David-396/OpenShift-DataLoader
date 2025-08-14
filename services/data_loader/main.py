import uvicorn
from fastapi import FastAPI
from starlette.responses import JSONResponse
from services.data_loader import data_loader

dal_obj = data_loader.DAL(database='DataLoaderDB',port=3306,host='localhost',user='david',password='pwd')

app = FastAPI()

@app.get('/get-data')
def get_data():
    data = dal_obj.flex_query('GET * FROM DataLoaderDB', return_=True)
    return JSONResponse(data)

if __name__ == 'main':
    uvicorn.run(app,host='0.0.0.0',port=8000)