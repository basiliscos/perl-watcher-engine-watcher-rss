
use strict;
use warnings;

use 5.012;

use ExtUtils::MakeMaker 6.72;



my %WriteMakefileArgs = (
  "ABSTRACT" => "RSS and ATOM feeds watcher",
  "AUTHOR" => "Ivan Baidakou <dmol\@gmx.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.72"
  },
  "DISTNAME" => "App-PerlWatcher-Watcher-Rss",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "App::PerlWatcher::Watcher::Rss",
  "PREREQ_PM" => {
    "AnyEvent" => "7.04",
    "App::PerlWatcher::Engine" => "0.17",
    "Data::Feed" => "0.00015",
    "HTTP::Date" => "6.02",
    "Moo" => "1.003000",
    "Smart::Comments" => "1.000004",
    "aliased" => "0.31"
  },
  "TEST_REQUIRES" => {
    "AnyEvent::HTTPD" => "0.93",
    "Path::Class" => "0.32",
    "Test::More" => "0.98"
  },
  "VERSION" => "0.18",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



