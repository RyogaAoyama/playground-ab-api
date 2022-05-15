from fastapi import FastAPI

from app.apis.v1 import (
    health_check,
)


def create_app():
    # FastAPI初期化
    app = FastAPI()

    # ルーター設定
    app.include_router(health_check.router)

    return app


app = create_app()
