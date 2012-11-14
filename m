Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4B1D352A8E
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2012 22:26:58 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAEMQvI3024098
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2012 16:26:57 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAEMQvRH013073
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2012 16:26:57 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 14 Nov 2012 16:26:56 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago: special case for
	gdb to be built as part of canadian-cross-sdk
Thread-Index: AQHNwhs2QuM086pw50GQbqDW0wXzn5fpGRWA//+eIBSAAWBogP//z5eQ
Date: Wed, 14 Nov 2012 22:26:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592AA782@DLEE12.ent.ti.com>
References: <1352865012-11447-1-git-send-email-denys@ti.com>
	<20121114035851.GE13096@edge>
	<05B212D4-8433-4995-88CF-34CF07576A0D@ti.com>
	<20121114190950.GA31599@denix.org>
In-Reply-To: <20121114190950.GA31599@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] meta-toolchain-arago: special case for gdb to be built as part of canadian-cross-sdk
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
X-List-Received-Date: Wed, 14 Nov 2012 22:26:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I was able to execute the arm-arago-linux-gnueabi-gdb and run

python print 23

I did have to source environment-setup for the wrapper script to work.  As =
a though, could we do something like the following in these wrapper scripts=
?

if [ -n "$BASH_SOURCE" ]
then
    . `dirname $BASH_SOURCE`/../environment-setup
fi

I know this may not work for all shells, but like environment-setup itself,=
 in the case that it does work then user's don't get bitten not having it s=
ourced.  Also doesn't hurt them if the environment-setup is already sourced=
.  Thoughts?

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, November 14, 2012 1:10 PM
> To: Maupin, Chase
> Cc: Dmytriyenko, Denys; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: special
> case for gdb to be built as part of canadian-cross-sdk
>=20
> Any updates yet?
>=20
>=20
> On Wed, Nov 14, 2012 at 04:08:32AM +0000, Maupin, Chase wrote:
> > Thank you denys.  We will check for compatibility.  Thanks for
> the quick response on this.
> >
> > Sent from my cell phone
> >
> > ----- Reply message -----
> > From: "Dmytriyenko, Denys" <denys@ti.com>
> > Date: Tue, Nov 13, 2012 9:59 pm
> > Subject: [meta-arago] [PATCH] meta-toolchain-arago: special
> case for gdb to be built as part of canadian-cross-sdk
> > To: "meta-arago@arago-project.org" <meta-arago@arago-
> project.org>
> >
> > This provides the bare minimum to get the Python-enabled gdb-
> 7.4 into the
> > devkit and set it up properly. We would need to test it with
> gdbserver-7.2 and
> > run it through OSRB...
> >
> > --
> > Denys
> >
> >
> > On Tue, Nov 13, 2012 at 10:50:12PM -0500, Denys Dmytriyenko
> wrote:
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  meta-arago-extras/conf/distro/include/tcmode-external-
> arago.inc | 4 ++++
> > >  meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> | 9 ++++++++-
> > >  2 files changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arago-extras/conf/distro/include/tcmode-
> external-arago.inc b/meta-arago-
> extras/conf/distro/include/tcmode-external-arago.inc
> > > index 2ed3df2..3bc0fed 100644
> > > --- a/meta-arago-extras/conf/distro/include/tcmode-external-
> arago.inc
> > > +++ b/meta-arago-extras/conf/distro/include/tcmode-external-
> arago.inc
> > > @@ -30,6 +30,10 @@ PREFERRED_PROVIDER_glibc-thread-db =3D
> "external-arago-toolchain"
> > >  PREFERRED_PROVIDER_gcc-cross-canadian-
> ${TRANSLATED_TARGET_ARCH} ?=3D "external-arago-sdk-toolchain"
> > >  PREFERRED_PROVIDER_binutils-cross-canadian-
> ${TRANSLATED_TARGET_ARCH} ?=3D "external-arago-sdk-toolchain"
> > >
> > > +# Special case for gdb to be built as part of canadian-
> cross-sdk
> > > +bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D
> "${exec_prefix}/bin"
> > > +PREFERRED_PROVIDER_gdb-cross-canadian-
> ${TRANSLATED_TARGET_ARCH} =3D "gdb-cross-canadian-
> ${TRANSLATED_TARGET_ARCH}"
> > > +
> > >  GCCVERSION ?=3D "4.5%"
> > >  SDKGCCVERSION ?=3D "4.5%"
> > >  BINUVERSION ?=3D "2.20%"
> > > diff --git a/meta-arago-extras/recipes-core/meta/meta-
> toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-
> toolchain-arago.bb
> > > index 1683c1f..f780385 100644
> > > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-
> arago.bb
> > > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-
> arago.bb
> > > @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-
> ${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
> > >
> > >  require recipes-core/meta/meta-toolchain.bb
> > >
> > > -PR =3D "r7"
> > > +PR =3D "r8"
> > >
> > >  SDKTARGETSYSROOT =3D "${SDKPATH}/${ARAGO_TARGET_SYS}"
> > >
> > > @@ -54,6 +54,8 @@ toolchain_create_sdk_env_script () {
> > >        echo 'export OECORE_ACLOCAL_OPTS=3D"-I
> $SDK_PATH/usr/share/aclocal"' >> $script
> > >        echo 'export
> OECORE_DISTRO_VERSION=3D"${DISTRO_VERSION}"' >> $script
> > >        echo 'export OECORE_SDK_VERSION=3D"${SDK_VERSION}"' >>
> $script
> > > +     echo 'export PYTHONHOME=3D$SDK_PATH' >> $script
> > > +     echo 'export PYTHONPATH=3Dlib/python2.7' >> $script
> > >  }
> > >
> > >  populate_sdk_ipk_append () {
> > > @@ -64,4 +66,9 @@ populate_sdk_ipk_append () {
> > >                printf
> "#!/bin/sh\nLD_LIBRARY_PATH=3D\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH
> \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real
> \x24\x2a\n" > $i
> > >                chmod +x $i
> > >        done
> > > +
> > > +     # Special case for gdb, which is built as part of
> canadian-cross-sdk
> > > +     mv ${ARAGO_TARGET_SYS}-gdb ${ARAGO_TARGET_SYS}-gdb.real
> > > +     printf
> "#!/bin/sh\nLD_LIBRARY_PATH=3D\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH
> \x24SDK_PATH/lib/ld-linux.so.2
> \x24SDK_PATH/bin/${ARAGO_TARGET_SYS}-gdb.real \x24\x2a\n" >
> ${ARAGO_TARGET_SYS}-gdb
> > > +     chmod +x ${ARAGO_TARGET_SYS}-gdb
> > >  }
> > > --
> > > 1.8.0
> > >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


