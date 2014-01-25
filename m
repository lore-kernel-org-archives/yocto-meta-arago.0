Return-Path: <joelf@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 30465529C6
	for <meta-arago@arago-project.org>;
	Sat, 25 Jan 2014 10:18:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0PAIAnD024688;
	Sat, 25 Jan 2014 04:18:10 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0PAI9ab028992;
	Sat, 25 Jan 2014 04:18:09 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Sat, 25 Jan 2014 04:18:09 -0600
From: "Fernandes, Joel" <joelf@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [PATCH] openssl: drop NO_ONESHOT patch to unbreak SHA1 and MD5
Thread-Index: AQHPGT6Snjy2hFTh20uevaARo/GnW5qVOv/u
Date: Sat, 25 Jan 2014 10:18:08 +0000
Message-ID: <EB6F2794-1FC7-43CF-9D3D-ACA0245ACF80@ti.com>
References: <1390593469-30757-1-git-send-email-denis@denix.org>
In-Reply-To: <1390593469-30757-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Feb 2014 20:42:03 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] openssl: drop NO_ONESHOT patch to unbreak SHA1 and MD5
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
X-List-Received-Date: Sat, 25 Jan 2014 10:18:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> On Jan 25, 2014, at 1:27 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> This is no longer required, according to Joel's testing.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Joel Fernandes <joelf@ti.com>

Acked-by: Joel Fernandes <joelf@ti.com>

> ---
> meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend | =
3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1=
e.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.=
bbappend
> index 4154225..9b6bf00 100644
> --- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbapp=
end
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbapp=
end
> @@ -12,7 +12,7 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> -PR_append =3D "-arago8"
> +PR_append =3D "-arago9"
>=20
> DEPENDS_append_ti33x_class-target =3D " cryptodev"
> DEPENDS_append_ti43x_class-target =3D " cryptodev"
> @@ -27,7 +27,6 @@ python __anonymous () {
>=20
> CRYPTODEV_AFALG_PATCHES =3D " \
>    file://0001-Add-AF_ALG-interface-support-to-OpenSSL.patch \
> -    file://0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.pat=
ch \
>    file://0004-Sample-AF_ALG-openssl.cnf.patch \
>    file://0001-eng_cryptodev.c-update-to-cryptodev-1.6.patch \
>    file://0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch=
 \
> --=20
> 1.8.3.2
>=20

