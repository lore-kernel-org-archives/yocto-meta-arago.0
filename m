Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id ABF3B52A8E
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 00:06:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9A06148003636
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 19:06:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9A061Yf025838
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 19:06:01 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 9 Oct 2013 19:06:01 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Monk, Roger" <r-monk@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/2]
	ti-connectivity/compat_wl18xx_r8.a6.01:	Update SRC_URI
Thread-Index: AQHOxUtUsw14VMzrlUSEU42BIog47pntDmu6
Date: Thu, 10 Oct 2013 00:06:01 +0000
Message-ID: <6B10753E-A555-4D14-B1B4-055F564D1D26@ti.com>
References: <1381366559-13586-1-git-send-email-r-monk@ti.com>,
	<1381366559-13586-3-git-send-email-r-monk@ti.com>
In-Reply-To: <1381366559-13586-3-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] ti-connectivity/compat_wl18xx_r8.a6.01:	Update SRC_URI
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
X-List-Received-Date: Thu, 10 Oct 2013 00:06:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The Wilink 8 recipes were initially created for AM335x on a 3.2 kernel.

Based on your other patch set is this updated tag supported on omap-a15 onl=
y or 3.8+ kernels only?



> On Oct 9, 2013, at 6:57 PM, "Monk, Roger" <r-monk@ti.com> wrote:
>=20
>   * SRC_URI tag has changed (rebased?)
>   * Update SRC_URI to match r8.a6.01 tag
>=20
> Signed-off-by: Roger Monk <r-monk@ti.com>
> ---
> .../ti-compat-wireless-wl18xx_r8.a6.01.bb          |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-w=
ireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wirele=
ss/ti-compat-wireless-wl18xx_r8.a6.01.bb
> index 273c721..a69b7d6 100644
> --- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless=
-wl18xx_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless=
-wl18xx_r8.a6.01.bb
> @@ -21,7 +21,7 @@ PR =3D "${MACHINE_KERNEL_PR}"
> PR_append =3D "c"
>=20
> # Tags: ol_r8.a6.01
> -SRCREV_wl18xx =3D "1c0f45f0e8aec0823175f7ac977908888c424aa1"
> +SRCREV_wl18xx =3D "f076cdad1988daf207ad560db2fe96caaa7c596e"
> SRCREV_compat =3D "c37c46c4ab5085ba50f650d15854404983b8d09b"
> SRCREV_compat-wireless =3D "3ec9ecca2cb07584e115ba53117f0084fc8faa25"
>=20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

