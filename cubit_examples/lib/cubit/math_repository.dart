class MathRepository {
  int plus(String receivedNumOne, String receivedNumTwo) {
    int numOne = int.parse(receivedNumOne);
    int numTwo = int.parse(receivedNumTwo);
    int newSum = numOne + numTwo;
    return (newSum);
  }

  int multipy(String receivedNumOne, String receivedNumTwo) {
    int numOne = int.parse(receivedNumOne);
    int numTwo = int.parse(receivedNumTwo);
    int newSum = numOne * numTwo;
    return (newSum);
  }
}
