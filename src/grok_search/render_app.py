from starlette.responses import JSONResponse
from starlette.routing import Route

from grok_search.server import mcp


async def healthz(request):
    return JSONResponse({"status": "ok"})


app = mcp.http_app(path="/mcp/", transport="streamable-http")
app.routes.insert(0, Route("/healthz", healthz, methods=["GET", "HEAD"]))
