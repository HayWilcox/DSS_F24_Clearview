import pandas as pd
class color:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_mirage_3500(self, color_id, mesh_id):
        self.cvcursor.execute('''INSERT INTO mirage_3500 
                              (mirage_3500_mesh_id, mirage_3500_color_id) 
                              VALUES (
                                (SELECT mirage_3500_mesh_id
                                  FROM mirage_3500_mesh
                                  WHERE color_id = %s), 
                                (SELECT mesh_3500_color_id 
                                FROM mesh_3500_color 
                                WHERE mesh_id = %s)
                              )'''  ,
                              (color_id, mesh_id))
        self.cvconn.commit()
        

    def select_color(self):
        self.cvcursor.execute('SELECT * FROM color')
        return self.cvcursor.fetchall()
    
    def display_color(self):
        df = pd.DataFrame(self.select_color())
        df.columns = ['Color Id', 'Color']
        return df
    