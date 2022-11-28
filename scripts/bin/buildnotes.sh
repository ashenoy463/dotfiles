#!/bin/sh

makepdf () {
    # Create PDF files from XOPP
    find . -iname '*.xopp' -exec xournalpp {} -p {}.pdf \;
    # Move them to .publish for syncing
    find . -iname '*.xopp' -exec mv {}.pdf ./.publish \;
    # Remove accidentally created files
    find . -iname '*.autosave.xopp.pdf' -exec rm {} \;
}

# Search documents for binders
for d in ~/Documents/*/ ; do
    [ -d "$d/.publish" ] && cd "$d" && makepdf && echo "Built $d" >> /home/ayush/cronfu.txt
done

#TODO
#sed out the autosave.xopp.pdf
#remove rulings
