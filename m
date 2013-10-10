Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 59B1B5299B
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 14:36:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AEaQZq003980
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 09:36:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AEaQRn001895
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 09:36:26 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 09:36:26 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2]
	ti-connectivity/compat_wl18xx_r8.a6.01:	Update SRC_URI
Thread-Index: AQHOxUtUiyBH20MkdUufzer3d9+TmZnuAZOQ
Date: Thu, 10 Oct 2013 14:36:25 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015979B20E@DLEE11.ent.ti.com>
References: <1381366559-13586-1-git-send-email-r-monk@ti.com>
	<1381366559-13586-3-git-send-email-r-monk@ti.com>
In-Reply-To: <1381366559-13586-3-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 10 Oct 2013 14:36:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Monk, Roger
>Sent: Wednesday, October 09, 2013 7:56 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 2/2] ti-
>connectivity/compat_wl18xx_r8.a6.01: Update SRC_URI
>
>   * SRC_URI tag has changed (rebased?)
>   * Update SRC_URI to match r8.a6.01 tag
>
>Signed-off-by: Roger Monk <r-monk@ti.com>
>---
> .../ti-compat-wireless-wl18xx_r8.a6.01.bb          |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
>compat-wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-
>bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
>index 273c721..a69b7d6 100644
>--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
>wireless-wl18xx_r8.a6.01.bb
>+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
>wireless-wl18xx_r8.a6.01.bb
>@@ -21,7 +21,7 @@ PR =3D "${MACHINE_KERNEL_PR}"
> PR_append =3D "c"
>
> # Tags: ol_r8.a6.01
>-SRCREV_wl18xx =3D "1c0f45f0e8aec0823175f7ac977908888c424aa1"
>+SRCREV_wl18xx =3D "f076cdad1988daf207ad560db2fe96caaa7c596e"
> SRCREV_compat =3D "c37c46c4ab5085ba50f650d15854404983b8d09b"
> SRCREV_compat-wireless =3D
>"3ec9ecca2cb07584e115ba53117f0084fc8faa25"
>
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

