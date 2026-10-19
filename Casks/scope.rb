cask "scope" do
  version "1.9.0"
  sha256 "bf6a2cd7282ca7876f9d2e45b21784dfe7bdcc2ea4c09279cd23758c09f8ee0b"

  url "https://github.com/mohitkyadav/scope/releases/download/v#{version}/Scope-#{version}.zip"
  name "Scope"
  desc "Screen recorder with automatic zoom, smooth cursor and webcam bubble"
  homepage "https://github.com/mohitkyadav/scope"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Scope.app"

  # Scope isn't notarized by Apple, so clear the quarantine flag that would stop it opening.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Scope.app"],
        writable_paths: "Scope.app",
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Scripts/com.only4.Scope",
    "~/Library/Containers/com.only4.Scope",
  ]
end
