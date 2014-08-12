Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5F17252A1D
	for <meta-arago@arago-project.org>;
	Tue, 12 Aug 2014 14:21:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7CEKx5f023166
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 09:20:59 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CEKx8h003450
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 09:20:59 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 12 Aug 2014 09:20:59 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] evtest - update checksums
Thread-Index: AQHPti1p4Ys4oWBNRUKptlyxYTFlRZvNBHNA
Date: Tue, 12 Aug 2014 14:20:59 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F9C86@DFLE08.ent.ti.com>
References: <1407848417-4123-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1407848417-4123-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] evtest - update checksums
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
X-List-Received-Date: Tue, 12 Aug 2014 14:21:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I would normally acknowledge this but this patch is no longer necessary.

https://github.com/openembedded/meta-oe/commit/fe2bef61acec531acfecbcda1dc7=
6cb739f8f49e

Someone has fixed this problem in meta-oe for the same reason as your patch=
. They also switched to git. If you update your meta-oe sources and rebase =
you will already have this patch.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Tuesday, August 12, 2014 8:00 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] evtest - update checksums
>=20
> * The checksums no longer matched and caused a fetch error.
>=20
> This patch has been submitted to upstream meta-oe and when accepted the
> append can be removed.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-support/evtest/evtest_1.25.bbappend    |    4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-
> support/evtest/evtest_1.25.bbappend
>=20
> diff --git a/meta-arago-extras/recipes-support/evtest/evtest_1.25.bbappen=
d
> b/meta-arago-extras/recipes-support/evtest/evtest_1.25.bbappend
> new file mode 100644
> index 0000000..1c3b257
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/evtest/evtest_1.25.bbappend
> @@ -0,0 +1,4 @@
> +PR_append =3D "-arago0"
> +
> +SRC_URI[archive.md5sum] =3D "0ef3fe5e20fa2dee8994827d48482902"
> +SRC_URI[archive.sha256sum] =3D
> "6e93ef54f0aa7d263f5486ce4a14cac53cf50036bfd20cf045fef2b27ee6664b"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

