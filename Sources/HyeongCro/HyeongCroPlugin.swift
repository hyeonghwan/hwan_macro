
import SwiftSyntaxMacros
import SwiftCompilerPlugin

@main
struct HyeongCroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StringifyMacro.self,
        LoggingMacro.self
    ]
}
