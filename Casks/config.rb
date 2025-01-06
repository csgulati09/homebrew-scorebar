cask "scorebar" do
    version "1.0.0"
    sha256 "2b4f612f685c2ab4f2c8055c1513794538dc15075106560c9980fb749716c794" # this is the sha256 of the zip file of the app.  
    url "<git hub release link to be added here>"
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
  