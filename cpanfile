requires 'Object::Pad',    '=> 0.68';
requires 'Digest::Keccak', '=> '0.05';
requires 'Math::BigInt',   '=> 1.999837';

on 'test' => sub {
    requires 'Test::More', '=> 0.98';
}