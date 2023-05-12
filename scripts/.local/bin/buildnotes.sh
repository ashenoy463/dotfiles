#!/bin/sh

makepdf () {
    # Create PDF files from XOPP
    find . -iname '*.xopp' -exec xournalpp {} -p {}.pdf \;
    # Move them to .publish for syncing
    find . -iname '*.xopp' -exec mv {}.pdf ./.publish \;
    # Remove accidentally created files
    find . -iname '*.autosave.xopp.pdf' -exec rm {} \;
}
> home/ayush/.publishlog
# Search documents for binders
for d in /home/ayush/Documents/*/ ; do
    [ -d "$d/.publish" ] && cd "$d" && makepdf && echo "Built $d" >> /home/ayush/.publishlog
done
echo "$(date)" >> /home/ayush/.publishlog

#TODO
#remove rulings
