with import <nixpkgs> { };

let
  pythonPackages = python312Packages;
in
pkgs.mkShell rec {
  name = "piccolobug";
  venvDir = "./.venv";
  buildInputs = [
    # A Python interpreter including the 'venv' module is required to bootstrap
    # the environment.
    pythonPackages.python

    # This executes some shell code to initialize a venv in $venvDir before
    # dropping into the shell
    pythonPackages.venvShellHook

    taglib
    openssl
    git
    libxml2
    libxslt
    libzip
    zlib
    libGL
    glib
  ];

  # Run this command, only after creating the virtual environment
  postVenvCreation = ''
    export SOURCE_DATE_EPOCH=315532800

    # Let .envrc handle the rest
    touch pyproject.toml
  '';

  # Now we can execute any commands within the virtual environment.
  # This is optional and can be left out to run pip manually.
  postShellHook = ''
    export SOURCE_DATE_EPOCH=315532800
  '';

  LD_LIBRARY_PATH = "${stdenv.cc.cc.lib}/lib:${glib.out}/lib:${libGL}/lib:${zlib.out}/lib";
}
