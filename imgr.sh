#!/bin/bash
first=$(zenity --width=550 --title="Welcome to Vision Companion" --text "Enter your filename:" --entry)
(echo "40"; tesseract abc.jpg out;echo "60"; tesseract abc.jpg out;echo "70"; tesseract abc.jpg out;echo "94"; tesseract $first convertedfile) | zenity --progress --text="Converting!!" --percentage=0 --auto-close

zenity --info --title="Image to Text Process" --text="Conversion Complete!!"
f=$(zenity --title="Vision Companion" --text "Open Your Processed File ?" --entry)
if [ "$f" = "yes" ]
then
    atom convertedfile.txt
fi
d=$(zenity --width=550  --title="Vision Companion" --text "Convert to Audio File ?" --entry)
if [ "$d" = "yes" ]
then
      (echo "20";tesseract abc.jpg out;echo "60";tesseract abc.jpg out; echo "85";gtts-cli.py -f convertedfile.txt -l 'en' -o convertedfile.mp3) | zenity --progress --text="Converting!!" --percentage=0 --auto-close
fi
e=$(zenity --width=550  --title="Vision Companion" --text "Play the Audio file?" --entry)
if [ "$e" = "yes" ]
then
rhythmbox convertedfile.mp3
fi
