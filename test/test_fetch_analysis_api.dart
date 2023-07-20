// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:virusscanapp/src/data/models/analysis_report/analysis_report_model.dart';
// import 'package:virusscanapp/src/data/providers/remote/get_analysis_report.dart';
// import 'package:virusscanapp/src/utils/end_points.dart';
// import 'package:virusscanapp/src/utils/http_utils.dart';
//
// class MockHttpHelper extends Mock implements HttpHelper {}
//
// void main() {
//   group('GetAnalysisReportProvider', () {
//     late GetAnalysisReportProvider provider;
//     late MockHttpHelper mockHttpHelper;
//
//     setUp(() {
//       mockHttpHelper = MockHttpHelper();
//       provider = GetAnalysisReportProviderImpl(httpHelper: mockHttpHelper);
//     });
//
//     test('Fetch analysis report successfully', () async {
//       final String id = 'your_test_id';
//       final Map<String, dynamic> jsonData = {
//         // Add your test data here as per AnalysisReportModel.fromJson
//         // Example: 'key': 'value'
//       };
//       final HttpResponse httpResponse = HttpResponse(
//         statusCode: 200,
//         body: jsonData,
//       );
//
//       // Mock the HTTP response
//       when(mockHttpHelper.get(any, queryParameters: anyNamed('queryParameters')))
//           .thenAnswer((_) => Future.value(httpResponse));
//
//       // Call the method under test
//       final result = await provider.getAnalysisReport(id: id);
//
//       // Verify the method calls
//       verify(mockHttpHelper.get("${EndPoints.apiAnalysis}/$id==",
//           queryParameters: {"id": id}))
//           .called(1);
//
//       // Verify the result
//       expect(result, isA<AnalysisReportModel>());
//       // Add more assertions based on your test data and expected result
//     });
//
//     // Add more test cases as needed
//   });
// }
