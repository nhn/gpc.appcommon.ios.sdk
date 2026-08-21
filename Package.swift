// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GPCAppCommon",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "GPCAppCommon",
            targets: ["_GPCAppCommon"]
        )
    ],
    targets: [
        // >>> GPC-SPM: BINARY_TARGET BEGIN
        .binaryTarget(
            name: "GPCAppCommon",
            url: "https://github.com/nhn/gpc.appcommon.ios.sdk/releases/download/0.5.1/GPCAppCommon-0.5.1.zip",
            checksum: "eeb3b65f16a54c946ba9fca60cfcc08ed9ac2f151242a386837d4548819a5bca"
        ),
        // wrapper target — binaryTarget은 linkerSettings를 가질 수 없으므로
        // 이 target을 경유해 시스템 라이브러리 링크를 선언한다.
        // 언더스코어 접두사: 소비자에게 숨길 수 없는 SPM 제약상(모듈이 항상 노출됨)
        // "내부용" 관례로 표기한다 (_Concurrency 등 Apple 관례와 동일).
        .target(
            name: "_GPCAppCommon",
            dependencies: ["GPCAppCommon"],
            linkerSettings: [
                .linkedLibrary("sqlite3")
            ]
        )
    ]
)
