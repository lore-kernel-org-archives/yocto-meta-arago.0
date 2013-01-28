Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 003ED529AA
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:42:40 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0SHge1B016054;
	Mon, 28 Jan 2013 11:42:40 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0SHgeUR006264;
	Mon, 28 Jan 2013 11:42:40 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 28 Jan 2013 11:42:40 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "fcooperjr27@gmail.com"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH 31/32] meta-toolchain-arago: Remove
	remaining .la files
Thread-Index: AQHN/XygVWVBf/HJ8k+kZ3lAwvtOe5hfZUsA//+c9GA=
Date: Mon, 28 Jan 2013 17:42:39 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C37E0C6@DFLE09.ent.ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
	<1359393932-31361-31-git-send-email-fcooper@ti.com>
	<20130128173520.GA8971@denix.org>
In-Reply-To: <20130128173520.GA8971@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 31/32] meta-toolchain-arago: Remove remaining .la files
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
X-List-Received-Date: Mon, 28 Jan 2013 17:42:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I didn't see any issue. I just remember from our discussion you mention tha=
t there isn't any need for .la files since they cause more trouble than it'=
s worth.
I saw the extra la files remaining so I created this patch. I am fine with =
ignoring this patch if you don't think those la files would cause an issue.


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, January 28, 2013 11:35 AM
> To: fcooperjr27@gmail.com
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH 31/32] meta-toolchain-arago: Remove
> remaining .la files
>=20
> On Mon, Jan 28, 2013 at 11:25:31AM -0600, fcooperjr27@gmail.com wrote:
> > From: Franklin S. Cooper Jr <fcooper@ti.com>
> >
> > * The following .la files were not deleted from the toolchain sdk:
> >     libgfortranbegin.la
> >     /arago-2012.12/lib/gcc/arm-arago-linux-gnueabi/4.5.3
> >
> >     libbfd.la
> >     /arago-2012.12/i686-linux/arm-arago-linux-gnueabi/lib
> >
> >     libopcodes.la
> >     /arago-2012.12/i686-linux/arm-arago-linux-gnueabi/lib
> >
> > * Updating the path that find is using to insure all .la files are dele=
ted
> >   from the toolchain sdk.
>=20
> What was the problem with those .la files? They are part of host-side bin=
utils
> and gcc, so weren't supposed to be used for any SDK cross-compiling...
>=20
>=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-core/meta/meta-toolchain-arago.bb      |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.b=
b
> b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > index 332fe48..7428001 100644
> > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-
> ${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
> >
> >  require recipes-core/meta/meta-toolchain.bb
> >
> > -PR =3D "r14"
> > +PR =3D "r15"
> >
> >  SDKTARGETSYSROOT =3D "${SDKPATH}/${ARAGO_TARGET_SYS}"
> >
> > @@ -84,7 +84,7 @@ populate_sdk_ipk_append () {
> >  	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-
> arm', 'external-arago-sdk-toolchain', '', 'create_shell_stub
> ${TARGET_PREFIX}gdb yes', d)}
> >
> >  	# Remove broken .la files
> > -	for i in `find ${SDK_OUTPUT}/${SDKTARGETSYSROOT} -name \*.la`; do
> > +	for i in `find ${SDK_OUTPUT}/${SDKPATH} -name \*.la`; do
> >  		rm -f $i
> >  	done
> >  	rm -f ${SDK_OUTPUT}/${SDKPATH}/lib/*.la
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

