from flask import Flask, jsonify, request
from werkzeug.security import generate_password_hash, check_password_hash
from waitress import serve

app = Flask(__name__)

user = {
    "admin": generate_password_hash("admin")
}

@app.route("/auth/validate-user", methods=["POST"])
def validate_user():
    user_to_validate = request.json['user']
    password_to_validate = request.json['password']

    if user_to_validate in user and check_password_hash(user.get(user_to_validate), password_to_validate):
        return jsonify({"status": "success"}), 200
    else:
        return jsonify({"status": "failure"}), 403

if __name__ == '__main__':
    #app.run(debug=True, port=5001) útil sólo para el desarrollo
    serve(app, host='0.0.0.0', port=5001)