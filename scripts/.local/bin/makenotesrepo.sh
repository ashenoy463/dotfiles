#!/bin/sh

course_dir="$HOME/Trash/$1"
mkdir -p "$course_dir/.publish"
touch "$course_dir/README"


while getopts "m:b:" option; do
   case $option in
      m) # OCW Course
         echo "=> [Create OCW Course] $OPTARG";
         mkdir -p "$course_dir/OCW - $OPTARG/Notes"
         mkdir -p "$course_dir/OCW - $OPTARG/PSets/Solutions"
         ;;
      b) # Add Book directory
         mkdir "$course_dir/Books"
         multi+=("$OPTARG")
         for book in "${multi[@]}"; do
             ln -s "$book" "$course_dir/Books/$(basename $book)"
             echo "=> [Symlink Book] $(basename $book)"
         done
         ;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

tree "$course_dir"

#TODO
#list books to symlink
