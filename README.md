# Github Actions: Regex Image Updater

This is a simple regex image updater for a gitops approach when using ArgoCD, Flux or Fleet.

## Variables

These are all currently required to work.

| Name      | Example Value        | Description                                       |
|-----------|----------------------|---------------------------------------------------|
| TOKEN     | gbp_xxx              | GH Token to push the new image to the gitops repo |
| IMAGE     | ghcr.io/steadweb/foo | The image repo path without the tag name          |
| USERNAME  | steadweb             | Your (github) username                            |
| ORG       | steadweb             | Your (github) org                                 |
| REPO_NAME | example              | The name of your gitops repo                      |
| PATH      | ./apps               | Paths to where your gitops apps are located       |
| EMAIL     | foo@bar.com          | An email which git will use when committing       |
| NAME      | Gitops               | The name of the user git will use when committing |
