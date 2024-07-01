import pandas as pd
class nws_measurement:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_nws_measurement(self, measurement_name, width_inch, height_inch, width_fraction, width_plus_minus, height_fraction, height_plus_minus):
        self.cvcursor.execute('''INSERT INTO 
                                nws_measurement 
                                (measurement_id, nws_id, width_fraction, width_plus_minus, height_fraction, height_plus_minus) 
                                VALUES 
                                (
                                    (SELECT measurement_id 
                                    FROM measurement 
                                    WHERE measurement_name = %s), 
                                    (SELECT nws_id 
                                    FROM new_window_screen
                                    WHERE width_inch = %s AND height_inch = %s),
                                    %s,
                                    %s,
                                    %s,
                                    %s
                                )''', 
                                (measurement_name, width_inch, height_inch, width_fraction, width_plus_minus, height_fraction, height_plus_minus))
        self.cvconn.commit()

    def select_nws_measurement(self):
        self.cvcursor.execute('SELECT nws_measurement_id, measurement_name, width_inch, height_inch, width_fraction, width_plus_minus, height_fraction, height_plus_minus FROM measurement m INNER JOIN nws_measurement nm ON m.measurement_id = nm.measurement_id INNER JOIN new_window_screen n ON nm.nws_id = n.nws_id')
        return self.cvcursor.fetchall()
    
    def display_nws_measurement(self):
        df = pd.DataFrame(self.select_nws_measurement())
        df.columns = ['New Window Screen Measurement Id', 'Measurement Name', 'Width Inch', 'Height Inch', 'With Fraction', 'With Plus Minus', 'Height Fraction', 'Height Plus Minus']
        return df
    
    def update_nws_measurement(self, nws_measurement_id, measurement_name, width_inch, height_inch, width_fraction, width_plus_minus, height_fraction, height_plus_minus):
        self.cvcursor.execute('UPDATE nws_measurement SET measurement_id = (SELECT measurement_id FROM measurement WHERE measurement_name = %s), nws_id = (SELECT nws_id FROM new_window_screen WHERE width_inch = %s AND height_inch = %s), width_fraction = %s, width_plus_minus = %s, height_fraction = %s, height_plus_minus = %s WHERE nws_measurement_id = %s', (measurement_name, width_inch, height_inch, width_fraction, width_plus_minus, height_fraction, height_plus_minus, nws_measurement_id))
        self.cvconn.commit()

    def delete_nws_measurement(self, nws_measurement_id):
        self.cvcursor.execute('DELETE FROM nws_measurement WHERE nws_measurement_id = %s', (nws_measurement_id,))
        self.cvconn.commit()
