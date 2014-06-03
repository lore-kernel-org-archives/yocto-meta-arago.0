Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AA779529DD
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 14:40:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s53EelEc011701;
	Tue, 3 Jun 2014 09:40:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s53EelAA030153;
	Tue, 3 Jun 2014 09:40:47 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 3 Jun 2014 09:40:46 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 5/5] tisdk-rootfs-image: use correct
	packagegroup for Qt4/Qt5
Thread-Index: AQHPftPLs4rXvbomnU29z8dj+DgGi5tfdeZg
Date: Tue, 3 Jun 2014 14:40:46 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6C228E@DFLE08.ent.ti.com>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
	<1401762581-31370-6-git-send-email-denis@denix.org>
In-Reply-To: <1401762581-31370-6-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] tisdk-rootfs-image: use correct	packagegroup for Qt4/Qt5
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
X-List-Received-Date: Tue, 03 Jun 2014 14:40:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, June 02, 2014 9:30 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 5/5] tisdk-rootfs-image: use correct
> packagegroup for Qt4/Qt5
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> index 1bc6a36..0d7810a 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> @@ -5,7 +5,7 @@ require arago-base-tisdk-image.bb  IMAGE_INSTALL +=3D "\
>      packagegroup-arago-test \
>      ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-
> graphics','',d)} \
> -    packagegroup-arago-tisdk-qte \
> +
> + ${@base_contains('QT_PROVIDER','qt5','packagegroup-arago-tisdk-qt5','p
> + ackagegroup-arago-tisdk-qte',d)} \
>      packagegroup-arago-tisdk-addons \
>      packagegroup-arago-tisdk-connectivity \
>      packagegroup-arago-tisdk-crypto \
> --
> 1.9.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

