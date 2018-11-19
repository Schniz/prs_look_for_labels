# [PRs: Look for Labels](https://github.com/Schniz/prs_look_for_labels)

Look for PR labels in GitHub pull requests.

## Usage

* Deploy to Heroku
* Create labels with `PR: ` prefix :smile_cat:
* Go to GitHub's project settings
* Click on "Webhooks"
* Click on "Add webhook"
* Fill in `Payload URL` `HEROKU_DEPLOYMENT_URL/handle_pull_request?token=YOUR_GITHUB_TOKEN`.
* Select `application/json` in `Content type`
* Select `Let me select individual events`
* On the list, uncheck `Pushes` and check `Pull requests`
* Click `Add webhook`
* :moneybag:

## Contributing

1. Fork it (<https://github.com/Schniz/prs_look_for_labels/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Schniz](https://github.com/Schniz) Gal Schlezinger - creator, maintainer
