import streamlit as st
import mysql.connector

clearview = mysql.connector.connect(
    host="localhost",
    user="clearview",
    password="CView24",
    database='clearview'
)

cvcursor = clearview.cursor()

color = st.text_input('Please enter a color: ')
color_button = st.button('Submit', key=1)

if color_button:
    cvcursor.execute('INSERT INTO color (color_name) VALUES (%s)', (color,))
    clearview.commit()
    st.write('successful')