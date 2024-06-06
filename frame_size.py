import pandas as pd

class frame_size:
    
    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_frame_size(self, frame_size):
        self.cvcursor.execute('INSERT INTO frame_size (size_type) VALUES (%s)', (frame_size,))
        self.cvconn.commit()

    def select_frame_size(self):
        self.cvcursor.execute('SELECT * FROM frame_size')
        return self.cvcursor.fetchall()
    
    def display_frame_size(self):
        df = pd.DataFrame(self.select_frame_size())
        df.columns = ['frame_size Id', 'frame_size']
        return df
    
    def update_frame_size(self, frame_size_id, frame_size):
        self.cvcursor.execute('UPDATE frame_size SET size_type = %s WHERE frame_size_id = %s', (frame_size, frame_size_id))
        self.cvconn.commit()

    def delete_frame_size(self, frame_size_id):
        self.cvcursor.execute('DELETE FROM frame_size WHERE frame_size_id = %s', (frame_size_id,))
        self.cvconn.commit()