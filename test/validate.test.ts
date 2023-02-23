import { validateArticle, validateBook } from 'zenn-model/lib/index';
import { Dect } from 'zenn-model/lib/types';
import * as Articles from './dependency/zenn-dev/zenn-editor/packages/zenn-cli/src/server/lib/articles';
import * as Books from './dependency/zenn-dev/zenn-editor/packages/zenn-cli/src/server/lib/books';
import { listFilenames } from './dependency/zenn-dev/zenn-editor/packages/zenn-cli/src/server/lib/helper';

describe('articles', () => {
  const files = listFilenames('articles/')?.filter(file => file.match(/\.md$/))
  const slugs = files?.map(file => file.match(/(.+)\.md/)![1]);

  test('slugs', () => {
    expect(Array.isArray(slugs)).toBe(true);
  });

  slugs?.length && describe.each(slugs)('validate', (slug) => {
    test(`${slug}`, () => {
      const article = Articles.getLocalArticle(slug);
      const result = validateArticle(article as Dect);
      expect(result,).toEqual([])
    });
  });
});

describe('books', () => {
  const files = listFilenames('books/')?.filter(file => file.match(/\.md$/))
  const slugs = files?.map(file => file.match(/(.+)\.md/)![1]);

  test('slugs', () => {
    expect(Array.isArray(slugs)).toBe(true);
  });

  slugs?.length && describe.each(slugs)('validate', (slug) => {
    test(`${slug}`, () => {
      const article = Books.getLocalBook(slug);
      const result = validateArticle(article as Dect);
      expect(result,).toEqual([])
    });
  });
});
