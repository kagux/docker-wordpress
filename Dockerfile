FROM wordpress

ENV BLOG_SUBDIR blog
RUN bash -c "sed -i 's/\(rsync --archive --one-file-system --quiet \/usr\/src\/wordpress\/\) .\//mkdir $BLOG_SUBDIR \&\& \1 $BLOG_SUBDIR\//' /entrypoint.sh"
RUN bash -c "sed -i 's/\(RewriteRule .\) \/\(index.php\)/\1 \/$BLOG_SUBDIR\/\2/' /entrypoint.sh"
RUN bash -c "sed -i 's/wp-config.php/$BLOG_SUBDIR\/&/g' /entrypoint.sh"
