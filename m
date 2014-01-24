Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6C0E152972
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2014 15:20:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0OFKRlu000331
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 09:20:27 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OFKRnk003127
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 09:20:27 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 24 Jan 2014 09:20:27 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/3] stress: Pull stress into
	meta-arago-extras
Thread-Index: AQHPFionFodPg2DcwUyNV3tguGMTMZqOkmEA///0EnqABXv2QA==
Date: Fri, 24 Jan 2014 15:20:26 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C610AB5@DFLE08.ent.ti.com>
References: <1390259818-10267-1-git-send-email-fcooper@ti.com>
	<1390259818-10267-2-git-send-email-fcooper@ti.com>,
	<20140120221502.GC24768@edge>
	<DEC54650-487E-4972-A71B-3FED00D405C7@ti.com>
In-Reply-To: <DEC54650-487E-4972-A71B-3FED00D405C7@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/3] stress: Pull stress into meta-arago-extras
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jan 2014 15:20:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Monday, January 20, 2014 9:32 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/3] stress: Pull stress into meta-arago=
-extras
>=20
>=20
>=20
> > On Jan 20, 2014, at 4:15 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> >
> >> On Mon, Jan 20, 2014 at 05:16:57PM -0600, Franklin S. Cooper Jr wrote:
> >> * Stress is a useful userspace testing tool.
> >> * The original recipe can be found in meta-linaro/meta-linaro/recipes-=
extra.
> >> * However, to avoid pulling in that entire layer included bbappend
> >> overrides  simply overlay the recipe into meta-arago-extras.
> >
> > Well, we are already cloning the entire repo anyway, even though only
> > using meta-linaro-toolchain sub-layer. Are you afraid of any conflicts
> > with their bbappends? I only see busybox being the obvious one, but we
> > can BBMASK it for our distro... There are plenty of other useful
> > testing tools, especially in master - are we interested?
> > We've started talking to Linaro, so we may end up moving some of our
> > recipes/enhancements back to their layer... Thoughts?
> I'm ok with doing this.
[Franklin] I thought about this more and would like to hold off adding this=
 layer as an meta-argao dependency for now. This would break things for cur=
rent users since it would require them to update their layer configuration.=
 I rather pull in stress as is now and add this new layer dependency when w=
e update meta-arago to support dora when we have to update the configuratio=
n anyway. At that time we can also remove stress from meta-arago as part of=
 cleanup.
> >
> > --
> > Denys
> >
> >
> >> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >> ---
> >> .../recipes-devtools/stress/files/texinfo.patch    |   79
> ++++++++++++++++++++
> >> .../recipes-devtools/stress/stress_1.0.4.bb        |   16 ++++
> >> 2 files changed, 95 insertions(+), 0 deletions(-) create mode 100644
> >> meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
> >> create mode 100644
> >> meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb
> >>
> >> diff --git
> >> a/meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
> >> b/meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
> >> new file mode 100644
> >> index 0000000..5ac5951
> >> --- /dev/null
> >> +++ b/meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
> >> @@ -0,0 +1,79 @@
> >> +--- a/doc/stress.texi
> >> ++++ b/doc/stress.texi
> >> +@@ -62,47 +62,47 @@
> >> +
> >> + @table @samp
> >> + @item -?
> >> +-@itemx --help
> >> ++@item --help
> >> + Show help information.
> >> +
> >> +-@itemx --version
> >> ++@item --version
> >> + Show version information.
> >> +
> >> + @item -v
> >> +-@itemx --verbose
> >> ++@item --verbose
> >> + Turn up verbosity.
> >> +
> >> + @item -q
> >> +-@itemx --quiet
> >> ++@item --quiet
> >> + Turn down verbosity.
> >> +
> >> + @item -n
> >> +-@itemx --dry-run
> >> ++@item --dry-run
> >> + Show what would have been done.
> >> +
> >> + @item -t @var{secs}
> >> +-@itemx --timeout @var{secs}
> >> ++@item --timeout @var{secs}
> >> + Time out after @var{secs} seconds.
> >> +
> >> +-@itemx --backoff @var{usecs}
> >> ++@item --backoff @var{usecs}
> >> + Wait for factor of @var{usecs} microseconds before starting work.
> >> +
> >> + @item -c @var{forks}
> >> +-@itemx --cpu @var{forks}
> >> ++@item --cpu @var{forks}
> >> + Spawn @var{forks} processes each spinning on @samp{sqrt()}.
> >> +
> >> + @item -i @var{forks}
> >> +-@itemx --io @var{forks}
> >> ++@item --io @var{forks}
> >> + Spawn @var{forks} processes each spinning on @samp{sync()}.
> >> +
> >> + @item -m @var{forks}
> >> +-@itemx --vm @var{forks}
> >> ++@item --vm @var{forks}
> >> + Spawn @var{forks} processes each spinning on @samp{malloc()}.
> >> +
> >> +-@itemx --vm-bytes @var{bytes}
> >> ++@item --vm-bytes @var{bytes}
> >> + Allocate @var{bytes} number of bytes.  The default is 1.
> >> +
> >> +-@itemx --vm-hang
> >> ++@item --vm-hang
> >> + Instruct each vm hog process to go to sleep after allocating
> >> +memory.  This  contrasts with their normal behavior, which is to
> >> +free the memory and  reallocate @emph{ad infinitum}.  This is useful
> >> +for simulating low memory @@ -114,13 +114,13 @@  @end example
> >> +
> >> + @item -d @var{forks}
> >> +-@itemx --hdd @var{forks}
> >> ++@item --hdd @var{forks}
> >> + Spawn @var{forks} processes each spinning on @samp{write()}.
> >> +
> >> +-@itemx --hdd-bytes @var{bytes}
> >> ++@item --hdd-bytes @var{bytes}
> >> + Write @var{bytes} number of bytes.  The default is 1GB.
> >> +
> >> +-@itemx --hdd-noclean
> >> ++@item --hdd-noclean
> >> + Do not unlink file(s) to which random ASCII data is written.
> >> +
> >> + @end table
> >> diff --git
> >> a/meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb
> >> b/meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb
> >> new file mode 100644
> >> index 0000000..04ad6ce
> >> --- /dev/null
> >> +++ b/meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb
> >> @@ -0,0 +1,16 @@
> >> +DESCRIPTION =3D "Deliberately simple workload generator for POSIX
> >> +systems. It \ imposes a configurable amount of CPU, memory, I/O, and =
disk
> stress on the system."
> >> +HOMEPAGE =3D "http://people.seas.harvard.edu/~apw/stress/"
> >> +LICENSE =3D "GPLv2"
> >> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> >> +
> >> +PR =3D "r0"
> >> +
> >> +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/stress/stress-
> ${PV}.tar.gz/a607afa695a511765b40993a64c6e2f4/stress-${PV}.tar.gz \
> >> +           file://texinfo.patch \
> >> +           "
> >> +
> >> +SRC_URI[md5sum] =3D "a607afa695a511765b40993a64c6e2f4"
> >> +SRC_URI[sha256sum] =3D
> "369c997f65e8426ae8b318d4fdc8e6f07a311cfa77cc4b25dace465c582163c0
> "
> >> +
> >> +inherit autotools
> >> --
> >> 1.7.0.4
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

