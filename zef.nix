{stdenv, makeWrapper, rakudo}:
stdenv.mkDerivation rec {
    name = "zef";
    version = "0.7.4";
    src = fetchTarball {
        url = "https://github.com/ugexe/zef/archive/${version}.tar.gz";
        sha256 = "054jwdl4v26nfic8yi2jbrb6i5zly2w9bjdag1vk9j1961gdsjpz";
    };
    buildInputs = [makeWrapper];
    phases = ["unpackPhase" "installPhase" "fixupPhase"];
    installPhase = ''
        mkdir --parents $out/{bin,share}
        mv bin lib resources $out/share

        makeWrapper ${rakudo}/bin/perl6 $out/bin/zef \
            --prefix PERL6LIB , $out/share/lib \
            --argv0 zef \
            --add-flags $out/share/bin/zef
    '';
}
