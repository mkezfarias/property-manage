/* global algoliasearch instantsearch */

const searchClient = algoliasearch('&quot;B1G2GM9NG0&quot;', '&quot;aadef574be1f9252bb48d4ea09b5cfe5&quot;');

const search = instantsearch({
  indexName: 'demo_ecommerce \',
  searchClient,
});

search.addWidgets([
  instantsearch.widgets.searchBox({
    container: '#searchbox',
  }),
  instantsearch.widgets.hits({
    container: '#hits',
    templates: {
      item: `
<article>
  <h1>{{#helpers.highlight}}{ "attribute": "title" }{{/helpers.highlight}}</h1>
  <p>{{#helpers.highlight}}{ "attribute": "name" }{{/helpers.highlight}}</p>
  <p>{{#helpers.highlight}}{ "attribute": "description" }{{/helpers.highlight}}</p>
</article>
`,
    },
  }),
  instantsearch.widgets.pagination({
    container: '#pagination',
  }),
]);

search.start();
