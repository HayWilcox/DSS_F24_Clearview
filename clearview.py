import os
<<<<<<< HEAD
try: 
    import streamlit as st
except ImportError:
    os.system('pip install streamlit')
    import streamlit as st
    
st.write('Hello World')

# st.latex(r'''
#          a + ar + a r^2 + a r^3 + \cdots + a r^{n-1} =
#     \sum_{k=0}^{n-1} ar^k =
#     a \left(\frac{1-r^{n}}{1-r}\right)
#     ''')
=======

try:
    import streamlit as st

except ImportError:
    os.system('pip install streamlit')
    import streamlit as st


st.write("Hello World")
>>>>>>> 0bf909cdcfe25a41736970fff31563d8130976fb
