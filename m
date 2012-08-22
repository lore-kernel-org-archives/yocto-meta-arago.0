Return-Path: <pprakash@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DAC7152A4B
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 22:42:55 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MMgsCw024793
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 17:42:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MMgsc6009638
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 17:42:54 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 22 Aug 2012 17:42:54 -0500
From: "Prakash, Punya" <pprakash@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago-extras][PATCH] av-examples: Port
	av-examples from Arago
Thread-Index: AQHNgGzqk+EPZ9QJNkWz0qh+1nwNv5dmt2KA//+xyi2AAAAroIAAVo6A//+sU9A=
Date: Wed, 22 Aug 2012 22:42:53 +0000
Message-ID: <03DB3D5A7C754F418CE076FD17499F235D1A0AC1@DLEE12.ent.ti.com>
References: <1345644077-4568-1-git-send-email-fcooper@ti.com>
	<20120822220515.GB8846@denix.org>
	<92A683A2-B3B9-4146-8FC0-5CFC1B0569CE@ti.com>
	<03DB3D5A7C754F418CE076FD17499F235D1A0A7D@DLEE12.ent.ti.com>
	<20120822223543.GJ21025@edge>
In-Reply-To: <20120822223543.GJ21025@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Aug 2012 22:45:55 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [meta-arago-extras][PATCH] av-examples: Port av-examples from Arago
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
X-List-Received-Date: Wed, 22 Aug 2012 22:42:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I should have probably mentioned that the recipe also includes audio exampl=
es such as audio capture and playback. Av-examples could be misleading sinc=
e it can imply multimedia while this is only demonstrating omap3 hardware f=
eatures.

I agree about the generic omap3 SoC.

Regards,
Punya


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, August 22, 2012 5:36 PM
To: Prakash, Punya
Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
Subject: Re: [meta-arago] [meta-arago-extras][PATCH] av-examples: Port av-e=
xamples from Arago

On Wed, Aug 22, 2012 at 06:32:24PM -0400, Prakash, Punya wrote:
> These examples demonstrate features of the display sub-system - such as=20
> rotation, color keying et. all. The DSS is supported on AM37x and AM3517=
=20
> based platforms only. I do not see why this cannot be added to the=20
> Beagleboard, adding it to the SDK is a different discussion.

Punya,

I see. Calling them av-examples is slightly misleading then, but that expla=
ins=20
the filtering. I guess a more generic "omap3" SoC should be used instead of=
=20
listing every machine in COMAPTIBLE_MACHINES...

--=20
Denys

> -----Original Message-----
> From: Cooper Jr., Franklin=20
> Sent: Wednesday, August 22, 2012 5:25 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org; Prakash, Punya
> Subject: Re: [meta-arago] [meta-arago-extras][PATCH] av-examples: Port av=
-examples from Arago
>=20
> I believe so. We only include it in those devices SDKs for a reason but I=
 am not sure why it is. Seeing MACHINE being passed to make also make me be=
lieve its specific to those devices. I know I tried building it for 335x an=
d received a bunch of errors.
>=20
> Punya,
> Can you verify that these examples are only for am37 and am35? Is there a=
 reason why beagleboard couldn't be supported? Or will the code run on all =
of our devices?=20
>=20
> We can restrict which devices include this app in our SDK but shouldn't e=
xclude other devices from running this app unless there is a reason.
>=20
> On Aug 22, 2012, at 5:05 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>=20
> > On Wed, Aug 22, 2012 at 09:01:17AM -0500, Franklin S Cooper Jr wrote:
> >> * Add av-examples from Arago
> >> * Convert svn repository to git. Update makefiles to create
> >>  needed directories since git doesn't allow empty directories
> >>  to be stored.
> >>=20
> >> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> >> ---
> >> .../av-examples/av-examples_1.0.bb                 |   33 ++++++++++++=
++++++++
> >> 1 files changed, 33 insertions(+), 0 deletions(-)
> >> create mode 100644 meta-arago-extras/recipes-multimedia/av-examples/av=
-examples_1.0.bb
> >>=20
> >> diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examp=
les_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1=
.0.bb
> >> new file mode 100644
> >> index 0000000..1025f96
> >> --- /dev/null
> >> +++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0=
.bb
> >> @@ -0,0 +1,33 @@
> >> +DESCRIPTION =3D "Linux Audio Video Example Applications"
> >> +HOMEPAGE =3D "https://gforge.ti.com/gf/project/av_examples/"
> >> +LICENSE =3D "BSD"
> >> +LIC_FILES_CHKSUM :=3D "file://COPYING;md5=3D80ea1ff5788f65d5c5b3206d5=
0d4bc6c"
> >> +SECTION =3D "system"
> >> +PRIORITY =3D "optional"
> >> +
> >> +PR =3D "r0"
> >> +
> >> +DEPENDS +=3D "virtual/kernel"
> >> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> +
> >> +COMPATIBLE_MACHINE =3D "(am37x-evm|am3517-evm)"
> >=20
> > We need to relax our filters for compatible machines. Those are Audio/V=
ideo=20
> > examples - are they really machine specific?
> >=20
> > --=20
> > Denys
> >=20
> >=20
> >> +BRANCH ?=3D "master"
> >> +SRCREV =3D "ac75d09d29a805d89c49dd2741b79f3069e97827"
> >> +
> >> +SRC_URI =3D "git://gitorious.org/av_examples/av_examples.git;protocol=
=3Dgit;branch=3D${BRANCH}"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +# TODO: Export LDFLAGS from Rules.make to eliminate use of INSANE_SKI=
P which would otherwise lead to discrepancies between host and arago binari=
es
> >> +INSANE_SKIP_${PN} =3D "True"
> >> +
> >> +do_compile() {
> >> +    touch debug
> >> +    export CROSS_COMPILE=3D${TARGET_PREFIX}
> >> +    make release LINUXKERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}" PL=
ATFORM=3D"${MACHINE}"
> >> +}
> >> +
> >> +do_install() {
> >> +    make DESTDIR=3D${D} install
> >> +}
> >> --=20
> >> 1.7.0.4
> >>=20
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>=20

