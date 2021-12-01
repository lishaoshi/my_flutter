class HomeMock {
  int pageSize = 1;
  int pageNo = 10;
  HomeMock({this.pageSize = 10, this.pageNo = 1});

  static Future<List<Map<String, Object>>> list(
      {required int pageNo, required int size}) async {
    return List.generate(size, (index) {
      return {
        'title': '标题${index + (pageNo - 1) * size + 1}：这是一个列表标题，最多两行，多处部分将会被截取',
        'imageUrl':
            'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3331308357,177638268&fm=26&gp=0.jpg',
        'viewCount': 180,
      };
    });
  }
}
