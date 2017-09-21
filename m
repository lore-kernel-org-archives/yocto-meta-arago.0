Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 90B5F52A1F
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 18:06:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LI6n5V008179
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 13:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506017209;
	bh=zQOYrofOLob5vAJh3ZltAO+VHv2Ix23CmJCYHiGQ8HY=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=Ii3UF59fWWywO8Gtd/j9kar2mCCZDZyON4akLFk4RS/ht2vpgPV0RUWTiPCf1YdQg
	mHm0Of8MQxWgjT0sg2Gaz94hyFk7XvEdO7Magu9cxa/x11VKfmoZP2Kui4PDEBRLBF
	/ntIqB6Bh1SzdoKA4ItydJxcNzxJYDcDSJ8JAkVM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LI6nXs016678
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 13:06:49 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 21 Sep 2017 13:06:49 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk] [PATCH]
	packagegroup-arago-*-addons: add icss-emac-lld for k2g-evm
Thread-Index: AQHTMiPNYuWksfCOJ0KcAX5juuiS56K/pHww
Date: Thu, 21 Sep 2017 18:06:49 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95825455E50@DFLE09.ent.ti.com>
References: <1505920735-9548-1-git-send-email-a0271529@ti.com>
In-Reply-To: <1505920735-9548-1-git-send-email-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] packagegroup-arago-*-addons: add icss-emac-lld for k2g-evm
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
X-List-Received-Date: Thu, 21 Sep 2017 18:06:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Gou, Hongmei
> Sent: Wednesday, September 20, 2017 11:19 AM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk] [PATCH]
> packagegroup-arago-*-addons: add icss-emac-lld for k2g-evm
>=20
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend |
> 3 ++-
>  .../packagegroup-arago-tisdk-addons-sdk-target.bbappend            | 7
> ++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-core/packagegroups/packagegroup-arago-test-
> addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-test-
> addons.bbappend
> index e477295..038d122 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-test-
> addons.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-test-
> addons.bbappend
> @@ -1,4 +1,4 @@
> -PR_append =3D ".tisdk6"
> +PR_append =3D ".tisdk7"
>=20
>  TEST_ADDONS_TI_append_keystone =3D " \
>      mmap-lld-test \
> @@ -29,3 +29,4 @@ TEST_ADDONS_TI_append_ti43x  =3D " \
>=20
>  TEST_ADDONS_TI_append_am335x-evm  =3D " icss-emac-lld-test"
>  TEST_ADDONS_TI_append_am437x-evm  =3D " icss-emac-lld-test"
> +TEST_ADDONS_TI_append_k2g-evm  =3D " icss-emac-lld-test"
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-
> sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-
> tisdk-addons-sdk-target.bbappend
> index 14e4930..aeabbc0 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-
> target.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-
> target.bbappend
> @@ -1,4 +1,4 @@
> -PR_append =3D "-tisdk25"
> +PR_append =3D "-tisdk26"
>=20
>  UTILS_append_ti33x =3D " \
>      opencv-dev \
> @@ -39,6 +39,11 @@ EXTRA_LIBS_append_k2e-evm =3D " \
>      netapi-staticdev \
>  "
>=20
> +EXTRA_LIBS_append_k2g-evm =3D " \
> +    icss-emac-lld-dev \
> +    icss-emac-lld-staticdev \
> +"
> +
>  EXTRA_LIBS_append_am57xx-evm =3D " \
>      osal-dev \
>      osal-staticdev \
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

