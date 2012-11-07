Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 371E352A0E
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 20:57:13 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA7KvCS8031035
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2012 14:57:12 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA7KvC0w000587
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2012 14:57:12 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 7 Nov 2012 14:57:12 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago: make SDK/devkit
	relocatable
Thread-Index: AQHNvSPCOnmleQGJO0KGmAo/5PnwcJfez1wggABsSoD//5uMoIAAZQQA//+dPsA=
Date: Wed, 7 Nov 2012 20:57:11 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015929C230@DLEE12.ent.ti.com>
References: <1352269511-5899-1-git-send-email-denys@ti.com>
	<20121107063118.GB29763@denix.org>
	<7D46E86EC0A8354091174257B2FED1015929B566@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C31A9FC@DFLE09.ent.ti.com>
	<20121107185847.GA11967@edge> <20121107200914.GD11967@edge>
	<7D46E86EC0A8354091174257B2FED1015929C0A7@DLEE12.ent.ti.com>
	<20121107204424.GE11967@edge>
	<7D46E86EC0A8354091174257B2FED1015929C175@DLEE12.ent.ti.com>
	<20121107204623.GF11967@edge>
In-Reply-To: <20121107204623.GF11967@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] meta-toolchain-arago: make SDK/devkit relocatable
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
X-List-Received-Date: Wed, 07 Nov 2012 20:57:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I did something like:

In environment-setup define a function like:

function qmake2() {
	LD_LIBRARY_PATH=3D${SDK_PATH}/lib:${LD_LIBRARY_PATH} ${SDK_PATH}/lib/ld-li=
nux.so.2 ${SDK_PATH}/bin/qmake2 $*
}

export -f qmake2

In the Makefile do something like:

    @. ${ENV_SETUP}; \
    qmake2 CONFIG+=3Ddebug_and_release QMAKE_CXXFLAGS_DEBUG+=3D-D${PLATFORM=
_DEFINE} QMAKE_CXXFLAGS_RELEASE+=3D-D${PLATFORM_DEFINE} matrix_browser.pro

I also defined a lot of other Qt tools, but something wasn't quite right be=
cause I kept getting output like=20

make -f Makefile.build release
make[1]: Entering directory `/home/a0271661/ti-sdk-am335x-evm-05.06.00.00/e=
xample-applications/matrix-gui-browser-2.0'
make -f Makefile.Release
make[2]: Entering directory `/home/a0271661/ti-sdk-am335x-evm-05.06.00.00/e=
xample-applications/matrix-gui-browser-2.0'
arm-arago-linux-gnueabi-g++ -c -pipe -pipe -pipe  -march=3Darmv7-a -fno-tre=
e-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=
=3Dcortex-a8 --sysroot=3D/home/a0271661/ti-sdk-am335x-evm-05.06.00.00/linux=
-devkit/arm-arago-linux-gnueabi  -march=3Darmv7-a -fno-tree-vectorize     -=
mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sys=
root=3D/home/a0271661/ti-sdk-am335x-evm-05.06.00.00/linux-devkit/arm-arago-=
linux-gnueabi -O2 -O2 -DPlatform_am335x-evm -Wall -W -Wall -W -Wall -W -D_R=
EENTRANT -DQT_QWS_CLIENTBLIT -DQT_NO_DEBUG -DQT_WEBKIT_LIB -DQT_GUI_LIB -DQ=
T_CORE_LIB -DQT_SHARED -I../../linux-devkit/arm-arago-linux-gnueabi/usr/sha=
re/qtopia/mkspecs/linux-g++ -I. -I/home/a0271661/ti-sdk-am335x-evm-05.06.00=
.00/linux-devkit/arm-arago-linux-gnueabi/usr/include/qtopia/QtCore -I/home/=
a0271661/ti-sdk-am335x-evm-05.06.00.00/linux-devkit/arm-arago-linux-gnueabi=
/usr/include/qtopia/QtGui -I/home/a0271661/ti-sdk-am335x-evm-05.06.00.00/li=
nux-devkit/arm-arago-linux-gnueabi/usr/include/qtopia/QtWebKit -I/home/a027=
1661/ti-sdk-am335x-evm-05.06.00.00/linux-devkit/arm-arago-linux-gnueabi/usr=
/include/qtopia -I. -Irelease -o release/main.o main.cpp
make[2]: *** [release/main.o] Segmentation fault
make[2]: Leaving directory `/home/a0271661/ti-sdk-am335x-evm-05.06.00.00/ex=
ample-applications/matrix-gui-browser-2.0'
make[1]: *** [release] Error 2
make[1]: Leaving directory `/home/a0271661/ti-sdk-am335x-evm-05.06.00.00/ex=
ample-applications/matrix-gui-browser-2.0'
make: *** [release] Error 2

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
> Sent: Wednesday, November 07, 2012 2:46 PM
> To: Maupin, Chase
> Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: make SDK/devkit
> relocatable
>=20
> Did it work for you? What did you do? It didn't seem to work for me with
> the
> functions...
>=20
>=20
> On Wed, Nov 07, 2012 at 03:45:20PM -0500, Maupin, Chase wrote:
> > I'll wait for that then.  I got it half working with the function
> export, but it isn't all the way there.
> >
> > Sincerely,
> > Chase Maupin
> > Software Applications
> > ARM MPU
> > e-mail: chase.maupin@ti.com
> > phone: (214) 567-2950
> >
> > For support:
> > Forums - http://community.ti.com/forums/
> > Wiki - http://wiki.davincidsp.com/
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Wednesday, November 07, 2012 2:44 PM
> > > To: Maupin, Chase
> > > Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: make
> SDK/devkit
> > > relocatable
> > >
> > > Good luck with that - been there, done that, didn't work for me :)
> > > I have something that works, will be sending a v2 patch shortly.
> > >
> > > Denys
> > >
> > >
> > > On Wed, Nov 07, 2012 at 03:17:58PM -0500, Maupin, Chase wrote:
> > > > Yeah, I've been playing with this myself with no luck.
> > > >
> > > > I did see some people say that if you had functions exported and
> did
> > > export -f <function> it might work.  I'm going to try this.
> > > >
> > > > Sincerely,
> > > > Chase Maupin
> > > > Software Applications
> > > > ARM MPU
> > > > e-mail: chase.maupin@ti.com
> > > > phone: (214) 567-2950
> > > >
> > > > For support:
> > > > Forums - http://community.ti.com/forums/
> > > > Wiki - http://wiki.davincidsp.com/
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > > > > Sent: Wednesday, November 07, 2012 2:09 PM
> > > > > To: Cooper Jr., Franklin
> > > > > Cc: meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: make
> > > > > SDK/devkit relocatable
> > > > >
> > > > > Nope, aliases are not accessible from Makefiles, need to switch
> > > > > gears...
> > > > >
> > > > >
> > > > > On Wed, Nov 07, 2012 at 01:58:47PM -0500, Denys Dmytriyenko
> > > > > wrote:
> > > > > > The only worry I have is whether aliases are going to work in
> a
> > > > > Makefile
> > > > > >
> > > > > >
> > > > > > On Wed, Nov 07, 2012 at 01:53:57PM -0500, Cooper Jr., Franklin
> > > > > wrote:
> > > > > > > Looks great
> > > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-
> > > > > arago-bounces@arago-project.org] On Behalf Of Maupin, Chase
> > > > > > > Sent: Wednesday, November 07, 2012 9:16 AM
> > > > > > > To: Denys Dmytriyenko; Dmytriyenko, Denys
> > > > > > > Cc: meta-arago@arago-project.org
> > > > > > > Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: make
> > > > > SDK/devkit relocatable
> > > > > > >
> > > > > > > Your script-fu is strong :)
> > > > > > >
> > > > > > > Sincerely,
> > > > > > > Chase Maupin
> > > > > > > Software Applications
> > > > > > > ARM MPU
> > > > > > > e-mail: chase.maupin@ti.com
> > > > > > > phone: (214) 567-2950
> > > > > > >
> > > > > > > For support:
> > > > > > > Forums - http://community.ti.com/forums/ Wiki -
> > > > > http://wiki.davincidsp.com/
> > > > > > >
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-
> > > > > arago-
> > > > > > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > > > > > Sent: Wednesday, November 07, 2012 12:31 AM
> > > > > > > > To: Dmytriyenko, Denys
> > > > > > > > Cc: meta-arago@arago-project.org
> > > > > > > > Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago:
> > > > > make
> > > > > > > > SDK/devkit relocatable
> > > > > > > >
> > > > > > > > On Wed, Nov 07, 2012 at 01:25:11AM -0500, Denys
> Dmytriyenko
> > > > > > > > wrote:
> > > > > > > > > Implement poor man's relocation technique for self-
> > > > > contained
> > > > > > > > crosssdk binaries
> > > > > > > > >
> > > > > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > > > > ---
> > > > > > > > >  meta-arago-extras/recipes-core/meta/meta-toolchain-
> > > > > arago.bb |
> > > > > > > > 4 +++-
> > > > > > > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > > > > > >
> > > > > > > > > diff --git a/meta-arago-extras/recipes-core/meta/meta-
> > > > > > > > toolchain-arago.bb b/meta-arago-extras/recipes-
> > > > > core/meta/meta-
> > > > > > > > toolchain-arago.bb
> > > > > > > > > index d2fe982..27782f7 100644
> > > > > > > > > --- a/meta-arago-extras/recipes-core/meta/meta-
> toolchain-
> > > > > > > > arago.bb
> > > > > > > > > +++ b/meta-arago-extras/recipes-core/meta/meta-
> toolchain-
> > > > > > > > arago.bb
> > > > > > > > > @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-
> > > > > > > > ${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
> > > > > > > > >
> > > > > > > > >  require recipes-core/meta/meta-toolchain.bb
> > > > > > > > >
> > > > > > > > > -PR =3D "r5"
> > > > > > > > > +PR =3D "r6"
> > > > > > > > >
> > > > > > > > >  SDKTARGETSYSROOT =3D "${SDKPATH}/${ARAGO_TARGET_SYS}"
> > > > > > > > >
> > > > > > > > > @@ -28,6 +28,7 @@ toolchain_create_sdk_env_script () {
> > > > > > > > >  	echo 'export TARGET_SYS=3D${ARAGO_TARGET_SYS}' >>
> > > > > $script
> > > > > > > > >  	echo 'export TARGET_PREFIX=3D$TARGET_SYS-' >> $script
> > > > > > > > >  	echo 'export PATH=3D$SDK_PATH/bin:$PATH' >> $script
> > > > > > > > > +	echo 'export
> > > > > > > > LD_LIBRARY_PATH=3D$SDK_PATH/lib:$LD_LIBRARY_PATH' >> $scrip=
t
> > > > > > > > >  	echo 'export
> > > > > > > > CPATH=3D$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $scrip=
t
> > > > > > > > >  	echo 'export
> > > > > PKG_CONFIG_SYSROOT_DIR=3D$SDK_PATH/$TARGET_SYS'
> > > > > > > > >> $script
> > > > > > > > >  	echo 'export
> > > > > > > > PKG_CONFIG_PATH=3D$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig'
> > > > > >> $script
> > > > > > > > > @@ -54,4 +55,5 @@ toolchain_create_sdk_env_script () {
> > > > > > > > >  	echo 'export OECORE_ACLOCAL_OPTS=3D"-I
> > > > > > > > $SDK_PATH/usr/share/aclocal"' >> $script
> > > > > > > > >  	echo 'export
> > > > > OECORE_DISTRO_VERSION=3D"${DISTRO_VERSION}"' >>
> > > > > > > > $script
> > > > > > > > >  	echo 'export OECORE_SDK_VERSION=3D"${SDK_VERSION}"' >>
> > > > > > > > $script
> > > > > > > > > +	echo 'for i in `cd $SDK_PATH/bin; find -L ! -name
> > > > > > > > "$TARGET_SYS-*" -type f -perm +111 -exec file {} \;|grep -
> v
> > > > > > > > ":.*ASCII.*text"|cut -d":" -f1|cut -c3-`; do alias
> > > > > > > > $i=3D"$SDK_PATH/lib/ld-linux.so.2 $SDK_PATH/bin/$i"; done'
> >>
> > > > > $script
> > > > > > > >
> > > > > > > > ^^^^^^^^^^^^^^^^^^^^
> > > > > > > > Yep, that's pretty much it - several days of debugging,
> > > > > reseach and
> > > > > > > > testing and the result is a one-liner script-fu...
> > > > > > > >
> > > > > > > > --
> > > > > > > > Denys
> > > > > > > > _______________________________________________
> > > > > > > > meta-arago mailing list
> > > > > > > > meta-arago@arago-project.org
> > > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-
> > > > > arago
> > > > > > > _______________________________________________
> > > > > > > meta-arago mailing list
> > > > > > > meta-arago@arago-project.org
> > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > > > _______________________________________________
> > > > > > meta-arago mailing list
> > > > > > meta-arago@arago-project.org
> > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

