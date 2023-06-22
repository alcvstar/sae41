from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.secret_key = "pyfoo"
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://bob:bob@172.25.0.2:5432/base'
db = SQLAlchemy(app)

from flask import render_template, request, redirect, session

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        # Traite les données du formulaire d'inscription
        # et enregistre l'utilisateur dans la base de données
        return redirect('/login')
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # Vérifie les informations d'authentification
        # et connecte l'utilisateur
        session['user_id'] = user_id
        return redirect('/dashboard')
    return render_template('login.html')

@app.route('/logout')
def logout():
    # Déconnecte l'utilisateur en supprimant la session
    session.clear()
    return redirect('/')

from functools import wraps
from flask import session, redirect

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            return redirect('/login')
        return f(*args, **kwargs)
    return decorated_function

@app.route('/dashboard')
@login_required
def dashboard():
    # Affichez le tableau de bord de l'utilisateur connecté
    return render_template('dashboard.html')

if __name__ == '__main__':
    db.create_all()
    app.run()
