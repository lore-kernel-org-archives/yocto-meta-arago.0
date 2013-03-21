Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DAF71529D7
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 12:12:37 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LCCbl3018770
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:12:37 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LCCbOb022959
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:12:37 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 21 Mar 2013 07:12:37 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 07/17] hostap-daemon: Split recipe
Thread-Index: AQHOJQ90Ws9lVilieEyVb374nk9tA5iwYtGA//+svRA=
Date: Thu, 21 Mar 2013 12:12:37 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3F4A43@DFLE09.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-7-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015948EAC4@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015948EAC4@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 07/17] hostap-daemon: Split recipe
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
X-List-Received-Date: Thu, 21 Mar 2013 12:12:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Maupin, Chase
> Sent: Thursday, March 21, 2013 7:07 AM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 07/17] hostap-daemon: Split recipe
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > Sent: Tuesday, March 19, 2013 9:05 PM
> > To: meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: [meta-arago] [PATCH 07/17] hostap-daemon: Split recipe
> >
> > * Split recipe to allow multiple hostap-daemon recipes to share a
> > common .inc
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  ...d-change-conf-file-for-better-oob-startup.patch |    0
> >  .../hostap/hostap-daemon_git.bb                    |   61 ------
> > --------------
> >  .../hostap/hostap-daemon_r5.sp4.01.bb              |   11 ++++
> >  .../recipes-connectivity/hostap/hostap.inc         |   54
> > +++++++++++++++++
> >  4 files changed, 65 insertions(+), 61 deletions(-)  rename
> > meta-arago-extras/recipes-connectivity/hostap/{hostap-
> > daemon =3D> hostap-daemon-r5.sp4.01}/0001-hostapd-change-conf-file-
> > for-better-oob-startup.patch (100%)
> >  delete mode 100644 meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon_git.bb
> >  create mode 100644 meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon_r5.sp4.01.bb
> >  create mode 100644 meta-arago-extras/recipes-
> > connectivity/hostap/hostap.inc
> >
> > diff --git a/meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-
> > for-better-oob-startup.patch b/meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-
> > conf-file-for-better-oob-startup.patch
> > similarity index 100%
> > rename from meta-arago-extras/recipes-connectivity/hostap/hostap-
> > daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
> > rename to meta-arago-extras/recipes-connectivity/hostap/hostap-
> > daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-
> > startup.patch
> > diff --git a/meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon_git.bb b/meta-arago-
> > extras/recipes-connectivity/hostap/hostap-daemon_git.bb
> > deleted file mode 100644
> > index 424d55d..0000000
> > --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > daemon_git.bb
> > +++ /dev/null
> > @@ -1,61 +0,0 @@
> > -# This is a TI specific version of the hostap-daemon recipe for use
> > with the -# wl12xx wlan and bluetooth module.
> > -
> > -HOMEPAGE =3D "http://hostap.epitest.fi"
> > -DESCRIPTION =3D "User space daemon for extended IEEE 802.11
> management"
> > -SECTION =3D "kernel/userland"
> > -LICENSE =3D "GPLv2"
> > -LIC_FILES_CHKSUM =3D
> > "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e"
> > -
> > -DEPENDS =3D "libnl openssl"
> > -
> > -# Since this is a TI customized version of hostap-daemon do not make
> > this the -# default -DEFAULT_PREFERENCE =3D "-1"
> > -
> > -inherit update-rc.d
> > -INITSCRIPT_NAME=3D"hostapd"
> > -
> > -CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> > -
> > -# Add TI to the end to make it clear that this is a TI customized
> > version -# of hostap -PV =3D "2.0-devel-ti"
> > -
> > -PR =3D "r2+gitr${SRCPV}"
> > -
> > -SRCREV =3D "ol_R5.SP4.01"
> > -
> > -SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit
> > \
> > -	file://0001-hostapd-change-conf-file-for-better-oob-
> > startup.patch;patchdir=3D.. \
> > -	file://defconfig \
> > -	file://init"
> > -
> > -S =3D "${WORKDIR}/git/hostapd"
> > -
> > -do_configure() {
> > -	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
> > -	echo "CFLAGS +=3D -I${STAGING_INCDIR}" >> .config
> > -	echo "LIBS +=3D -L${STAGING_LIBDIR}" >> .config
> > -}
> > -
> > -do_compile() {
> > -	make
> > -}
> > -
> > -do_install() {
> > -	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
> > -	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
> > -	install -m 0755 ${S}/hostapd ${D}${sbindir}
> > -	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
> > -	install -m 755 ${WORKDIR}/init
> > ${D}${sysconfdir}/init.d/hostapd
> > -}
> > -
> > -# The default hostapd.conf file that is fetched from upstream is
> > using -# "a" band which is not supported by the 1271 chip.
> > -# modify it to use "g" band and default channel 6 and change the ssid
> > from -# "test" to a more meaningful name.
> > -
> > -updatercd_postinst () {
> > -:
> > -}
> > diff --git a/meta-arago-extras/recipes-
> > connectivity/hostap/hostap-daemon_r5.sp4.01.bb b/meta-arago-
> > extras/recipes-connectivity/hostap/hostap-daemon_r5.sp4.01.bb
> > new file mode 100644
> > index 0000000..a84c333
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > daemon_r5.sp4.01.bb
> > @@ -0,0 +1,11 @@
> > +# This is a TI specific version of the hostap-daemon recipe for
> > use with the
> > +# wl12xx wlan and bluetooth module.
> > +
> > +require hostap.inc
> > +
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D
> > "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e"
> > +
> > +PR_append =3D "a+gitr${SRCPV}"
> > +
> > +SRCREV =3D "ol_R5.SP4.01"
> > diff --git a/meta-arago-extras/recipes- connectivity/hostap/hostap.inc
> > b/meta-arago-extras/recipes- connectivity/hostap/hostap.inc new file
> > mode 100644 index 0000000..17d18a8
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> > @@ -0,0 +1,54 @@
> > +# This is a TI specific version of the hostap-daemon recipe for
> > use with the
> > +# wl12xx wlan and bluetooth module.
> > +
> > +HOMEPAGE =3D "http://hostap.epitest.fi"
> > +DESCRIPTION =3D "User space daemon for extended IEEE 802.11
> > management"
> > +SECTION =3D "kernel/userland"
> > +
> > +DEPENDS =3D "libnl openssl"
> > +
> > +# Since this is a TI customized version of hostap-daemon do not
> > make this the
> > +# default
> > +DEFAULT_PREFERENCE =3D "-1"
>=20
> This may raise an old discussion, but is the purpose of this to make sure=
 that
> this recipe is not used by default even for people using Arago?  I'm assu=
ming
> you want to make this available for people using custom distros, which is
> why this is not in the meta-arago-distro layer?
>=20
> Just checking if this is where you want to put the recipe and if you thin=
k the
> .inc file should set this DEFAULT_PREFERENCE because it will be common fo=
r
> all TI versions.

FC: Since this recipe is located in meta-arago-extras people should be able=
 to use this layer without using meta-arago-distro/Arago Distro. So since t=
his is a TI hacked version we don't want to force people to take our versio=
n unless they planned on doing so since this is meant for wilink 6 devices =
only.

>=20
> > +
> > +PR =3D "r3"
> > +
> > +inherit update-rc.d
> > +INITSCRIPT_NAME=3D"hostapd"
> > +
> > +CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> > +
> > +SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit
> > \
> > +           file://0001-hostapd-change-conf-file-for-better-oob-
> > startup.patch;patchdir=3D.. \
> > +           file://defconfig \
> > +	       file://init"
> > +
> > +S =3D "${WORKDIR}/git/hostapd"
> > +
> > +do_configure() {
> > +	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
> > +	echo "CFLAGS +=3D -I${STAGING_INCDIR}" >> .config
> > +	echo "LIBS +=3D -L${STAGING_LIBDIR}" >> .config }
> > +
> > +do_compile() {
> > +	make
> > +}
> > +
> > +do_install() {
> > +	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
> > +	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
> > +	install -m 0755 ${S}/hostapd ${D}${sbindir}
> > +	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
> > +	install -m 755 ${WORKDIR}/init
> > ${D}${sysconfdir}/init.d/hostapd
> > +}
> > +
> > +# The default hostapd.conf file that is fetched from upstream is
> > using
> > +# "a" band which is not supported by the 1271 chip.
> > +# modify it to use "g" band and default channel 6 and change the
> > ssid from
> > +# "test" to a more meaningful name.
> > +
> > +updatercd_postinst () {
> > +:
> > +}
> > +
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

