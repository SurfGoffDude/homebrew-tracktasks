cask "tracktasks" do
  version "1.0"
  sha256 "5573f7d8e8405992a8d6e8df9d535aee9b75bf28039ba37425cc69a4e121de66"

  url "https://github.com/SurfGoffDude/TrackTasks/releases/download/v#{version}/TrackTasks-#{version}.zip"
  name "TrackTasks"
  desc "Локальный трекер задач для проектов с агентами Claude Code и Codex"
  homepage "https://github.com/SurfGoffDude/TrackTasks"

  depends_on macos: ">= :tahoe" # macOS 26

  app "TrackTasks.app"
  binary "#{appdir}/TrackTasks.app/Contents/Helpers/tt"

  # Только данные самого приложения. Папки проектов, tasks/*.md, about.md и spectrack.md не трогаются.
  # Идентификатор в путях должен совпадать с CFBundleIdentifier из Info.plist релиза.
  zap trash: [
    "~/Library/Application Support/TrackTasks",
    "~/Library/Caches/io.github.surfgoffdude.TrackTasks",
    "~/Library/Preferences/io.github.surfgoffdude.TrackTasks.plist",
    "~/Library/Saved Application State/io.github.surfgoffdude.TrackTasks.savedState",
  ]
end
