resource "github_repository" "main" {
  name = var.name

  description = var.description

  homepage_url = var.homepage_url

  private = var.private

  has_issues   = var.has_issues
  has_projects = var.has_projects
  has_wiki     = var.has_wiki

  allow_merge_commit = var.allow_merge_commit
  allow_squash_merge = var.allow_squash_merge
  allow_rebase_merge = var.allow_rebase_merge

  auto_init = var.auto_init

  gitignore_template = var.gitignore_template
  license_template   = var.license_template

  default_branch = var.default_branch

  archived = var.archived

  topics = var.topics
}

resource "github_repository_collaborator" "main" {
  count      = length(var.collaborators)
  repository = github_repository.main.name
  username   = var.collaborators[count.index].username
  permission = var.collaborators[count.index].permission
}

data "github_team" "main" {
  count = length(var.teams)
  slug  = var.teams[count.index].name
}

resource "github_team_repository" "main" {
  count      = length(var.teams)
  team_id    = data.github_team.main[count.index].id
  repository = github_repository.main.name
  permission = var.teams[count.index].permission
}

resource "github_repository_deploy_key" "main" {
  count      = "${length(var.deploy_keys)}"
  title      = "${lookup(var.deploy_keys[count.index], "title", "")}"
  repository = "${github_repository.main.name}"
  key        = "${lookup(var.deploy_keys[count.index], "key")}"
  read_only  = "${lookup(var.deploy_keys[count.index], "read_only", true)}"
}

resource "github_issue_label" "main" {
  count = "${length(var.issue_labels)}"

  repository  = "${github_repository.main.name}"
  name        = "${lookup(var.issue_labels[count.index], "name")}"
  color       = "${lookup(var.issue_labels[count.index], "color")}"
  description = "${lookup(var.issue_labels[count.index], "description", "")}"
}
