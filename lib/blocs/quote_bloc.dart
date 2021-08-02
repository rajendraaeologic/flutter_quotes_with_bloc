abstract class QuoteStatus {
  const QuoteStatus();
}

class QuoteTriggered extends QuoteStatus {
  const QuoteTriggered();
}

class QuoteFetched extends QuoteStatus {
  const QuoteFetched();
}

class FormSubmitted extends QuoteStatus {}

class FormSubmissionFailed extends QuoteStatus {}

class FormFetching extends QuoteStatus {}

class FormFetched extends QuoteStatus {}

class FormFetchedWithError extends QuoteStatus {}
