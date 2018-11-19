require "json"
require "kemal"
require "http"
require "./markdown_to_html"

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

def create_status(pull_request : Models::PullRequest, payload)
  headers = HTTP::Headers.new
  headers["Content-Type"] = "application/json"
  body = {state: payload[:state], description: payload[:description], context: "pr/labels"}.to_json
  HTTP::Client.post(pull_request.statuses_url, headers: headers, body: body)
end

post "/handle_pull_request" do |env|
  pull_request = Models::PullRequestPayload.from_json(env.request.body.not_nil!).pull_request
  payload =
    if pull_request.valid?
      label_names = pull_request.labels.map(&.name)
      {state: :success, description: "Woohoo! #{label_names.join(", ")}"}
    else
      {state: :pending, description: "Please add `PR: ` labels to the pull request"}
    end
  create_status(pull_request, payload)
end

get "/" do
  MarkdownToHtml.grip("README.md")
end

Kemal.run
