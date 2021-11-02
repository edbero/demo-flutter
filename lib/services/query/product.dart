class Queries {
  String fetchAllProducts() {
    return '''
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
  }
}
