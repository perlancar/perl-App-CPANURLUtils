package App::CPANURLUtils;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

our %common_args = (
    urls => {
        'x.name.is_plural' => 1,
        'x.name.singular' => 'url',
        schema => ['array*', of=>'str*', min_len=>1],
        req => 1,
        pos => 0,
        greedy => 1,
        cmdline_src => 'stdin_or_args',
    },
);

$SPEC{url2cpaninfo} = {
    v => 1.1,
    summary => 'Extract CPAN information from URL(s)',
    args => {
        %common_args,
    },
    result_naked => 1,
};
sub url2cpaninfo {
    require CPAN::Info::FromURL;
    my %args = @_;
    [map {CPAN::Info::FromURL::extract_cpan_info_from_url($_)}
         @{ $args{urls} }];
}

$SPEC{url2cpanmod} = {
    v => 1.1,
    summary => 'Extract CPAN module from URL(s)',
    args => {
        %common_args,
    },
    result_naked => 1,
};
sub url2cpanmod {
    require CPAN::Module::FromURL;
    my %args = @_;
    [map {CPAN::Module::FromURL::extract_cpan_module_from_url($_)}
         @{ $args{urls} }];
}

$SPEC{url2cpandist} = {
    v => 1.1,
    summary => 'Extract CPAN distribution from URL(s)',
    args => {
        %common_args,
    },
    result_naked => 1,
};
sub url2cpandist {
    require CPAN::Dist::FromURL;
    my %args = @_;
    [map {CPAN::Dist::FromURL::extract_cpan_dist_from_url($_)}
         @{ $args{urls} }];
}

$SPEC{url2cpanauthor} = {
    v => 1.1,
    summary => 'Extract CPAN author from URL(s)',
    args => {
        %common_args,
    },
    result_naked => 1,
};
sub url2cpanauthor {
    require CPAN::Author::FromURL;
    my %args = @_;
    [map {CPAN::Author::FromURL::extract_cpan_author_from_url($_)}
         @{ $args{urls} }];
}

$SPEC{url2cpanrel} = {
    v => 1.1,
    summary => 'Extract CPAN release (tarball) name from URL(s)',
    args => {
        %common_args,
    },
    result_naked => 1,
};
sub url2cpanrel {
    require CPAN::Release::FromURL;
    my %args = @_;
    [map {CPAN::Release::FromURL::extract_cpan_release_from_url($_)}
         @{ $args{urls} }];
}

1;

# ABSTRACT: Utilities related to CPAN URLs

=head1 DESCRIPTION

This distribution contains the following utilities:

# INSERT_EXECS_LIST

=cut
