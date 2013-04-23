Return-Path: <eyalr@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C5FBB52A96
	for <meta-arago@arago-project.org>;
	Tue, 23 Apr 2013 08:58:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3N8waGY008370
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2013 03:58:36 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3N8wZQr028478
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2013 03:58:35 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Tue, 23 Apr 2013 10:58:34 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH v3 1/9] wlconf: configuration utility for wilink8
	wireless driver
Thread-Index: AQHOPllFKSFZij3IpEiKATxOZMLFXJjjhIPg
Date: Tue, 23 Apr 2013 08:58:33 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C74011@DNCE04.ent.ti.com>
References: <1366524535-13207-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1366524535-13207-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/9] wlconf: configuration utility for wilink8 wireless driver
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
X-List-Received-Date: Tue, 23 Apr 2013 08:58:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping on this set of wilink8 related patches.

Regards,
Eyal

> -----Original Message-----
> From: Reizer, Eyal
> Sent: Sunday, April 21, 2013 9:09 AM
> To: meta-arago@arago-project.org
> Cc: Reizer, Eyal
> Subject: [PATCH v3 1/9] wlconf: configuration utility for wilink8
> wireless driver
>=20
> Add a recipe for building and installing the wlconf configuration
> utility for TI Wilink8 family of chips.
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
> Changes in v2:
> * Rename to use an actual release name instead of _git
> * Line indentation fixes
> Changes in v3:
> * Drop the PV assignment
>=20
>  .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb |   36
> ++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-
> connectivity/wlconf/wlconf_r8.a6.01.bb
>=20
> diff --git a/meta-arago-extras/recipes-
> connectivity/wlconf/wlconf_r8.a6.01.bb b/meta-arago-extras/recipes-
> connectivity/wlconf/wlconf_r8.a6.01.bb
> new file mode 100644
> index 0000000..ade2e84
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION =3D "Configuration utility for TI wireless drivers"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://README;beginline=3D1;endline=3D21;md5=3Dadc05a1903d3f107f85c90328=
e3a9
> 438"
> +
> +PR =3D"r1"
> +PR_append =3D "+gitr${SRCREV}"
> +
> +SRCREV =3D "ol_r8.a6.01"
> +SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git"
> +
> +S =3D "${WORKDIR}/git/wlconf"
> +
> +EXTRA_OEMAKE =3D "CC=3D${TARGET_PREFIX}gcc"
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -d ${D}${bindir}/wlconf/
> +	install -d ${D}${bindir}/wlconf/official_inis
> +
> +	install -m 0755 wlconf ${D}${bindir}/wlconf/
> +	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
> +	install -m 0755 struct.bin ${D}${bindir}/wlconf/
> +	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
> +	install -m 0755 README ${D}${bindir}/wlconf/
> +	install -m 0755 example.conf ${D}${bindir}/wlconf/
> +	install -m 0755 example.ini ${D}${bindir}/wlconf/
> +	install -m 0755 ${S}/official_inis/*
> +			${D}${bindir}/wlconf/official_inis/
> +}
> +
> +FILES_${PN} +=3D " \
> +	${bindir}/wlconf \
> +	${bindir}/wlconf/official_inis \
> +"
> +
> +FILES_${PN}-dbg +=3D "${bindir}/wlconf/.debug"
> --
> 1.7.9.5


