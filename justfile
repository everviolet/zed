default:
    just --list

[group("nix")]
setup:
    nix shell github:everviolet/whiskers

# generate theme for a particular accent
build accent="green":
    whiskers zed.tera --overrides '{"accent": ["{{ accent }}"]}'

# generate all variants
all:
    whiskers zed.tera

[doc("create & push tag")]
[confirm]
release tag: all
    git tag -s "{{ tag }}" -m "{{ tag }}"
    git push origin "{{ tag }}"

clean:
    rm themes/*.json
