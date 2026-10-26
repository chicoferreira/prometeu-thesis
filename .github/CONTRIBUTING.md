# Contributing

Bug reports, fixes and improvements are welcome. For larger changes, open an issue first so we can agree on the approach before you put in the work.

## Working on the template

The template imports the package from Typst Universe, so it won't see your changes, and an unpublished version won't compile. Use [typship](https://github.com/sjfhsjfh/typship) to link this repository in its place:

```
typship dev
```

The link is tied to the version, so run it again after every version change.

Then check your changes using the [fonts from the README](../README.md#setting-up-fonts):

- **CLI:** compile the template, with `--font-path` pointing at the fonts folder:
  ```
  typst compile --font-path <fonts folder> template/main.typ
  ```
- **Editor:** open `template/main.typ` in an editor with [Tinymist](https://github.com/Myriad-Dreamin/tinymist) and use its live preview, with its `tinymist.fontPaths` setting pointing at the fonts folder.

When opening a pull request:

- Keep it to one change.
- If the change affects `example.pdf`, regenerate it with `typst compile --font-path <fonts folder> template/main.typ example.pdf` and commit it with the change.
- Make sure the output still follows the [university's formatting rules](https://alunos.uminho.pt/PT/estudantes/Paginas/InfoUteisFormatacao.aspx).

## Releasing

For maintainers. Versions follow [semver](https://semver.org/): fixes that only change the output are a patch, new options or features are a minor, and changes that break existing documents are a major.

1. Make sure `main` has everything for the release and `example.pdf` is up to date.
2. Find every use of the old version and replace it with the new one:
   ```
   git grep -nF "old version" -- ':!*.pdf'
   ```
   Once you've replaced them all, the same command should find nothing.
3. Commit only the bump, as `Release vX.Y.Z`.
4. Tag and push:
   ```
   git tag -s vX.Y.Z -m "Release vX.Y.Z"
   git push origin main vX.Y.Z
   ```
5. Create a [GitHub release](https://github.com/chicoferreira/prometeu-thesis/releases/new) from the tag, with a "What's Changed" list, a "How to upgrade" section when users need to change their `main.typ`, and the full changelog link that GitHub provides.
6. Submit to Typst Universe with [typship](https://github.com/sjfhsjfh/typship), from this repository on the release commit. It uploads the files exactly as they are on disk, including untracked ones, so make sure `git status` is clean first.

   If you haven't logged in before, run `typship login universe`. It needs a fine-grained token for your fork of [typst/packages](https://github.com/typst/packages), with read and write access to Contents, Workflows and Pull requests.

   Check the file list first. Hidden files should be skipped, and `example.pdf` should be included because the README links to it:
   ```
   typship publish universe --dry-run
   ```
   Then submit, accepting the fork name `packages` and confirming the upload:
   ```
   typship publish universe
   ```
   typship pushes the branch `prometeu-thesis-X.Y.Z` to your fork but can't open the pull request, because the token only covers your fork. Open it yourself, either from that branch on GitHub or with `gh`:
   ```
   gh pr create -R typst/packages --head chicoferreira:prometeu-thesis-X.Y.Z --base main --title "prometeu-thesis:X.Y.Z" --body-file <body file>
   ```
   Either way, use the title `prometeu-thesis:X.Y.Z` and this body:
   ```markdown
   I am submitting
   - [ ] a new package
   - [x] an update for a package

   * <change>
   * <change>

   Release notes: https://github.com/chicoferreira/prometeu-thesis/releases/tag/vX.Y.Z

   - [X] ensured that my package is licensed such that users can use and distribute the contents of its template directory without restriction, after modifying them through normal use.
   ```
