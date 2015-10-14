#!/bin/sh
# Based on: Engage Warp Drive
    # Source: https://ubuntuincident.wordpress.com/2012/01/06/playing-star-trek-background-noise-with-a-linux-command/
    # Requires package 'sox'
    # http://www.reddit.com/r/linux/comments/n8a2k/commandline_star_trek_engine_noise_comment_from/
# Amended by Sam R. 2015-10-03
# Save this file somewhere on your linux system, chmod 755 it and run with bash
# ---------------------------

case "$1" in
"1" )
    # odokemono
    # http://www.reddit.com/r/scifi/comments/n7q5x/want_to_pretend_you_are_aboard_the_enterprise_for/c36xkjx
    # original
    play -n -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +25  fade h 1 864000 1
    ;;
"2" )
    # noname-_-
    # http://www.reddit.com/r/scifi/comments/n7q5x/want_to_pretend_you_are_aboard_the_enterprise_for/c373gpa
    # stereo
     play -c2 -n synth whitenoise band -n 100 24 band -n 300 100 gain +20
     ;;
"3" )
    # braclayrab
    # http://www.reddit.com/r/scifi/comments/n7q5x/want_to_pretend_you_are_aboard_the_enterprise_for/c372pyy
    # TNG
    play -n -c1 synth whitenoise band 100 20 compand .3,.8 -1,-10 gain +20
    ;;
"4" )
    play -n -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +14
    ;;
* )
    echo "No option set, there are 4 variants. run command like 'engines 1'"
    exit 1
    ;;
esac
