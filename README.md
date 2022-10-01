# solidity-abi-encoder

The Contract Application Binary Interface (ABI) is the standard way to interact
with contracts (Ethereum), this module aims to be an utility to encode the given
data according ABI type specification.

```perl
use REFECO::Blockchain::SmartContracts::Solidity::ABI::Encoder;

my $encoder = Encoder->new();
$encoder->append(name => 'transfer')->append(address => $address)->append(uint256 => $value)->encode();
```

INSTALLATION

To install this module, run the following commands:

	perl Makefile.PL
	make
	make test
	make install

SUPPORT AND DOCUMENTATION

After installing, you can find documentation for this module with the
perldoc command.

    perldoc REFECO::Blockchain::SmartContracts::Solidity::ABI::Encoder

You can also look for information at:

    RT, CPAN's request tracker (report bugs here)
        https://rt.cpan.org/NoAuth/Bugs.html?Dist=REFECO-Blockchain-SmartContracts-Solidity-ABI-Encoder

    CPAN Ratings
        https://cpanratings.perl.org/d/REFECO-Blockchain-SmartContracts-Solidity-ABI-Encoder

    Search CPAN
        https://metacpan.org/release/REFECO-Blockchain-SmartContracts-Solidity-ABI-Encoder


LICENSE AND COPYRIGHT

This software is Copyright (c) 2022 by Reginaldo Costa.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)
