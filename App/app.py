from flask import Flask
from flask_mysqldb import MySQL
from flask_socketio import SocketIO, send, emit

app = Flask(__name__)

app.config.from_pyfile('config.py')
db = MySQL(app)

socketio = SocketIO(app)


from views import *

users = {}

@socketio.on('message')
def handle_message(message):
    print('received message: ' + message)
    send(message, broadcast=True)






if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0')
    #  app.run(debug=True, threaded=True, host='0.0.0.0')
