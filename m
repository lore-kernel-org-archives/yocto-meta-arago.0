Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EF90952A1C
	for <meta-arago@arago-project.org>;
	Tue, 28 May 2013 19:03:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4SJ3UhT012667
	for <meta-arago@arago-project.org>; Tue, 28 May 2013 14:03:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4SJ3Txx022847
	for <meta-arago@arago-project.org>; Tue, 28 May 2013 14:03:29 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 28 May 2013 14:03:29 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] syslog-ng: added another plugin package
Thread-Index: AQHOW9WOc84ZNZ6EG0qsyUfzKN30SJka9CaQ
Date: Tue, 28 May 2013 19:03:29 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C477113@DFLE08.ent.ti.com>
References: <1369767590-17499-1-git-send-email-zhoujt@ti.com>
In-Reply-To: <1369767590-17499-1-git-send-email-zhoujt@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] syslog-ng: added another plugin package
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
X-List-Received-Date: Tue, 28 May 2013 19:03:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Why cant you make these tweaks as a bbappend rather than pulling in the ent=
ire recipe and files from meta-oe?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Zhou, Jingting
> Sent: Tuesday, May 28, 2013 2:00 PM
> To: meta-arago@arago-project.org
> Cc: Zhou, Jingting
> Subject: [meta-arago] [PATCH 2/2] syslog-ng: added another plugin package
>=20
> From: Jingting Zhou <zhoujt@ti.com>
>=20
> Note that an extra layer of directory needs to be added to include the so=
 files in
> the plugin package. Without it, there will be no so files in the plugin p=
ackage.
> And also some config file update because of the extra layer.
>=20
> Signed-off-by: Jingting Zhou <zhoujt@ti.com>
> ---
>  .../recipes-bsp/syslog-ng/syslog-ng.inc            |   21 ++++++++++++++=
++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc b/meta=
-
> arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
> index 584e4a4..ae85cf8 100755
> --- a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
> +++ b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D7ec1bcc46f28b11f4722e20d9b7dd4d5"
>  # update-rc.d and update-alternatives is important  RDEPENDS_${PN} +=3D =
"
> ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "",
> "update-rc.d", d)}"
>=20
> -INC_PR =3D "r9"
> +INC_PR =3D "r10"
>=20
>  inherit autotools
>=20
> @@ -25,6 +25,7 @@ EXTRA_OECONF =3D " \
>    --disable-linux-caps \
>    --disable-pcre \
>    --disable-sql \
> +  --disable-tcp-wrapper \
>  "
>=20
>  do_configure_prepend() {
> @@ -33,6 +34,13 @@ do_configure_prepend() {
>=20
>  # rename modules.conf because it breaks update-modules  # see
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
> October/035537.html
> +
> +do_compile_prepend() {
> +	sed -i "s/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-
> ng\"/\#define
> +PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\/plugins\"/"
> +${WORKDIR}/syslog-ng-3.2.5/config.h
> +}
> +
> +# changed the default PATH_MODULEDIR, added an extra level
> +
>  do_install_append() {
>          mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-module=
s.conf
>          sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g"
> ${D}/${sysconfdir}/scl.conf @@ -40,13 +48,22 @@ do_install_append() {
>          install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
>          install -d ${D}/${sysconfdir}/init.d
>          install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/s=
yslog.${PN}
> +	mkdir ${D}/${libdir}/syslog-ng/plugins/
> +	mv ${D}/${libdir}/syslog-ng/*.so ${D}/${libdir}/syslog-ng/plugins/
>  }
>=20
> +PACKAGES +=3D "${PN}-plugins"
> +FILES_${PN}-plugins +=3D "${libdir}/syslog-ng/plugins/*.so"
> +INSANE_SKIP_${PN}-plugins =3D "dev-so"
> +
> +# somehow the yocto doesn't allow so files in
> +"${libdir}/syslog-ng/*.so", even for the -plugin package, so add
> +another plugins level as in strongswan package # Without this
> +additional level, there is no .so files in the dir libdir/syslog-ng/,
> +for the -plugin package
> +
>  FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*=
${SOLIBS} \
>              ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>              ${base_bindir}/* ${base_sbindir}/* \
>              ${base_libdir}/*${SOLIBS} \
> -            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
> +            ${datadir}/${BPN} \
>              ${datadir}/include/scl/ ${datadir}/xsd"
>  FILES_${PN}-dev +=3D "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIB=
SDEV}"
>  CONFFILES_${PN} =3D "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf
> ${sysconfdir}/scl-modules.conf"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

