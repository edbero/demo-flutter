String getAllProductsQuery = '''
  query products {
    products(first: 10, channel: "default-channel") {
      edges {
        node {
          id
          name
          description
          thumbnail {
            url
          }
        }
      }
    }
  }
''';

String test = '''
  query projects {
    projects{
      id
      name
      type
      description
      categories{name}
      owner{
        name
        icon_image
      }
    }
  }
''';
