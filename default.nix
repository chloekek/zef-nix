let
    pkgs = import <nixpkgs> {
        config = {
            packageOverrides =
                let
                    rakudo-nix = fetchTarball {
                        url = "https://github.com/chloekek/rakudo-nix/archive/2019.03.tar.gz";
                        sha256 = "0f48rvl4sy1p464fkkxmzz9hwgzym3yg1hfzmm2bqx2qg063ipkh";
                    };
                in
                    import rakudo-nix;
        };
    };
in
    pkgs.callPackage ./zef.nix {}
