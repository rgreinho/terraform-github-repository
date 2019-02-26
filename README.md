# GitHub Repository

Create a new repository.

## Example Usage

```hcl
module "example_repo" {
  source = "innovationnorway/repository/github"

  name = "example"

  description = "My example codebase"

  private = false

  gitignore_template = "Node"
  license_template   = "mit"

  topics = ["example"]
}
```

## Arguments

| Name | Type | Description |
| --- | ---| --- |
| `name` | `string` | **Required**. The name of the repository. |
| `description` | `string` | A short description of the repository. |
| `homepage_url` | `string` | A URL with more information about the repository. |
| `private` | `bool` | Either `true` to create a private repository or `false` to create a public one. Creating private repositories requires a paid GitHub account. Default: `true`. |
| `has_issues` | `bool` | Either `true` to enable issues for the repository or `false` to disable them. Default: `true`. |
| `has_projects` | `bool` | Either `true` to enable projects for the repository or `false` to disable them. Default: `false`. |
| `has_wiki` | `bool` | Either `true` to enable the wiki for the repository or `false` to disable it. Default: `false`. |
| `auto_init` | `bool` | Pass `true` to create an initial commit with empty `README.md`. Default: `false`. |
| `gitignore_template` | `string` | Desired language or platform [.gitignore template](https://github.com/github/gitignore) to apply. Use the name of the template without the extension. For example: `Terraform` or `VisualStudio`. |
| `license_template` | `string` | Choose an [open source license template](https://choosealicense.com/) that best suits your needs, and then use the [license keyword](https://help.github.com/articles/licensing-a-repository/#searching-github-by-license-type) as the `license_template` string. For example: `mit` or `mpl-2.0`. |
| `allow_squash_merge` | `bool` | Either `true` to allow squash-merging pull requests, or `false` to prevent squash-merging. Default: `true`. |
| `allow_merge_commit` | `bool` | Either `true` to allow merging pull requests with a merge commit, or `false` to prevent merging pull requests with merge commits. Default: `true`. |
| `allow_rebase_merge` | `bool` | Either `true` to allow rebase-merging pull requests, or `false` to prevent rebase-merging. Default: `true`. |
| `archived` | `bool` | Pass `true` to archive the repository. **Note:** You cannot unarchive repositories through the API. Default: `false`. |
| `topics` | `list` | A list of topics to add to the repository. Pass one or more topics to replace the set of existing topics. Send an empty list (`[]`) to clear all topics from the repository. |
| `default_branch` | `string` | Updates the default branch for the repository. **Note**: This can only be set after a repository has been created, and after a correct reference has been created for the target branch inside the repository. |

