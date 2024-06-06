
import os
import mysql.connector

try:
    import streamlit as st

except ImportError:
    os.system('pip install streamlit')
    import streamlit as st
    st.write('Hello Team!')

clearview = mysql.connector.connect(
    host = "localhost",
    user="clearview",
    password = "CView24",
)

cvcursor = clearview.cursor()
color = st.text_input('Please enter a color: ')
color_button = st.button('Submit', key =1)

if color_button:
    cvcursor.execute('INSERT INTO color (color_name) VALUES (%s)', (color,))
    clearview.commit()
    st.write(cvcursor.execute('SELECT * FROM color;'))