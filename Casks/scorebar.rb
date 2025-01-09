cask "scorebar" do
    version "1.0.1"
    sha256 "086a5e5241300df3365a07cd355a766f798f55840d7d25014a85ca869bc41c4e" # this is the sha256 of the zip file of the app.  
    url "https://github.com/csgulati09/scorebar/releases/download/v1.0.1/ScoreBar.zip"
    name "ScoreBar"
    desc "A sleek macOS app for tracking scores and stats directly from your menu bar."
    homepage "https://github.com/csgulati09/scorebar.git"

    app "ScoreBar.app"
    # this bypasses the macos gatekeeper, installs directly. 
    postflight do
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/ScoreBar.app"]
    end

    caveats <<~EOS
      "ScoreBar" is not notarized or signed by Apple. If you face any issues, try:
        1) Allow it from System Preferences > Security & Privacy > ScoreBar - Run anyway
        2) Run the following to manually remove Gatekeeper quarantine:
        `xattr -dr com.apple.quarantine /Applications/ScoreBar.app`
    EOS
  end
  