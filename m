Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B0D225298C
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 12:35:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31CZHeB019044
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 07:35:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31CZHso023500
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 07:35:17 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 1 Apr 2013 07:35:17 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 1 Apr 2013 07:35:17 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 09/17] wpa-supplicant: Split recipe
Thread-Index: AQHOJQ91F1opTtn4tkuNCVWuhGQNZZiwZEGAgBD6vyA=
Date: Mon, 1 Apr 2013 12:35:16 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C41876B@DFLE08.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-9-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015948EB56@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015948EB56@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 09/17] wpa-supplicant: Split recipe
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
X-List-Received-Date: Mon, 01 Apr 2013 12:35:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Maupin, Chase
> Sent: Thursday, March 21, 2013 7:12 AM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 09/17] wpa-supplicant: Split recipe
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > Sent: Tuesday, March 19, 2013 9:05 PM
> > To: meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: [meta-arago] [PATCH 09/17] wpa-supplicant: Split recipe
> >
> > * Split recipe to allow multiple versions of wpa-supplicant to exist.
> > * Rename recipe to match the actual version of the TI modified
> > wpa-supplicant.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../defconfig                                      |    0
> >  .../{wpa-supplicant_git.bb =3D> wpa-supplicant.inc}  |   15 +++++-
> > ---------
> >  .../wpa-supplicant/wpa-supplicant_r5.sp4.01.bb     |   13
> > +++++++++++++
> >  3 files changed, 18 insertions(+), 10 deletions(-)  rename
> > meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/{wpa-supplicant =3D> wpa-supplicant-r5.sp4.01}/defconfig
> > (100%)
> >  rename meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/{wpa-supplicant_git.bb =3D> wpa-supplicant.inc} (91%)  creat=
e
> > mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant_r5.sp4.01.bb
> >
> > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant/defconfig b/meta-arago-extras/recipes-
> > connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig
> > similarity index 100%
> > rename from meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant/defconfig
> > rename to meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant-r5.sp4.01/defconfig
> > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant_git.bb b/meta-arago-extras/recipes-
> > connectivity/wpa-supplicant/wpa-supplicant.inc
> > similarity index 91%
> > rename from meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant_git.bb
> > rename to meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant.inc
> > index 927a556..21ec6a3 100644
> > --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > supplicant_git.bb
> > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > supplicant.inc
> > @@ -5,10 +5,7 @@ DESCRIPTION =3D "A Client for Wi-Fi Protected Access
> > (WPA)."
> >  HOMEPAGE =3D "http://hostap.epitest.fi/wpa_supplicant/"
> >  BUGTRACKER =3D "http://hostap.epitest.fi/bugz/"
> >  SECTION =3D "network"
> > -LICENSE =3D "GPLv2 | BSD"
> > -LIC_FILES_CHKSUM =3D
> > "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
> > -
> > file://../README;md5=3D5cb758942d25f6f61fd4ac388fd446fa \
> > -
> > file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=3D8835156c8ab8ca
> > d6356ec7f39ebe3aba"
> > +
> >  DEPENDS =3D "gnutls dbus libnl openssl
> > ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng",
> "",d)}"
> >  RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase wpa-supplicant- cli"
> >
> > @@ -16,22 +13,19 @@ RRECOMMENDS_${PN} =3D "wpa-supplicant-
> passphrase
> > wpa-supplicant-cli"
> >  # wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
> >  DEFAULT_PREFERENCE =3D "-1"
> >
> > -SRCREV =3D "ol_R5.SP4.01"
> > -PR =3D "r3+gitr${SRCPV}"
> > -# Add ti to the PV to indicate that this is a TI modify version of
> > wpa-supplicant.
> > -PV =3D "2.0-devel-ti"
> > +PR =3D "r4"
> >
> >  SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit
> > \
> >             file://defconfig \
> >             file://defaults-sane \
> >             file://wpa-supplicant.sh \
> > -           file://kill_wpa_supplicant.sh \
> >             file://wpa_supplicant.conf \
> >             file://wpa_supplicant.conf-sane \
> >             file://99_wpa_supplicant \
> >             file://wpa_supplicant.conf \
> >             file://fi.epitest.hostap.WPASupplicant.service \
> >             file://fi.w1.wpa_supplicant1.service \
> > +           file://kill_wpa_supplicant.sh \
>=20
> Why the re-order
Not sure why things got reordered. I ended up moving kill_wpa_supplicant to=
 its own recipe so this issue is fixed in my updated patches.
>=20
> >            "
> >
> >  S =3D "${WORKDIR}/git/wpa_supplicant"
> > @@ -54,7 +48,6 @@ do_install () {
> >  	install -m 755 wpa_supplicant ${D}${sbindir}
> >  	install -m 755 wpa_passphrase ${D}${sbindir}
> >  	install -m 755 wpa_cli        ${D}${sbindir}
> > -	install -m 755 ${WORKDIR}/kill_wpa_supplicant.sh
> > ${D}${sbindir}
> >
> >  	install -d ${D}${docdir}/wpa_supplicant
> >  	install -m 644 README ${WORKDIR}/wpa_supplicant.conf
> > ${D}${docdir}/wpa_supplicant @@ -93,6 +86,8 @@ do_install () {
> >  	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}/etc
> >  	install -m 644
> > ${WORKDIR}/fi.epitest.hostap.WPASupplicant.service
> > ${D}/usr/share/dbus-1/system-services
> >  	install -m 644 ${WORKDIR}/fi.w1.wpa_supplicant1.service
> > ${D}/usr/share/dbus-1/system-services
> > +
> > +	install -m 755 ${WORKDIR}/kill_wpa_supplicant.sh
> > ${D}${sbindir}
>=20
> Same question, why the re-order?
>=20
> >  }
> >
> >  pkg_postinst_wpa-supplicant () {
> > diff --git a/meta-arago-extras/recipes-connectivity/wpa-
> > supplicant/wpa-supplicant_r5.sp4.01.bb b/meta-arago-
> > extras/recipes-connectivity/wpa-supplicant/wpa-
> > supplicant_r5.sp4.01.bb
> > new file mode 100644
> > index 0000000..e23f3df
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> > supplicant_r5.sp4.01.bb
> > @@ -0,0 +1,13 @@
> > +# This is a TI specific version of the wpa-supplicant recipe for
> > use with the
> > +# wl12xx wlan and bluetooth module.
> > +
> > +require wpa-supplicant.inc
> > +
> > +LICENSE =3D "GPLv2 | BSD"
> > +LIC_FILES_CHKSUM =3D
> > "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
> > +
> > file://../README;md5=3D5cb758942d25f6f61fd4ac388fd446fa \
> > +
> > file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=3D8835156c8ab8ca
> > d6356ec7f39ebe3aba"
> > +
> > +
> > +SRCREV =3D "ol_R5.SP4.01"
> > +PR_append =3D "-a+gitr${SRCPV}"
>=20
> Question about the PR append consistency with other recipes.  Same as
> previous feedback, do you need the "-" or just append the "a"?
>=20
My recipes with PR_append usually includes the dash. I made the changes to =
recipes that have MACHINE_KERNEL_PR since you mentioned that is the style u=
sed in meta-ti. But in meta-arago usually the dash is added and in some ins=
tances a dot is used. I am going to leave the dash as is for now but I don'=
t mind creating patch later on that uses 1 particular append style for all =
recipes/appends in meta-arago.=20
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

