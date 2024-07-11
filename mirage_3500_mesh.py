import pandas as pd
class mirage_3500_mesh:

    def __init__(self, cvcursor, cvconn):
      self.cvcursor = cvcursor
      self.cvconn = cvconn

    def insert_mirage_3500_mesh(self, mirage_3500_handle, mesh_type):
        self.cvcursor.execute('''INSERT INTO mirage_3500_mesh 
                              (mirage_3500_id, mesh_id) 
                              VALUES (
                                (SELECT mirage_3500_id
                                  FROM mirage_3500
                                  WHERE mesh_3500_handle = %s), 
                                (SELECT mesh_id
                                FROM mesh
                                WHERE mesh_type = %s)
                              )''',
                              (mirage_3500_handle, mesh_type))
        self.cvconn.commit()
        
def select_mirage_3500_mesh(self):
        self.cvcursor.execute('SELECT mirage_3500_id, mirage_3500_handle, mesh_name FROM mirage_3500_mesh mc INNER JOIN mirage_3500 m ON mc.mirage_3500_id = m.mirage_3500_id INNER JOIN mesh c ON mc.mesh_id = c.mesh_id')
        return self.cvcursor.fetchall()
      
def display_mirage_3500_mesh(self):
        df = pd.DataFrame(self.select_mirage_3500_mesh())
        df.columns = ['Mirage 3500 Mesh Id', 'Mirage 3500 Handle', 'Mesh Name']
        return df
        
def update_mirage_3500_mesh(self, mirage_3500_mesh_id, mirage_3500_handle, mesh_type):
        self.cvcursor.execute('UPDATE mirage_3500_mesh SET mirage_3500_id = (SELECT mirage_3500_id FROM mirage_3500 WHERE mirage_3500_handle = %s), mesh_id = (SELECT mesh_id FROM mesh WHERE mesh_type = %s) WHERE mirage_3500_mesh_id = %s', (mirage_3500_handle, mesh_type, mirage_3500_mesh_id))
        self.cvconn.commit()

def delete_mirage_3500_mesh(self, mirage_3500_mesh_id):
        self.cvcursor.execute('DELETE FROM mirage_3500_mesh WHERE mirage_3500_mesh_id = %s', (mirage_3500_mesh_id,))
        self.cvconn.commit()