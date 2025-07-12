# Take port as argument
PORT=$1

# Default to 8000 if not set
if [ -z "$PORT" ]; then
    PORT=8000
fi

# Start the service
uvicorn main:app --host 0.0.0.0 --port $PORT