import pandas as pd
class color:

     def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_mirage_3500_mesh(self, mesh_id, color_id):
        self.cvcursor.execute('''INSERT INTO mirage_3500_mesh 
                              (mirage_3500_mesh_id, mirage_3500_color_id) 
                              VALUES (
                                (SELECT mirage_3500_mesh_id
                                  FROM mirage_3500_mesh
                                  WHERE mesh_id = ?), 
                                (SELECT mirage_3500_color_id 
                                FROM mirage_3500_color 
                                WHERE color_id = ?)
                              )''',
                              (mesh_id, color_id))
        self.cvconn.commit()
        
    def insert_mirage_3500_color(self, mirage_3500_id, color_id):
        self.cvcursor.execute('''INSERT INTO mirage_3500_color
                              (mirage_3500_id, color_id) 
                              VALUES (
                                (SELECT mirage_3500_id
                                  FROM mirage
                                  WHERE mirage_id = ?), 
                                ?
                              )''',
                              (mirage_3500_id, color_id))
        self.cvconn.commit()

    def select_color(self):
        self.cvcursor.execute('SELECT * FROM color')
        return self.cvcursor.fetchall()
    
    def display_color(self):
        df = pd.DataFrame(self.select_color())
        df.columns = ['Color Id', 'Color']
        return df
    