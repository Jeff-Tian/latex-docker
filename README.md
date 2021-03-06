# latex-docker

[![GitHub Actions Status](https://github.com/jeff-tian/latex-docker/workflows/Build%20Docker%20Image/badge.svg)](https
://github.com/jeff-tian/latex-docker/actions)

> Docker Image of [TeXLive](http://tug.org/texlive/).

## How to use it

```powershell
docker run --rm -it -v $(pwd):/work -w /work -e LC_ALL=C.UTF-8 -e PLANTUML_JAR=tools/plantuml.jar jefftian/texlive-full:latest latexmk -lualatex -shell-escape -synctex=1 -interaction=nonstopmode -enable-write18 yours.tex
```

## What

Forked from xu-cheng/latex-docker with modification to allow you star this repo to trigger a build.

## Why

- The other day a latex project of mine failed because the image `xu-cheng/texlive-full` is based on version 2019 while the project requires version 2020. So I have to build the latest texlive image. To avoid other people met this similar situation I created a github action to allow start project to trigger the building. So one day you find there is a new version of texlive released then you can star this project to trigger the latest texlive image's building.
- The original one doesn't work for plantuml package

## See Also

- [latex-action](https://github.com/xu-cheng/latex-action): GitHub action to compile LaTeX documents.
- [texlive-action](https://github.com/xu-cheng/texlive-action): GitHub action to run arbitrary commands in a TeXLive environment.

## License

MIT
