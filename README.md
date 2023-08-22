# `regal-pr-validator`

This repo defines a Github action that runs Regal, the Rego lintes, on each push to each pull request, and leaves comments at the lines where lint errors are found.

<details>
  <summary>Here is how it looks like.</summary>
  
  ![image](https://github.com/dkorolev/regal-pr-validator/assets/2159447/f23a90a3-6fb9-4be4-827c-16f10f42a5a1)

</details>

It is important to note that the comments will only be left if the pull request is created from a different branch in the same repository.

<details>
  <summary>Why?</summary>

  If a pull request is created from a fork, the token that is granted permissions to leave comments to the PR will not be present in the context of the action that is being run.

  And, somehow, the default `GITHUB_TOKEN`, that is provided to any Github action that is run, does not have the `"Pull Requests"` permission enabled by default.

</details>

  Below please find the instructions on how to enable this functionality in your repo. If you want to understand the underlying details, the [README of this repo](https://github.com/dkorolev/tmp-gh-action-pr-context) has plenty of them.

# Setup

If you want your repository to have the same Github action, that runs Regal same way and leaves the same comments, here are the steps.

First, create a repo.

Second, add the `.yml` Github action definition file into your repo, under `.github/workflows`.

Third, you will need a secret, under the name `COMMENTING_GITHUB_TOKEN`, which is the token that allowed that action the "elevated" permission of leaving comments to the PR.

Here is now to create this token and store it under this repository's secrets:

* "Settings" -> "Developer Settings", [link](https://github.com/settings/apps).
* "Personal Access Tokens" -> "Fine-grained tokens (Beta)", [link](https://github.com/settings/tokens?type=beta).
* Generate a new token.
* Enter OTP if you have it configured (and you better do!)
* "Only select repositories" -> Choose this particular repository.
* "Repository permission" -> "Pull Requests" -> "Read and write".
* "Generate Token", and save it somewhere temporarily.
* Now go to this repo's settings, [example link](https://github.com/dkorolev/regal-pr-validator/settings) to this repo, change accordingly.
* "Secrets and variables" -> "Actions".
* "New repository secret".
* Name: `COMMENTING_GITHUB_TOKEN`, value: the freshly created token.

Enjoy!
