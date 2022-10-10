#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use REFECO::Blockchain::SmartContracts::Solidity::ABI::Encoder;

my $encoder = REFECO::Blockchain::SmartContracts::Solidity::ABI::Encoder->new();

subtest "example baz" => sub {
    $encoder->function('baz')->append(uint32 => 69)->append(bool => 1);

    my $encoded_doc =
        '0xcdcd77c000000000000000000000000000000000000000000000000000000000000000450000000000000000000000000000000000000000000000000000000000000001';

    is($encoder->encode(), $encoded_doc);

    $encoder->clear();
};

subtest "example bar" => sub {
    $encoder->function('bar')->append('bytes3[2]' => [unpack("H*", 'abc'), unpack("H*", 'def')]);

    my $encoded_doc =
        '0xfce353f661626300000000000000000000000000000000000000000000000000000000006465660000000000000000000000000000000000000000000000000000000000';

    is $encoder->encode(), $encoded_doc, 'correct result for bar example';
    $encoder->clear();
};

subtest "example sam" => sub {
    $encoder->function('sam')->append(bytes => unpack("H*", 'dave'))->append(bool => 1)->append('uint256[]' => [1, 2, 3]);

    my $encoded_doc =
        '0xa5643bf20000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000000464617665000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000003';

    is $encoder->encode(), $encoded_doc, 'correct result for sam example';
    $encoder->clear();
};

subtest "example f" => sub {
    $encoder->function('f')->append(uint256 => 291)->append('uint32[]' => [1110, 1929])->append(bytes10 => unpack("H*", '1234567890'))
        ->append(bytes => unpack("H*", 'Hello, world!'));
    my $encoded_doc =
        '0x8be6524600000000000000000000000000000000000000000000000000000000000001230000000000000000000000000000000000000000000000000000000000000080313233343536373839300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e0000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000004560000000000000000000000000000000000000000000000000000000000000789000000000000000000000000000000000000000000000000000000000000000d48656c6c6f2c20776f726c642100000000000000000000000000000000000000';

    is $encoder->encode(), $encoded_doc, 'correct result for f example';
    $encoder->clear();
};

subtest "example g" => sub {
    $encoder->function('g')->append('uint256[][]' => [[1, 2], [3]])->append('string[]' => ['one', 'two', 'three']);

    my $encoded_doc =
        '0x2289b18c000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000001400000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000e000000000000000000000000000000000000000000000000000000000000000036f6e650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000374776f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000057468726565000000000000000000000000000000000000000000000000000000';

    is $encoder->encode(), $encoded_doc, 'correct result for g example';
    $encoder->clear();
};

done_testing;

