String getRandomItemFromList(List<String> list) {
  return (list.toList()..shuffle()).first;
}
