import mysql.connector
import os
import platform
import subprocess

# connect to root user
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="C4nGet1n!",
)

# print(mydb)


# execute the root commands to grant access to the new user
directory = os.getcwd()
# check to see what system I'm using
name = platform.system()
if name == 'Linux' or name == 'Darwin':
    print("Linux or Darwin System Detected")
    filename = f"{directory}/database/setup/root.sql"
    run_git = input("Would you like to run the github desktop script? (y/n): ")
    if run_git == 'y':
        subprocess.run(["bash", f"{directory}/database/setup/github.sh"])
    else:
        print("Skipping github desktop script")
elif name == 'Windows':
    print("Windows System Detected")
    filename = f"{directory}\\setup.sql"
    run_git = input("Would you like to run the github desktop script? (y/n): ")
    if run_git == 'y':
        subprocess.run(["powershell", f"{directory}\\github.ps1"])
    else:
        print("Skipping github desktop script")

with open(filename, 'r+') as file:
    sqlFile = file.read()
    commands = sqlFile.split('-- ~')
    commands = [command.strip() for command in commands]
    for command in commands:
        # print(command)

        try:
            mycursor = mydb.cursor()
            mycursor.execute(command)
            mydb.commit()
        except Exception as e:
            print(e)
            continue

# close the connection
mydb.close()

# connect to the new user
clearview = mysql.connector.connect(
    host="localhost",
    user="clearview",
    password="CView24",
)

clearviewcursor = clearview.cursor()
clearviewcursor.execute("SELECT 'clearview USER EXISTS'")
useroutput = clearviewcursor.fetchall()
clearviewcursor.execute("SHOW DATABASES")
output = clearviewcursor.fetchall()
print(useroutput)
# print the databases
for x in output:
    print(x)

# close the connection
clearview.close()