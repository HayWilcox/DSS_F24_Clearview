import pandas as pd
class rainier:
    #---------------------------------------------------------------------------------------
    # est_placement
    #---------------------------------------------------------------------------------------
    
    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_rainier(self, rainier_id, est_placement):
        self.cvcursor.execute('INSERT INTO rainier (est_placement) VALUES (%s)', (rainier,))
        self.cvconn.commit()

    def select_rainier(self):
        self.cvcursor.execute('SELECT * FROM rainier')
        return self.cvcursor.fetchall()
    
    def display_est_placement(self):
        df = pd.DataFrame(self.select_rainier())
        df.columns = ['Rainier Id', 'Rainier', 'est_placement']
        return df
    
    def update_est_placement(self, rainier_id, rainier):
        self.cvcursor.execute('UPDATE rainier SET est_placement_name = %s WHERE rainier_id = %s', (est_placement, rainier_id))
        self.cvconn.commit()

    def delete_est_placement(self, rainier_id):
        self.cvcursor.execute('DELETE FROM rainier WHERE rainier_id = %s', (rainier_id,))
        self.cvconn.commit()
    
    #---------------------------------------------------------------------------------------
    # est_placement
    #---------------------------------------------------------------------------------------
    def insert_rainier_est(self, rainier, est_placement, est_housing_series, est_drive_side, est_hembar, est_pilebrush, est_brush_location, est_cord_length, est_mount_type, est_top_opening_width, est_left_buildout, est_right_buildout, est_add_buildout, est_left_track, est_right_track):
        self.cvcursor.execute('INSERT INTO rainier (est_placement, est_housing_series, est_drive_side, est_hembar, est_pilebrush, est_brush_location, est_cord_length, est_mount_type, est_top_opening_width, est_left_buildout, est_right_buildout, est_add_buildout, est_left_track, est_right_track) VALUES (%s)', (rainier,))
        self.cvconn.commit()

    def select_rainier_est(self):
        self.cvcursor.execute('SELECT * FROM est_placement, est_housing_series, est_drive_side, est_hembar, est_pilebrush, est_brush_location, est_cord_length, est_mount_type, est_top_opening_width, est_left_buildout, est_right_buildout, est_add_buildout, est_left_track, est_right_track')
        return self.cvcursor.fetchall()
    
    def display_rainier_est(self):
        df = pd.DataFrame(self.select_rainier())
        df.columns = ['Rainier Id', 'Rainier', 'est_placement', 'est_housing_series', 'est_drive_side', 'est_hembar', 'est_pilebrush', 'est_brush_location', 'est_cord_length', 'est_mount_type', 'est_top_opening_width', 'est_left_buildout', 'est_right_buildout', 'est_add_buildout', 'est_left_track', 'est_right_track']
        return df
    
    def update_rainier_est(self, rainier_id, rainier):
        self.cvcursor.execute('UPDATE rainier SET est_placement_name = %s WHERE rainier_id = %s', (est_placement, est_housing_series, est_drive_side, est_hembar, est_pilebrush, est_brush_location, est_cord_length, est_mount_type, est_top_opening_width, est_left_buildout, est_right_buildout, est_add_buildout, est_left_track, est_right_track, rainier_id))
        self.cvconn.commit()

    def delete_rainier_est(self, rainier_id):
        self.cvcursor.execute('DELETE FROM rainier WHERE rainier_id = %s', (rainier_id,))
        self.cvconn.commit()