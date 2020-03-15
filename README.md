# Markdown to PDF Action  

This action will create a pdf file from a md file, and can be used in conjunction with a pull request to merge the .pdf back into the repository. The example below shows how to...

1. Checkout the code  
2. Convert a .md file to a .pdf file
3. Open a pull request to the repo with the generated .pdf.  

This action uses [Pandoc](https://pandoc.org/) in the [pandoc/latex docker image](https://hub.docker.com/r/pandoc/latex).

## Example  

```yaml
name: Convert Markdown to PDF

on:
  push:
    paths:
    - '**.md'

jobs:
  convert_md:  
    runs-on: ubuntu-latest
    steps:
    - name: Checkout Code
      uses: actions/checkout@v2.0.0
      with:
        fetch-depth: 1
    - name: Convert Markdown File
      uses: pharbison/md-to-pdf@v1
      with:
        MD_SRC: './exports/example.md'
        PDF_DST: './exports/example.pdf'
        OPTS: ''
        LINE_BREAK: '42'
    - name: Create Pull Request
      uses: peter-evans/create-pull-request@v1.6.1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        COMMIT_MESSAGE: Add .pdf file.
```
