import 'package:eassy_competition/data/models/data_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class DataNotifier extends StateNotifier<DataModel?> {
  DataNotifier() : super(null);

  /// Set signup data
  void setUserData({
    required String name,
    required String id,
    required String email,
    required String batch,
    required String department,
    required String mobile,
  }) {
    state = DataModel(
      name: name,
      id: id,
      email: email,
      batch: batch,
      department: department,
      mobile: mobile,
    );
  }

  /// Update essay text
  void setEssay(String essay) {
    if (state == null) return;
    state = state!.copyWith(essay: essay);
  }

  /// Clear everything after submission
  void clear() {
    state = null;
  }
}

final dataProvider =
    StateNotifierProvider<DataNotifier, DataModel?>(
  (ref) => DataNotifier(),
);
