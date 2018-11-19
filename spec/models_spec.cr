require "./spec_helper"
require "../src/models"

PULL_REQUEST_WITH_LABEL = File.read("./spec/pull_request_with_label.json")
PULL_REQUEST_WITHOUT_LABELS = File.read("./spec/pull_request_without_labels.json")
PULL_REQUEST_WITHOUT_PR_LABEL = File.read("./spec/pull_request_without_pr_labels.json")

describe Models::PullRequestPayload do
  it "parses a pull request payload" do
    Models::PullRequestPayload.from_json(PULL_REQUEST_WITHOUT_LABELS).pull_request.valid?.should be_false
    Models::PullRequestPayload.from_json(PULL_REQUEST_WITHOUT_PR_LABEL).pull_request.valid?.should be_false
    Models::PullRequestPayload.from_json(PULL_REQUEST_WITH_LABEL).pull_request.valid?.should be_true
  end
end
