import os
import httpx
from dotenv import load_dotenv
from fastapi_proxy_lib.fastapi.app import reverse_http_app

load_dotenv()

# First get the base_url from the environment variable
base_url = os.getenv("BASE_URL")

# Add a trailing slash if not exist
if not base_url.endswith("/"):
    base_url += "/"

# Add a default timeout of 300 seconds
timeout = 300.0

app = reverse_http_app(
    client=httpx.AsyncClient(timeout=timeout),
    base_url=base_url
)