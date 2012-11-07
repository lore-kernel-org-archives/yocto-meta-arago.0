Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DCC8552A0E
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 15:15:34 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA7FFXqH027652;
	Wed, 7 Nov 2012 09:15:33 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA7FFX7R011594;
	Wed, 7 Nov 2012 09:15:33 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 7 Nov 2012 09:15:33 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago: make SDK/devkit
	relocatable
Thread-Index: AQHNvLGWOnmleQGJO0KGmAo/5PnwcJfefAIA
Date: Wed, 7 Nov 2012 15:15:32 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015929B566@DLEE12.ent.ti.com>
References: <1352269511-5899-1-git-send-email-denys@ti.com>
	<20121107063118.GB29763@denix.org>
In-Reply-To: <20121107063118.GB29763@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Wed, 07 Nov 2012 15:15:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Your script-fu is strong :)

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
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, November 07, 2012 12:31 AM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: make
> SDK/devkit relocatable
>=20
> On Wed, Nov 07, 2012 at 01:25:11AM -0500, Denys Dmytriyenko
> wrote:
> > Implement poor man's relocation technique for self-contained
> crosssdk binaries
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb |
> 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/meta/meta-
> toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-
> toolchain-arago.bb
> > index d2fe982..27782f7 100644
> > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-
> arago.bb
> > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-
> arago.bb
> > @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-
> ${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
> >
> >  require recipes-core/meta/meta-toolchain.bb
> >
> > -PR =3D "r5"
> > +PR =3D "r6"
> >
> >  SDKTARGETSYSROOT =3D "${SDKPATH}/${ARAGO_TARGET_SYS}"
> >
> > @@ -28,6 +28,7 @@ toolchain_create_sdk_env_script () {
> >  	echo 'export TARGET_SYS=3D${ARAGO_TARGET_SYS}' >> $script
> >  	echo 'export TARGET_PREFIX=3D$TARGET_SYS-' >> $script
> >  	echo 'export PATH=3D$SDK_PATH/bin:$PATH' >> $script
> > +	echo 'export
> LD_LIBRARY_PATH=3D$SDK_PATH/lib:$LD_LIBRARY_PATH' >> $script
> >  	echo 'export
> CPATH=3D$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
> >  	echo 'export PKG_CONFIG_SYSROOT_DIR=3D$SDK_PATH/$TARGET_SYS'
> >> $script
> >  	echo 'export
> PKG_CONFIG_PATH=3D$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >>
> $script
> > @@ -54,4 +55,5 @@ toolchain_create_sdk_env_script () {
> >  	echo 'export OECORE_ACLOCAL_OPTS=3D"-I
> $SDK_PATH/usr/share/aclocal"' >> $script
> >  	echo 'export OECORE_DISTRO_VERSION=3D"${DISTRO_VERSION}"' >>
> $script
> >  	echo 'export OECORE_SDK_VERSION=3D"${SDK_VERSION}"' >>
> $script
> > +	echo 'for i in `cd $SDK_PATH/bin; find -L ! -name
> "$TARGET_SYS-*" -type f -perm +111 -exec file {} \;|grep -v
> ":.*ASCII.*text"|cut -d":" -f1|cut -c3-`; do alias
> $i=3D"$SDK_PATH/lib/ld-linux.so.2 $SDK_PATH/bin/$i"; done' >>
> $script
>=20
> ^^^^^^^^^^^^^^^^^^^^
> Yep, that's pretty much it - several days of debugging, reseach
> and testing
> and the result is a one-liner script-fu...
>=20
> --
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

