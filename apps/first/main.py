from flask import Flask, request
import time

app = Flask(__name__)

@app.route('/delay', methods=['GET'])
def delay_response():
    delay = request.args.get('delay', default=5, type=int)
    time.sleep(delay)
    return f"Response after {delay} seconds delay", 200

if __name__ == '__main__':
    app.run(debug=True)