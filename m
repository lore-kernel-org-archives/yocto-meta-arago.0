Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DBDB45298A
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 20:37:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0RKbJ4H026106
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 14:37:19 -0600
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RKbI7m030891
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 14:37:18 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::241b:72d1:4d31:6379%29]) with mapi id
	14.02.0342.003; Mon, 27 Jan 2014 21:37:18 +0100
From: "Machani, Yaniv" <yanivma@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/3] wl18xx wlconf: add missing default bin
Thread-Index: AQHPG51W9gbTgg8Ys0S2BO7hJq+LzpqY9i0AgAAQ9CA=
Date: Mon, 27 Jan 2014 20:37:17 +0000
Message-ID: <AE1C82FB3D0EC64DB1F752C81CBD11012626E0AC@DFRE01.ent.ti.com>
References: <1390853985-8457-1-git-send-email-yanivma@ti.com>
	<1390853985-8457-3-git-send-email-yanivma@ti.com>
	<20140127203349.GM6814@edge>
In-Reply-To: <20140127203349.GM6814@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.42]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/3] wl18xx wlconf: add missing default bin
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
X-List-Received-Date: Mon, 27 Jan 2014 20:37:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, January 27, 2014 10:34 PM
To: Machani, Yaniv
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 3/3] wl18xx wlconf: add missing default bi=
n

On Mon, Jan 27, 2014 at 10:19:45PM +0200, Yaniv Mahani wrote:
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Add missing configuration file, eliminate loading error message.
> - Update to latest version.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../{wlconf_r8.a8.08.bb =3D> wlconf_r8.a8.10.bb}     |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)  rename=20
> meta-arago-extras/recipes-connectivity/wlconf/{wlconf_r8.a8.08.bb =3D>=20
> wlconf_r8.a8.10.bb} (80%)
>=20
> diff --git=20
> a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb=20
> b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
> similarity index 80%
> rename from=20
> meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
> rename to=20
> meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
> index f4adc18..5f50e88 100644
> --- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
> +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
> @@ -2,11 +2,11 @@ DESCRIPTION =3D "Configuration utility for TI wireless =
drivers"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D1;endline=3D21;md5=3Dadc=
05a1903d3f107f85c90328e3a9438"
> =20
> -PR =3D"r0"
> +PR =3D"r1"
>  PR_append =3D "+gitr${SRCPV}"
> =20
> -# Tag: ol_r8.a8.08
> -SRCREV =3D "c976584589981c9ab8741d1819a5019e17cac13b"
> +# Tag: ol_r8.a8.10
> +SRCREV =3D "c50159d66af1786414b819ebcaa8b2571ae790a1"
>  SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git"
> =20
>  S =3D "${WORKDIR}/git/wlconf"
> @@ -17,12 +17,14 @@ do_install() {
>  	install -d ${D}${bindir}
>  	install -d ${D}${bindir}/wlconf/
>  	install -d ${D}${bindir}/wlconf/official_inis
> +	install -d ${D}/lib/firmware/ti-connectivity
> =20
>  	install -m 0755 wlconf ${D}${bindir}/wlconf/
>  	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
>  	install -m 0755 struct.bin ${D}${bindir}/wlconf/
>  	install -m 0755 default.conf ${D}${bindir}/wlconf/
>  	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
> +	install -m 0755 wl18xx-conf-default.bin=20
> +${D}/lib/firmware/ti-connectivity/wl18xx-conf.bin

So, do you need this same .bin file in both places - in /usr/bin/wlconf and=
 /lib/firmware/ti-connectivity?
[Machani, Yaniv] Yes, one is saved as default (under wlconf), the other can=
 be changed by user configuration.=20
When loading the driver, he looks for the file under ti-connectivity, if no=
thing is in there it prints an error, and uses the default.
The purpose is to eliminate the error message to have a clean load.


>  	install -m 0755 README ${D}${bindir}/wlconf/
>  	install -m 0755 example.conf ${D}${bindir}/wlconf/
>  	install -m 0755 example.ini ${D}${bindir}/wlconf/
> @@ -33,6 +35,7 @@ do_install() {
>  FILES_${PN} +=3D " \
>  	${bindir}/wlconf \
>  	${bindir}/wlconf/official_inis \
> +	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
>  "
> =20
>  FILES_${PN}-dbg +=3D "${bindir}/wlconf/.debug"
> --=20
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

