FROM squidfunk/mkdocs-material:9

RUN pip install --no-cache-dir \
  mkdocs-blog-plugin mkdocs-git-revision-date-plugin
  #mkdocs-git-authors-plugin mkdocs-git-committers-plugin mkdocs-git-revision-date-plugin mkdocs-pdf-export-plugin

ENTRYPOINT ["mkdocs"]

CMD ["serve", "--dev-addr=0.0.0.0:8000"]
