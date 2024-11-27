class ProductService {
  List<Map<String, dynamic>> products = [
    {
      'nome': 'Produto 1',
      'preco': 50.0,
      'quantidade': 2,
      'descricao': 'Descrição 1',
    },
    {
      'nome': 'Produto 2',
      'preco': 75.0,
      'quantidade': 1,
      'descricao': 'Descrição 2',
    },
  ];

  void addProduct(Map<String, dynamic> product) {
    products.add(product);
  }

  void editProduct(int index, Map<String, dynamic> updatedProduct) {
    products[index] = updatedProduct;
  }

  void deleteProduct(int index) {
    products.removeAt(index);
  }

  List<Map<String, dynamic>> getProducts() {
    return products;
  }
}
