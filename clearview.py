# -----------------------
# Author: Clearview Project Team
# Date: 2024-06-01
# Purpose: This file is the main file for the Clearview project. It will be used to run the Clearview project.
# -----------------------

# -----------------------
# Import Libraries
# -----------------------
import os
import mysql.connector
from color import * # done
from frame_size import * # done
from new_window_screen import * # done
# TODO
from fastener import * #
from measurement import *
from mesh import *
from mirage_3500 import *
from mirage_mesh import *
from nws_measurement import *
from rainier_act import *
from rainier_color import *

try:
    import streamlit as st

except ImportError or ModuleNotFoundError:
    os.system('pip install streamlit')
    import streamlit as st
    
# -----------------------
# Database Connection
# -----------------------
# Clearview Database Connection
clearview = mysql.connector.connect(
    host="localhost",
    user="clearview",
    password="CView24",
    database='clearview'
)
# Clearview Cursor
cvcursor = clearview.cursor()

# -----------------------
# Class Initialization
# -----------------------
color = color(cvcursor, clearview)
frame_size = frame_size(cvcursor, clearview)
new_window_screen = new_window_screen(cvcursor, clearview)
fastener = fastener(cvcursor,clearview)

# -----------------------
# Main Program
# -----------------------

# drop down for color options for insert, update, and delete
color_options = st.selectbox('Please select an option for the Color Table: ', 
                                ('Choose an option','View', 'Insert', 'Update', 'Delete'))

if color_options == 'Insert':
    color_choice = st.text_input('Please enter a color: ')
    color_button = st.button('Insert Color', key=1)

    if color_button:
        color.insert_color(color_choice)
        st.write('successful')

elif color_options == 'View':
    st.write(color.display_color())

elif color_options == 'Update':
    st.write(color.display_color())

    color_id = st.text_input('Please enter the color id: ')
    color_choice = st.text_input('Please enter a color: ')

    color_button = st.button('Update Color', key=2)

    if color_button:
        color.update_color(color_id, color_choice)
        st.write('successful')

elif color_options == 'Delete':
    st.write(color.display_color())

    color_id = st.text_input('Please enter the color id: ')

    color_button = st.button('Delete Color', key=3)

    if color_button:
        color.delete_color(color_id)
        st.write('successful')
        
# Frame_size options
frame_size_options = st.selectbox('Please select an option for the Frame Size Table: ',
                                    ('Choose an option', 'View', 'Insert', 'Update', 'Delete'))

if frame_size_options == 'View':
    st.write(frame_size.display_frame_size())

elif frame_size_options == 'Insert':
    frame_size_choice = st.text_input('Please enter a Frame Size (e.g. 1/16): ')

    frame_button = st.button('Insert Frame Size', key=1)

    if frame_button:
        frame_size.insert_frame_size(frame_size_choice)
        st.write('Frame Size Successfully Inserted')

elif frame_size_options == 'Update':
    st.write(frame_size.display_frame_size())

    frame_size_id = st.text_input('Please enter the Frame Size id: ')
    frame_size_choice = st.text_input('Please enter a New Frame Size: ')

    frame_button = st.button('Update Frame Size', key=2)

    if frame_button:
        frame_size.update_frame_size(frame_size_id, frame_size_choice)
        st.write('Update Successful')

elif frame_size_options == 'Delete':
    st.write(frame_size.display_frame_size())

    frame_size_id = st.text_input('Please enter the frame size id: ')

    frame_button = st.button('Delete Frame Size', key=3)

    if frame_button:
        frame_size.delete_frame_size(frame_size_id)
        st.write('Delete Successful')
        
        
# Section: New_Window_Screen
# INSERT, UPDATE, and DELETE options drop down for new_window_screen
nws_options = st.selectbox('Please select an option for the New Window Screen Table: ', ('Choose an option','View', 'Insert', 'Update', 'Delete'))

if nws_options == 'Insert':
    width_inch = st.text_input('Please enter a new width in inches: ')
    height_inch = st.text_input('Please enter a new height in inches: ')
    nws_insert_button = st.button('Insert New Window Screen', key=1)

    if nws_insert_button:
        new_window_screen.insert_new_window_screen(width_inch, height_inch)
        st.write('Success!')
        
elif nws_options == 'View':
    st.write(new_window_screen.display_new_window_screen())
    
elif nws_options == 'Update':
    st.write(new_window_screen.display_new_window_screen())

    nws_id = st.text_input('Please enter the new window screen id: ')
    width_inch = st.text_input('Please enter a new width in inches: ')
    height_inch = st.text_input('Please enter a new height in inches: ')

    nws_update_button = st.button('Update New Window Screen', key=2)

    if nws_update_button:
        new_window_screen.update_new_window_screen(nws_id, width_inch, height_inch)
        st.write('Update Successful!')
        
elif nws_options == 'Delete':
    st.write(new_window_screen.display_new_window_screen())

    nws_id = st.text_input('Please enter the window screen id: ')

    nws_delete_button = st.button('Delete Window Screen', key=3)

    if nws_delete_button:
        new_window_screen.delete_new_window_screen(nws_id)
        st.write('Successful deletion!')
        
# #######################################
# fastener options
fastener_options = st.selectbox('Please select an option for the Fastener Table: ',) 

if fastener_options == 'Insert':
    fastener_type = st.text_input('Please enter a fastener type: ')
    fastener_button = st.button('Insert Fastener', key=1)

    if fastener_button:
        fastener.insert_fastener(fastener_type)
        st.write('Successful')

elif fastener_options == 'View':
    st.write(fastener.display_fastener())

elif fastener_options == 'Update':
    st.write(fastener.display_fastener())

    fastener_id = st.text_input('Please enter the fastener''s id: ')
    fastener_choice = st.text_input('Please enter a fastener type: ')

    f_update_button = st.button('Update Fastener', key=2)

    if f_update_button:
        fastener.update_fastener(fastener_choice, fastener_id)
        st.write('Successful')

elif color_options == 'Delete':
    st.write(fastener.display_fastener())

    fastener_id = st.text_input('Please enter the fastener''s id: ')

    f_delete_button = st.button('Delete Fastener', key=3)

    if f_delete_button:
        fastener.delete_fastener(fastener_id)
        st.write('Successful Deletion')