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
from color import *
from frame_size import *
from new_window_screen import * 

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
        
        
# New_Window_Screen Section
# INSERT, UPDATE, and DELETE options drop down for new_window_screen
nws_options = st.selectbox('Please select an option for the New Window Screen Table: ', ('Choose an option','View', 'Insert', 'Update', 'Delete'))

if nws_options == 'Insert':
    nws_choice = st.text_input('Please enter a new window screen title: ')
    nws_insert_button = st.button('Insert New Window Screen', key=1)

    if nws_insert_button:
        new_window_screen.insert_new_window_screen(nws_choice)
        st.write('Process was Successful')