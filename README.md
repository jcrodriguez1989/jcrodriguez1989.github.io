My personal website
================

## Build using Docker

To build my personal website and resume use the Docker image.

Clone the repo, and build the Docker
image:

``` bash
git clone https://github.com/jcrodriguez1989/jcrodriguez1989.github.io.git
cd jcrodriguez1989.github.io/
docker build -t personal_website .
```

Run the image, and start R:

``` bash
docker run --rm -ti personal_website
R
```

Build both website and resume:

``` r
rmarkdown::render_site(encoding = "UTF-8")
rmarkdown::render("static/files/JCR_Resume/JCR_Resume.Rmd")
```
