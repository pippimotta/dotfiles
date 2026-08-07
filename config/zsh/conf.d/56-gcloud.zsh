# Google Cloud SDK — PATH + completion
GCLOUD_SDK="/opt/homebrew/share/google-cloud-sdk"
if [[ -f "$GCLOUD_SDK/path.zsh.inc" ]]; then
  source "$GCLOUD_SDK/path.zsh.inc"
  source "$GCLOUD_SDK/completion.zsh.inc"
fi
