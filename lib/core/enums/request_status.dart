/// The [RequestStatus] enum represents the different states of a network request.
///
/// - [loading] : Indicates that the request is in progress and the application is waiting for a response.
/// - [success] : Indicates that the request was successful and the desired data was obtained.
/// - [error] : Indicates that an error occurred while processing the request.
/// - [init] : Represents the initial state of the request before any action is taken.
///
/// This enum is commonly used in asynchronous operations to track the status of network requests
/// and handle different UI states based on the request's progress and outcome.

enum RequestStatus { loading, success, error, init }
