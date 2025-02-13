/// ``TheError`` for unidentified errors.
///
/// ``Unidentified`` error can occur when failure occurs but it is not handled or identified properly.
/// It is ment to be used as a fallback convertion from base ``Error`` inferface to ``TheError``
/// where convertion to concrete instance of ``TheError`` is not possible.
public struct Unidentified: TheError {

	/// Create instance of ``Unidentified`` error.
	///
	/// - Parameters:
	///   - message: Message associated with this error.
	///   Default value is "Unidentified".
	///   - underlyingError: Underlying, unrecognized error.
	///   - file: Source code file identifier.
	///   Filled automatically based on compile time constants.
	///   - line: Line in given source code file.
	///   Filled automatically based on compile time constants.
	/// - Returns: New instance of ``Unidentified`` error with given context.
	public static func error(
		message: StaticString = "Unidentified",
		underlyingError: Error,
		file: StaticString = #fileID,
		line: UInt = #line
	) -> Self {
		Self(
			context: .context(
				message: message,
				file: file,
				line: line
			)
			.with(underlyingError, for: "underlyingError"),
			underlyingError: underlyingError
		)
	}

	/// Source code context of this error.
	public var context: SourceCodeContext
	/// Underlying, unrecognized error if any.
	public var underlyingError: Error
}

extension Error {

	/// Convert the error to ``Unidentified`` error.
	///
	/// `underlyingError` of newly created error will be this error instance.
	///
	/// - Parameters:
	///   - message: Message associated with this error conversion.
	///   Default value is "Unidentified".
	///   - file: Source code file identifier.
	///   Filled automatically based on compile time constants.
	///   - line: Line in given source code file.
	///   Filled automatically based on compile time constants.
	/// - Returns: New instance of ``Unidentified`` error with given context.
	public func asUnidentified(
		message: StaticString = "Unidentified",
		file: StaticString = #fileID,
		line: UInt = #line
	) -> Unidentified {
		.error(
			message: message,
			underlyingError: self,
			file: file,
			line: line
		)
	}
}
