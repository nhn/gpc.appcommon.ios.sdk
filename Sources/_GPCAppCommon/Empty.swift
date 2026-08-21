// 의도적으로 비어 있는 파일 — 삭제하지 말 것.
//
// SwiftPM은 소스 파일이 하나도 없는 target을 빌드 실패로 처리한다.
//   error: target '_GPCAppCommon' referenced in product 'GPCAppCommon' is empty
//
// _GPCAppCommon은 코드를 담기 위한 target이 아니라 binaryTarget이 가질 수 없는
// linkerSettings(sqlite3)를 붙이기 위한 껍데기다. 언더스코어 접두사는 "내부용,
// import하지 말 것"을 나타내는 관례다 (SPM은 product 내 target 모듈을 숨길 수 없음).
