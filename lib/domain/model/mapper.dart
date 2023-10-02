abstract class Mapper<I, O> {
  O from(I input);

  I to(O output);
}
