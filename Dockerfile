FROM squidfunk/mkdocs-material:latest

RUN pip3 install --no-cache-dir \
    mkdocs-include-markdown-plugin \
    mkdocs-markdownextradata-plugin \
    mkdocs-localsearch \
    mkdocs-git-revision-date-localized-plugin \
    mkdocs-awesome-pages-plugin \
    mkdocs-glightbox \
    mkdocs-macros-plugin \
    mkdocs-techdocs-redirects \
    mkdocs-redirects

RUN sed -i 's/strict: true/#strict: true/g' /docs/mkdocs.yml