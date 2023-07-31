import 'package:getx_store/models/reviews.dart';

import 'store_provider.dart';

class ReviewRepository {
  StoreProvider storeProvider;

  ReviewRepository({required this.storeProvider});

  List<StoreReviews> readReviews() => storeProvider.readReviews();

  void writeReviews(List<StoreReviews> reviews) =>
      storeProvider.writeReview(reviews);
}
