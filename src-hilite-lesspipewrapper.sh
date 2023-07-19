#!/bin/bash

TMP_MAP="$(mktemp)"
trap 'rm -f -- "$TMP_MAP"' EXIT

cat /usr/share/source-highlight/lang.map "$HOME/.config/source-highlight/lang.map" > "$TMP_MAP"

if [ -f "$(pwd)/lang.map" ]; then
    cat $(pwd)/lang.map >> "$TMP_MAP"
fi

num_colors=$(tput colors)
if [[ -n "$num_colors" ]] && [[ $num_colors -ge 256 ]]; then
    # 8-bit color terminal
    outlang_file="$HOME/.config/source-highlight/esc256.outlang"
    style_file='esc256.style'
else
    # 6-bit color terminal (source-highlight default)
    outlang_file="$HOME/.config/source-highlight/esc.outlang"
    style_file='esc.style'
fi

for source in "$@"; do
    case $source in
        *ChangeLog|*changelog) 
        /usr/bin/source-highlight --lang-map="$TMP_MAP" --failsafe \
            --outlang-def "$outlang_file" --lang-def=changelog.lang \
            --style-file="$style_file" -i "$source" ;;
        *Makefile|*makefile) 
        /usr/bin/source-highlight --lang-map="$TMP_MAP" --failsafe \
            --outlang-def "$outlang_file" --lang-def=makefile.lang \
            --style-file="$style_file" -i "$source" ;;
        *.tar|*.tgz|*.gz|*.bz2|*.xz)
        /usr/bin/lesspipe.sh "$source" ;;
        *)
        /usr/bin/source-highlight --lang-map="$TMP_MAP" --failsafe \
            --infer-lang --outlang-def "$outlang_file" \
            --style-file="$style_file" -i "$source" ;;
    esac
done
