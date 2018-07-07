curl -L https://github.com/genuinetools/img/releases/download/v0.4.6/img-linux-amd64 -o /usr/local/bin/img
# Verify the sha256sum
export SHASUM=$(curl -L https://github.com/genuinetools/img/releases/download/v0.4.6/img-linux-amd64.sha256 | awk '{ print $1 }')
if [ "$SHASUM" != "$(sha256sum /usr/local/bin/img | awk '{ print $1 }')" ]; then echo "sha256sum mismatch!"; fi
chmod a+x /usr/local/bin/img
echo "img installed!"
