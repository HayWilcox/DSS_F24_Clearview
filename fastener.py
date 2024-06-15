import pandas as pd
class fastener:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_fastener(self, fastener):
        self.cvcursor.execute('INSERT INTO fastener (fastener_type) VALUES (%s)', (fastener,))
        self.cvconn.commit()

    def select_fastener(self):
        self.cvcursor.execute('SELECT * FROM fastener')
        return self.cvcursor.fetchall()
    
    def display_fastener(self):
        df = pd.DataFrame(self.select_fastener())
        df.columns = ['Fastener Id', 'Fastener']
        return df
    
    def update_fastener(self, fastener_id, fastener):
        self.cvcursor.execute('UPDATE color SET fastener_type = %s WHERE fastener_id = %s', (fastener, fastener_id))
        self.cvconn.commit()

    def delete_fastener(self, fastener_id):
        self.cvcursor.execute('DELETE FROM fastener WHERE fastener_id = %s', (fastener_id,))
        self.cvconn.commit()
        
        ## added code to commit