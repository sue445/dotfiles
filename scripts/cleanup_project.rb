# workspace配下の不要なディレクトリなどを削除する (ghq前提)
require "pathname"
require "fileutils"

RUN_FLAG = ARGV[0] == "run"

def run
  ghq_roots = `git config --get-all ghq.root`.each_line.map(&:strip)

  ghq_roots.each do |root|
    ghq_root = File.expand_path(root, __dir__)
    workspaces = Pathname.glob("#{ghq_root}/*/*/*/").select(&:directory?)
    workspaces.each do |workspace_path|
      cleanup_workspace(workspace_path)
    end
  end
end

def cleanup_workspace(workspace_path)
  # ruby
  remove_dir(workspace_path.join("log"))
  remove_dir(workspace_path.join("vendor/bundle"))
  remove_dir(workspace_path.join("gemfiles/bundle"))

  # jenkins plugin
  remove_dir(workspace_path.join("target"))
  remove_dir(workspace_path.join("work"))
end

def remove_dir(path)
  return unless path.exist?
  return unless path.directory?

  if RUN_FLAG
    puts "[remove] #{path}"
    FileUtils.rm_rf(path)
  else
    puts "[dry-run] #{path}"
  end
end

run
