FROM amazonlinux:2023.0.20230315.0

RUN dnf install -y \
      man \
      which \
      make \
      less \
      && \
  dnf clean all && \
  rm -rf /var/cache/dnf

RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/usr/local python3 -

WORKDIR /usr/local/lib/tamakiii/zenn.dev/articles/poetry-local-installation

COPY pyproject.toml /usr/local/lib/tamakiii/zenn.dev/articles/poetry-local-installation/pyproject.toml
COPY poetry.lock /usr/local/lib/tamakiii/zenn.dev/articles/poetry-local-installation/poetry.lock
COPY poetry.toml /usr/local/lib/tamakiii/zenn.dev/articles/poetry-local-installation/poetry.toml
COPY Makefile /usr/local/lib/tamakiii/zenn.dev/articles/poetry-local-installation/Makefile

RUN make -C /usr/local/lib/tamakiii/zenn.dev/articles/poetry-local-installation install

COPY . /usr/local/lib/tamakiii/zenn.dev/articles/poetry-local-installation
