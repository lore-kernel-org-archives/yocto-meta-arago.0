Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BDE2C52A6F
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 19:21:26 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8QJLQdN032417;
	Wed, 26 Sep 2012 14:21:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8QJLQ7w026011;
	Wed, 26 Sep 2012 14:21:26 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 26 Sep 2012 14:21:25 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH] openssl: Add SHA and MD5 large file patch
Thread-Index: AQHNmy/5JQ7r+tRMGEmiXZDgK2XL3pedU0QA//+uIcA=
Date: Wed, 26 Sep 2012 19:21:25 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2EE3CF@DFLE09.ent.ti.com>
References: <1348587310-25357-1-git-send-email-fcooper@ti.com>
	<20120926191246.GH4278@denix.org>
In-Reply-To: <20120926191246.GH4278@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] openssl: Add SHA and MD5 large file patch
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
X-List-Received-Date: Wed, 26 Sep 2012 19:21:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The bump was due to the TSU exemption recipe that I submitted awhile back b=
ut I didn't ping it or send an v2 of the recipe. I will send that updated r=
ecipe now.

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Wednesday, September 26, 2012 3:13 PM
To: Franklin S. Cooper Jr
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] openssl: Add SHA and MD5 large file patch

On Tue, Sep 25, 2012 at 10:35:10AM -0500, Franklin S. Cooper Jr wrote:
> * Add patch that allows SHA and MD5 operations to work with large=20
> files
> * Change from PR_INC to PR_append using meta-arago-distro append naming
>   convention.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  ...cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch |   59 ++++++++++++++=
++++++
>  .../openssl/openssl_1.0.0i.bbappend                |    8 +-
>  2 files changed, 63 insertions(+), 4 deletions(-)  create mode 100644=20
> meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng
> _cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
>=20
> diff --git=20
> a/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-e
> ng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch=20
> b/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-e
> ng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
> new file mode 100644
> index 0000000..9f3d1cb
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modi
> +++ fy-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
> @@ -0,0 +1,59 @@
> +From 6c7f195aadd770476b714f5c3075fbc74366d535 Mon Sep 17 00:00:00=20
> +2001
> +From: Greg Turner <gregturner@ti.com>
> +Date: Wed, 7 Mar 2012 15:45:53 -0600
> +Subject: [PATCH 2/2] Modify eng_cryptodev.c to make SHA1 and MD5 work=20
> +with big file sizes
> +
> +Upstream-Status: pending
> +	* Will be submitted upstream
> +
> +---
> + crypto/engine/eng_cryptodev.c |    6 ++++++
> + 1 files changed, 6 insertions(+), 0 deletions(-)
> +
> +diff --git a/crypto/engine/eng_cryptodev.c=20
> +b/crypto/engine/eng_cryptodev.c index 52f4ca3..44f3c10 100644
> +--- a/crypto/engine/eng_cryptodev.c
> ++++ b/crypto/engine/eng_cryptodev.c
> +@@ -42,6 +42,8 @@
> + # endif
> + #endif
> +
> ++#define OPENSSL_CRYPTODEF_HASH_NO_ONESHOT 1
> ++
> + #ifndef HAVE_CRYPTODEV
> +
> + void
> +@@ -711,6 +713,7 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, =
const void *data,
> +		return (0);
> +	}
> +
> ++#ifndef OPENSSL_CRYPTODEF_HASH_NO_ONESHOT
> +	if (!(ctx->flags & EVP_MD_CTX_FLAG_ONESHOT)) {
> +		/* if application doesn't support one buffer */
> +		state->mac_data =3D OPENSSL_realloc(state->mac_data, state->mac_len +=
=20
> +count); @@ -725,6 +728,7 @@ static int=20
> +cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
> +
> +		return (1);
> +	}
> ++#endif
> +
> +	memset(&cryp, 0, sizeof(cryp));
> +
> +@@ -755,6 +759,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, u=
nsigned char *md)
> +		return(0);
> +	}
> +
> ++#ifndef OPENSSL_CRYPTODEF_HASH_NO_ONESHOT
> +	if (! (ctx->flags & EVP_MD_CTX_FLAG_ONESHOT) ) {
> +		/* if application doesn't support one buffer */
> +		memset(&cryp, 0, sizeof(cryp));
> +@@ -773,6 +778,7 @@ static int cryptodev_digest_final(EVP_MD_CTX=20
> +*ctx, unsigned char *md)
> +
> +		return 1;
> +	}
> ++#endif
> +
> +	memcpy(md, state->digest_res, ctx->digest->md_size);
> +
> +--
> +1.7.0.4
> diff --git=20
> a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappe
> nd=20
> b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappe
> nd
> index 3536316..d7c677d 100644
> ---=20
> a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappe
> nd
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bb
> +++ append
> @@ -10,11 +10,11 @@
> =20
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
> -PR =3D "${INC_PR}.4"

The recipe in the repository has .3 above and don't see any other patches p=
ending for openssl...


> +PR_append =3D "-arago5"
> =20
> -SRC_URI +=3D " \
> -            file://find.pl \
> -            "
> +SRC_URI +=3D "file://find.pl \
> +            file://0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work=
-wit.patch \
> +"
> =20
>  do_configure_prepend() {
>    cp ${WORKDIR}/find.pl ${S}/util/find.pl
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

