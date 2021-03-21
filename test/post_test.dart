import 'package:test/test.dart';
import 'package:wasteagram/models/post.dart';

void main() {

  DateTime savedDate = DateTime.now();

  Post testPost = Post(
    date: savedDate,
    quantity: 2,
    imageURL: 'test.jpg',
    latitude: 37.7858,
    longitude: -122.406);

  test('Expect date to be $savedDate', () {
    expect(testPost.date, savedDate);
  });

  test('Expect quantity to equal 2', () {
    expect(testPost.quantity, 2);
  });

  test('Expect imageURL to equal test.jpg', () {
    expect(testPost.imageURL, 'test.jpg');
  });
  
  test('Expect latitude to equal 37.7858', () {
    expect(testPost.latitude, 37.7858);
  });

  test('Expect longitude to equal -122.406', () {
    expect(testPost.longitude, -122.406);
  });

}