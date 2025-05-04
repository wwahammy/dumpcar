class DumpcarGenerator < Rails::Generators::Base
  def add_db_dumps_dir
    create_file("db/dumps/.keep", "")
  end

  def add_keep_to_git
    git add: "db/dumps/.keep"
  end

  def gitignore_db_dumps
    insert_into_file ".gitignore", <<~RUBY
    
      # dumpcar dumps
      /db/dumps
    RUBY
  end

  def add_gitignore_to
    git add: ".gitignore"
  end

  def commit_git
    git commit: '-m "Added dumpcar .gitignore"'
  end
end
