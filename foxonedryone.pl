#!/usr/bin/perl

# Back to the SOC days, after some reversing and analysis this simple script 
# to assist in predicting the g01pack exploit kit domain at any given time 
# (at least this variant, which at the time was utilizing the dyn-dns service) 
# All calculations are in UTC time, it takes the combination of the 
# hour, hour + day, hour + day + month, and finally hour + day using UTC time
# and the list of words within the "@domains" array to create the domain name
# at the given time.  What this means is the domain was changing every hour.  
# If you have questions or would like me to share my analysis notes, images,
# javascript from page feel free to email me: 0xchap0@gmail.com

print "\n\ng01bot domain prediction tool\n";
print "g01pack exploit kit\n";

print "The current UTC is: ";
       system 'date -u';

print "\nEnter the hour (0 - 23): ";
chomp ($hour = <STDIN>);

print "Enter the calendar day (0 - 30): ";
chomp ($day = <STDIN>);

print "Enter the month (0 - 11): ";
chomp ($month = <STDIN>);

@domains = ("code","dry","yes","seven","im","u","r","too","nine","hi","out","six","do","junk","a","but","go","park","zeta","four","low","two","v","fox","key","n","x","wide","echo","ea","five","zero","sex","one","man","qw");

$time = $hour;
$date = $hour + $day;
$time_day = $date + $month;

print "\nIn the loop!\n";

print "\n";

print $time."\t".$domains[$time];

print "\n";

if ($date < 36) {
       print $date."\t". $domains[$date]
} else {

       $date = $date - 36;
       print $date."\t".$domains[$date];
}

print "\n";

if ($time_day < 36) {
       print $time_day."\t". $domains[$time_day];
} else {
       $time_day = $time_day - 36;
       print $time_day."\t".$domains[$time_day];
}

print "\n".$date."\t".$domains[$date];
print "\n\n";

print "Current Domain for g01pack: ". $domains[$time].$domains[$date].$domains[$time_day].$domains[$date].".dyndns-ip.com\n";
