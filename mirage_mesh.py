import pandas as pd
class color:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_mirage_mesh(self, mirage_build_out, mesh_type):
        self.cvcursor.execute('''INSERT INTO 
                                mirage_mesh 
                                (mirage_id, mesh_id) 
                                VALUES 
                                (
                                    (SELECT mirage_id 
                                    FROM mirage 
                                    WHERE mirage_build_out = %s), 
                                    (SELECT mesh_id 
                                    FROM mesh 
                                    WHERE mesh_type = %s)
                                )''', 
                                (mirage_build_out, mesh_type))
        self.cvconn.commit()

    def select_color(self):
        self.cvcursor.execute('SELECT * FROM color')
        return self.cvcursor.fetchall()
    
    def display_color(self):
        df = pd.DataFrame(self.select_color())
        df.columns = ['Color Id', 'Color']
        return df
    
    def update_color(self, color_id, color):
        self.cvcursor.execute('UPDATE color SET color_name = %s WHERE color_id = %s', (color, color_id))
        self.cvconn.commit()

    def delete_color(self, color_id):
        self.cvcursor.execute('DELETE FROM color WHERE color_id = %s', (color_id,))
        self.cvconn.commit()