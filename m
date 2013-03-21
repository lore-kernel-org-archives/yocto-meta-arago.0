Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E7583529A3
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 12:06:48 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LC6m3n018296
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:06:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LC6mPm016889
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:06:48 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 21 Mar 2013 07:06:47 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 07/17] hostap-daemon: Split recipe
Thread-Index: AQHOJRbnhu5HDA1zvUen6cFSHwFgPJiwDcMQ
Date: Thu, 21 Mar 2013 12:06:47 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948EAC4@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-7-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-7-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
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
X-List-Received-Date: Thu, 21 Mar 2013 12:06:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:05 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 07/17] hostap-daemon: Split recipe
>=20
> * Split recipe to allow multiple hostap-daemon recipes to share a
> common .inc
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  ...d-change-conf-file-for-better-oob-startup.patch |    0
>  .../hostap/hostap-daemon_git.bb                    |   61 ------
> --------------
>  .../hostap/hostap-daemon_r5.sp4.01.bb              |   11 ++++
>  .../recipes-connectivity/hostap/hostap.inc         |   54
> +++++++++++++++++
>  4 files changed, 65 insertions(+), 61 deletions(-)
>  rename meta-arago-extras/recipes-connectivity/hostap/{hostap-
> daemon =3D> hostap-daemon-r5.sp4.01}/0001-hostapd-change-conf-file-
> for-better-oob-startup.patch (100%)
>  delete mode 100644 meta-arago-extras/recipes-
> connectivity/hostap/hostap-daemon_git.bb
>  create mode 100644 meta-arago-extras/recipes-
> connectivity/hostap/hostap-daemon_r5.sp4.01.bb
>  create mode 100644 meta-arago-extras/recipes-
> connectivity/hostap/hostap.inc
>=20
> diff --git a/meta-arago-extras/recipes-
> connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-
> for-better-oob-startup.patch b/meta-arago-extras/recipes-
> connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-
> conf-file-for-better-oob-startup.patch
> similarity index 100%
> rename from meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
> rename to meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-
> startup.patch
> diff --git a/meta-arago-extras/recipes-
> connectivity/hostap/hostap-daemon_git.bb b/meta-arago-
> extras/recipes-connectivity/hostap/hostap-daemon_git.bb
> deleted file mode 100644
> index 424d55d..0000000
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon_git.bb
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -# This is a TI specific version of the hostap-daemon recipe for
> use with the
> -# wl12xx wlan and bluetooth module.
> -
> -HOMEPAGE =3D "http://hostap.epitest.fi"
> -DESCRIPTION =3D "User space daemon for extended IEEE 802.11
> management"
> -SECTION =3D "kernel/userland"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e"
> -
> -DEPENDS =3D "libnl openssl"
> -
> -# Since this is a TI customized version of hostap-daemon do not
> make this the
> -# default
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -inherit update-rc.d
> -INITSCRIPT_NAME=3D"hostapd"
> -
> -CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> -
> -# Add TI to the end to make it clear that this is a TI
> customized version
> -# of hostap
> -PV =3D "2.0-devel-ti"
> -
> -PR =3D "r2+gitr${SRCPV}"
> -
> -SRCREV =3D "ol_R5.SP4.01"
> -
> -SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit
> \
> -	file://0001-hostapd-change-conf-file-for-better-oob-
> startup.patch;patchdir=3D.. \
> -	file://defconfig \
> -	file://init"
> -
> -S =3D "${WORKDIR}/git/hostapd"
> -
> -do_configure() {
> -	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
> -	echo "CFLAGS +=3D -I${STAGING_INCDIR}" >> .config
> -	echo "LIBS +=3D -L${STAGING_LIBDIR}" >> .config
> -}
> -
> -do_compile() {
> -	make
> -}
> -
> -do_install() {
> -	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
> -	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
> -	install -m 0755 ${S}/hostapd ${D}${sbindir}
> -	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
> -	install -m 755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/hostapd
> -}
> -
> -# The default hostapd.conf file that is fetched from upstream is
> using
> -# "a" band which is not supported by the 1271 chip.
> -# modify it to use "g" band and default channel 6 and change the
> ssid from
> -# "test" to a more meaningful name.
> -
> -updatercd_postinst () {
> -:
> -}
> diff --git a/meta-arago-extras/recipes-
> connectivity/hostap/hostap-daemon_r5.sp4.01.bb b/meta-arago-
> extras/recipes-connectivity/hostap/hostap-daemon_r5.sp4.01.bb
> new file mode 100644
> index 0000000..a84c333
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon_r5.sp4.01.bb
> @@ -0,0 +1,11 @@
> +# This is a TI specific version of the hostap-daemon recipe for
> use with the
> +# wl12xx wlan and bluetooth module.
> +
> +require hostap.inc
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e"
> +
> +PR_append =3D "a+gitr${SRCPV}"
> +
> +SRCREV =3D "ol_R5.SP4.01"
> diff --git a/meta-arago-extras/recipes-
> connectivity/hostap/hostap.inc b/meta-arago-extras/recipes-
> connectivity/hostap/hostap.inc
> new file mode 100644
> index 0000000..17d18a8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> @@ -0,0 +1,54 @@
> +# This is a TI specific version of the hostap-daemon recipe for
> use with the
> +# wl12xx wlan and bluetooth module.
> +
> +HOMEPAGE =3D "http://hostap.epitest.fi"
> +DESCRIPTION =3D "User space daemon for extended IEEE 802.11
> management"
> +SECTION =3D "kernel/userland"
> +
> +DEPENDS =3D "libnl openssl"
> +
> +# Since this is a TI customized version of hostap-daemon do not
> make this the
> +# default
> +DEFAULT_PREFERENCE =3D "-1"

This may raise an old discussion, but is the purpose of this to make sure t=
hat this recipe is not used by default even for people using Arago?  I'm as=
suming you want to make this available for people using custom distros, whi=
ch is why this is not in the meta-arago-distro layer?

Just checking if this is where you want to put the recipe and if you think =
the .inc file should set this DEFAULT_PREFERENCE because it will be common =
for all TI versions.

> +
> +PR =3D "r3"
> +
> +inherit update-rc.d
> +INITSCRIPT_NAME=3D"hostapd"
> +
> +CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> +
> +SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit
> \
> +           file://0001-hostapd-change-conf-file-for-better-oob-
> startup.patch;patchdir=3D.. \
> +           file://defconfig \
> +	       file://init"
> +
> +S =3D "${WORKDIR}/git/hostapd"
> +
> +do_configure() {
> +	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
> +	echo "CFLAGS +=3D -I${STAGING_INCDIR}" >> .config
> +	echo "LIBS +=3D -L${STAGING_LIBDIR}" >> .config
> +}
> +
> +do_compile() {
> +	make
> +}
> +
> +do_install() {
> +	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
> +	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
> +	install -m 0755 ${S}/hostapd ${D}${sbindir}
> +	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
> +	install -m 755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/hostapd
> +}
> +
> +# The default hostapd.conf file that is fetched from upstream is
> using
> +# "a" band which is not supported by the 1271 chip.
> +# modify it to use "g" band and default channel 6 and change the
> ssid from
> +# "test" to a more meaningful name.
> +
> +updatercd_postinst () {
> +:
> +}
> +
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

