from fastapi import APIRouter

router = APIRouter(prefix="/1/health_check", tags=["health_check"])


@router.get("/", response_description="Trueを返却します。")
async def get():
    """
    ALBヘルスチェック用APIです。
    """

    return True
