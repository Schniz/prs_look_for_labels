require "json"

module Models
  struct Label
    JSON.mapping(name: String)

    def pr?
      name.starts_with?("PR: ")
    end
  end

  struct PullRequest
    JSON.mapping(labels: Array(Label), statuses_url: String)

    def valid?
      labels.one? &.pr?
    end
  end

  struct PullRequestPayload
    JSON.mapping(pull_request: PullRequest)
  end
end
