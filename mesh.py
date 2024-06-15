import pandas as pd
class mesh:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_mesh(self, mesh):
        self.cvcursor.execute('INSERT INTO mesh (mesh_type) VALUES (%s)', (mesh,))
        self.cvconn.commit()

    def select_mesh(self):
        self.cvcursor.execute('SELECT * FROM mesh')
        return self.cvcursor.fetchall()
    
    def display_mesh(self):
        df = pd.DataFrame(self.select_mesh())
        df.columns = ['Mesh Id', 'Mesh']
        return df
    
    def update_mesh(self, mesh_id, mesh):
        self.cvcursor.execute('UPDATE mesh SET mesh_type = %s WHERE mesh_id = %s', (mesh, mesh_id))
        self.cvconn.commit()

    def delete_mesh(self, mesh_id):
        self.cvcursor.execute('DELETE FROM mesh WHERE mesh_id = %s', (mesh_id,))
        self.cvconn.commit()
        
## added code for commit