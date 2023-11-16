# Github Actions: Regex Image Updater

This is a simple regex image updater for a gitops approach when using ArgoCD, Flux or Fleet.

## Variables

These are all currently required to work.

| Name       | Example Value        | Description                                          |
|------------|----------------------|------------------------------------------------------|
| TOKEN      | gbp_xxx              | GH Token to push the new image to the gitops repo    |
| IMAGE      | ghcr.io/steadweb/foo | The image repo path without the tag name             |
| USERNAME   | steadweb             | Your (github) username                               |
| ORG        | steadweb             | Your (github) org                                    |
| REPO_NAME  | example              | The name of your gitops repo                         |
| PATH       | ./apps               | Paths to where your gitops apps are located          |
| EMAIL      | foo@bar.com          | An email which git will use when committing          |
| NAME       | Gitops               | The name of the user git will use when committing    |
| CHART_TYPE | helm                 | Type of regex to use, default nothing, supports helm |
| BRANCH     | main                 | The name of the branch to checkout when updating     |

## Action Example

Use the following as an example:

```
- uses: steadweb/action-regex-image-updater@main
  env:
    TOKEN: ${{ secrets.GITHUB_TOKEN }}
    IMAGE: "ghcr.io/steadweb/node18-example"
    USERNAME: "steadweb"
    ORG: "steadweb"
    REPO_NAME: "fleet-example"
    BRANCH: "main"
    PATH: "./apps"
    EMAIL: "ljsteadman@gmail.com"
    NAME: "Luke Steadman"
```
