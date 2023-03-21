# zenn.dev

## How to Use
```sh
make setup
make initialize
make -f article.mk articles/NEW_ARTICLE_NAME_HERE.md
make -f book.mk books/NEW_BOOK_NAME_HERE.md
```

## Note
```sh
git checkout -b ...
make -f article.mk articles/$(git rev-parse --abbrev-ref @).md
mkdir articles/$(git rev-parse --abbrev-ref @)
```