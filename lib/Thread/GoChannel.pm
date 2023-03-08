package Thread::GoChannel;

use strict;
use warnings;

use XSLoader;
XSLoader::load('Thread::GoChannel', __PACKAGE__->VERSION);

1; # End of Thread::GoChannel

# ABSTRACT: Fast thread queues with go-like semantics

=head1 SYNOPSIS

 use threads;
 use Thread::GoChannel;
 my $channel = Thread::GoChannel->new;

 my $reader = threads->create(sub {
     while (my $line = <>) {
         $channel->send($line)
     }
     $channel->close;
 });

 while (defined(my $line = $channel->receive)) {
     print $line;
 }
 $reader->join;

=head1 DESCRIPTION

Thread::GoChannel is an alternative to L<Thread::Queue>. By using a smart serialization ladder, it can achieve high performance without compromising on flexibility.

=method new()

This constructs a new channel.

=method send($message)

This sends the message C<$message> to the channel. It will wait until there is a receiver.

=method receive()

Received a message from the channel, it will wait until a message arrives, or return undef if the channel is closed.

=method close()

Closes the channel for further messages.

=head1 SEE ALSO

=over 4

=item * Thread::Queue

=item * Thread::Channel

=back

