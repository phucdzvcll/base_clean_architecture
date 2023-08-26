abstract class Mapper<I, O> {
  O map(I input);

  List<O> mapList(List<I> inputs) {
    List<O> outPuts = [];
    for (var element in inputs) {
      outPuts.add(map(element));
    }
    return outPuts;
  }
}
