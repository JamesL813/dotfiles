#!/bin/sh

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    *opendocument*) odt2txt "$1" ;;
	  # *.md|*.rmd) mdcat -l --columns "$(($4-2))" "$1" ;;
	  *.md|*.rmd) glow --style "light" "$1" ;;
    *.csv|*.tsv) tidy-viewer -a "$1" ;;
    *) bat -r 0:90 --style=plain --wrap=character -f "$1" # --theme=base16 --terminal-width "$(($4-2))" -f "$1";;
esac
