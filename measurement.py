import pandas as pd
import mysql.connector

class Measurement:
    
    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn
    
    def insert_measurement(self, measurement):
        self.cvcursor.execute('INSERT INTO measurement (measurement_name) VALUES (%s)', (measurement,))
        self.cvconn.commit()
        
    def select_measurement(self):
        self.cvcursor.execute("SELECT * FROM measurement")
        return self.cvcursor.fetchall()
        
    def display_color(self):
        df = pd.DataFrame(self.select_measurement())
        df.columns = ['Measurement Id', 'Measurement']
        return df
    
    def update_measurement(self, measurement_id, measurement):
        self.cvcursor.execute('UPDATE measurement SET measurement_name = %s WHERE measurement_id = %s', (measurement, measurement_id))
        self.cvconn.commit()
        
    def delete_measurement(self, measurement_id):
        self.cvcursor.execute('DELETE FROM measurement WHERE measurement_id = %s', (measurement_id,))
        self.cvconn.commit()