from fastapi import APIRouter

router = APIRouter(prefix="/v1/health-check", tags=["health-check"])


@router.get("/", response_description="Trueを返却します。")
async def get():
    """
    ALBヘルスチェック用APIです。
    """

    return True
