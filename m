Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A770F529A7
	for <meta-arago@arago-project.org>;
	Mon, 16 Sep 2013 19:12:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8GJCqbL002629
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2013 14:12:52 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GJCpDM031587
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2013 14:12:51 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 16 Sep 2013 14:12:51 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/3] kernel.bbclass: Pull in tweaks from
	oe-core patch to local copy
Thread-Index: AQHOrXziV5EEu46bs0GteC/261u1rZm+C+2AgAq4hTA=
Date: Mon, 16 Sep 2013 19:12:50 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C552580@DFLE08.ent.ti.com>
References: <1378747771-6201-1-git-send-email-fcooper@ti.com>
	<1378747771-6201-2-git-send-email-fcooper@ti.com>
	<20130909182229.GB2503@edge>
In-Reply-To: <20130909182229.GB2503@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/3] kernel.bbclass: Pull in tweaks from oe-core patch to local copy
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
X-List-Received-Date: Mon, 16 Sep 2013 19:12:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, September 09, 2013 1:22 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/3] kernel.bbclass: Pull in tweaks from=
 oe-
> core patch to local copy
>=20
> On Mon, Sep 09, 2013 at 12:29:30PM -0500, Franklin S. Cooper Jr wrote:
> > The below patch has been submitted to oe-core. Modify local copy of
> > kernel.bbclass to mimic this patch until patch is upstreamed.
>=20
> Have you addressed the latest comments for the upstream patch:
>=20
> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/41748/
> focus=3D41752
[Franklin]=20
Nope somehow I missed that comment. I'll submit an updated version.
>=20
> I would prefer to avoid overlaying a complete class locally just for this=
 simple fix.
> Having a smaller bbappend with do_install_append() seems like a less intr=
usive
> change... Comments?
[Franklin] Based on the comment to my patch in oe-core the proper approach =
is to make the change via pkg_postinst. If appending/prepending a pkg_posti=
nst is possible then I have no issue not overlaying the entire class. Since=
 this change would be a per recipe change is there any reason not to direct=
ly modify the recipe in meta-ti to incorporate this change instead of havin=
g an append in meta-arago?
>=20
>=20
> > kernel.bbclass: Create symbolic link to add ${KERNEL_IMAGETYPE} to
> > boot package
> > * By default for some platforms U-boot assumes the kernel image is loca=
ted in
> >   the boot directory of the root filesystem.
> > * The kernel.bbclass already includes the kernel image in the /boot dir=
ectory
> >   but adds a version number to the file name.
> > * Create a symbolic link that names the kernel image in the exact way t=
hat
> >   U-boot expects.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  meta-arago-distro/classes/kernel.bbclass |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta-arago-distro/classes/kernel.bbclass
> > b/meta-arago-distro/classes/kernel.bbclass
> > index 3320747..1211911 100644
> > --- a/meta-arago-distro/classes/kernel.bbclass
> > +++ b/meta-arago-distro/classes/kernel.bbclass
> > @@ -109,6 +109,7 @@ kernel_do_install() {
> >  	install -d ${D}/${KERNEL_IMAGEDEST}
> >  	install -d ${D}/boot
> >  	install -m 0644 ${KERNEL_OUTPUT}
> > ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> > +	ln      -sf ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-
> ${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}
> >  	install -m 0644 System.map ${D}/boot/System.map-
> ${KERNEL_VERSION}
> >  	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> >  	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

