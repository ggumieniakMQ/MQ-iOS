/// ``TheError`` for string encoding failure.
///
/// ``StringEncodingFailure`` error can occur when encoding string fails.
/// It can be caused by characters that are not representable in given encoding or other issue.
public struct StringEncodingFailure: TheError {

	/// Create instance of ``StringEncodingFailure`` error.
	///
	/// - Parameters:
	///   - string: String instance causing the error.
	///   This value will not be collected in release builds.
	///   - encoding: Encoding of string causing the error.
	///   This value will not be collected in release builds.
	///   - message: Message associated with this error.
	///   Default value is "StringEncodingFailure".
	///   - file: Source code file identifier.
	///   Filled automatically based on compile time constants.
	///   - line: Line in given source code file.
	///   Filled automatically based on compile time constants.
	/// - Returns: New instance of ``StringEncodingFailure`` error with given context.
	public static func error(
		for string: String,
		encoding: String.Encoding,
		message: StaticString = "StringEncodingFailure",
		file: StaticString = #fileID,
		line: UInt = #line
	) -> Self {
		Self(
			context: .context(
				message: message,
				file: file,
				line: line
			)
			.with(string, for: "string")
			.with(encoding, for: "encoding")
		)
	}

	/// Source code context of this error.
	public var context: SourceCodeContext
}
