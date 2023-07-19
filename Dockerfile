FROM --platform=linux/x86-64 debian:stable

RUN apt-get update; \
    apt-get install -y \
    g++ \
    cmake \
    git \
    libhdf5-dev \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev

RUN curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash


ENV HOME="/root"
RUN mkdir ${HOME}/.local
ENV PYENV_ROOT="$HOME/.pyenv"
ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${HOME}/.local/bin:${PATH}"
RUN eval "$(pyenv init -)"

RUN pyenv install 3.9.9
RUN pyenv global 3.9.9

RUN pip install pandas; \
    cd ~/openmc; \
    pip install .

RUN pip3 install    flake8==5.0.4 \
                    flake8-docstrings==1.6.0 \
                    black==22.3.0 \
                    docformatter==1.5.0 \
                    pytest==6.2.4 \
                    pytest-cov==3.0.0 \
                    tables==3.7.0 \
                    pyyaml==6.0 \
                    tqdm==4.64.1 \
                    docformatter==1.5.0 \
                    scikit-learn==1.0.2 \
                    optuna==3.0.4 \
                    sphinx \
                    sphinxcontrib-katex \
                    sphinx-numfig \
                    sphinxcontrib-svg2pdfconverter \
                    sphinx-rtd-theme \
                    sphinx_mdinclude \
                    openpyxl \
                    xmltodict;
