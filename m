Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1D41F52A1C
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 19:53:11 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0PJrAut010519;
	Fri, 25 Jan 2013 13:53:10 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0PJrAUk013585;
	Fri, 25 Jan 2013 13:53:10 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 25 Jan 2013 13:53:10 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH 42/47] Makefile_am-benchmarks: Renamed to
	Makefile_arm-benchmarks
Thread-Index: AQHN+zOZlCH6N1mcO0WeIi4M2gd09phac9aA
Date: Fri, 25 Jan 2013 19:53:08 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C37B80F@DFLE09.ent.ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
	<1359037281-12610-11-git-send-email-fcooper@ti.com>
	<20130125193807.GF23977@denix.org>
In-Reply-To: <20130125193807.GF23977@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Gerlach,
	Dave" <d-gerlach@ti.com>
Subject: Re: [PATCH 42/47] Makefile_am-benchmarks: Renamed to Makefile_arm-benchmarks
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
X-List-Received-Date: Fri, 25 Jan 2013 19:53:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The patch came from Dave Gerlach who sent it directly to me. So the From ad=
dress is correct.

I'll make the user.email change.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, January 25, 2013 1:38 PM
> To: Franklin S. Cooper Jr
> Cc: meta-arago@arago-project.org; Gerlach, Dave
> Subject: Re: [meta-arago] [PATCH 42/47] Makefile_am-benchmarks: Renamed
> to Makefile_arm-benchmarks
>=20
> On Thu, Jan 24, 2013 at 08:21:16AM -0600, Franklin S. Cooper Jr wrote:
> > From: dgerlach <d-gerlach@ti.com>
>=20
> ^^^^^ Can we get the correct From: line here?
>=20
> And while we are at it, Franklin, do you want to set your own user.email =
in git-
> config with the TI email, so your From: line matches your Signed-off-by:
> line? Right now it defaults to gmail address, since you send your patches
> through it...
>=20
> --
> Denys
>=20
>=20
> > * All references to am-benchmarks changed to arm-benchmarks for
> Makefile_arm-benchmarks
> >
> > ti-tisdk-makefile: Modified to use Makefile_arm-benchmarks rather than
> Makefile_am-benchmarks
> > ---
> >  .../ti-tisdk-makefile/Makefile_am-benchmarks       |   24 ------------=
--------
> >  .../ti-tisdk-makefile/Makefile_arm-benchmarks      |   24
> ++++++++++++++++++++
> >  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    6 ++--
> >  3 files changed, 27 insertions(+), 27 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/t=
i-
> tisdk-makefile/Makefile_am-benchmarks
> >  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/t=
i-
> tisdk-makefile/Makefile_arm-benchmarks
> >
> > diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk=
-
> makefile/Makefile_am-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisd=
k-
> makefile/ti-tisdk-makefile/Makefile_am-benchmarks
> > deleted file mode 100644
> > index ba0e0c6..0000000
> > --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_am-benchmarks
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -# am-benchmarks build targets
> > -am-benchmarks:
> > -	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > -	@echo    Building AM Benchmarks
> > -	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > -	@cd example-applications; cd `find . -name "*am-benchmarks*"`;
> make
> > -
> > -am-benchmarks_clean:
> > -	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > -	@echo    Cleaning AM Benchmarks
> > -	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > -	@cd example-applications; cd `find . -name "*am-benchmarks*"`;
> make clean
> > -
> > -am-benchmarks_install:
> > -	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -	@echo   Installing AM Benchmarks - Release version
> > -	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -	@cd example-applications; cd `find . -name "*am-benchmarks*"`;
> make install
> > -
> > -am-benchmarks_install_debug:
> > -	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -	@echo   Installing AM Benchmarks - Debug Version
> > -	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -	@cd example-applications; cd `find . -name "*am-benchmarks*"`;
> make install_debug
> > diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk=
-
> makefile/Makefile_arm-benchmarks b/meta-arago-distro/recipes-tisdk/ti-
> tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
> > new file mode 100644
> > index 0000000..0447ea5
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile/Makefile_arm-benchmarks
> > @@ -0,0 +1,24 @@
> > +# arm-benchmarks build targets
> > +arm-benchmarks:
> > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +	@echo    Building ARM Benchmarks
> > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`;
> make
> > +
> > +arm-benchmarks_clean:
> > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +	@echo    Cleaning ARM Benchmarks
> > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`;
> make clean
> > +
> > +arm-benchmarks_install:
> > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +	@echo   Installing ARM Benchmarks - Release version
> > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`;
> make install
> > +
> > +arm-benchmarks_install_debug:
> > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +	@echo   Installing ARM Benchmarks - Debug Version
> > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`;
> make install_debug
> > diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk=
-
> makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-ti=
sdk-
> makefile_1.0.bb
> > index 6208f21..a276140 100644
> > --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> > @@ -16,7 +16,7 @@ SRC_URI =3D "\
> >      file://Makefile_linux \
> >      file://Makefile_u-boot-legacy \
> >      file://Makefile_matrix-gui \
> > -    file://Makefile_am-benchmarks \
> > +    file://Makefile_arm-benchmarks \
> >      file://Makefile_am-sysinfo \
> >      file://Makefile_av-examples \
> >      file://Makefile_u-boot-spl \
> > @@ -29,11 +29,11 @@ SRC_URI =3D "\
> >      file://Makefile_wireless \
> >  "
> >
> > -PR =3D "r1"
> > +PR =3D "r2"
> >
> >  MAKEFILES_COMMON =3D "linux \
> >                      matrix-gui \
> > -                    am-benchmarks \
> > +                    arm-benchmarks \
> >                      am-sysinfo \
> >                      matrix-gui-browser \
> >                      refresh-screen \
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

