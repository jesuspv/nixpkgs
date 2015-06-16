{ stdenv, fetchurl, pkgs, pythonPackages }:

pythonPackages.buildPythonPackage rec {
  version = "0.4.0";
  name = "khal-${version}";

  src = fetchurl {
    url = "https://github.com/geier/khal/archive/v${version}.tar.gz";
    sha256 = "0d32miq55cly4q3raxkw3xpq4d5y3hvzaqvy066nv35bdlpafxi1";
  };

  propagatedBuildInputs = with pythonPackages; [
    atomicwrites
    click
    configobj
    dateutil
    icalendar
    lxml
    pkgs.vdirsyncer
    pytz
    pyxdg
    requests_toolbelt
    tzlocal
    urwid
    python.modules.sqlite3
  ];

  meta = with stdenv.lib; {
    homepage = http://lostpackets.de/khal/;
    description = "CLI calendar application";
    license = licenses.mit;
    maintainers = with maintainers; [ matthiasbeyer jgeerds ];
  };
}
