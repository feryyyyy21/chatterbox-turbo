FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/RVC-Boss/GPT-SoVITS.git /app
WORKDIR /app

RUN pip install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir numba==0.56.4 

ENV IS_HALF=False
ENV USE_TURBO=True

EXPOSE 7860

CMD ["python", "webui.py"]
