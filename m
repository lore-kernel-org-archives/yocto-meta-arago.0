Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3CAEB52090
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:40:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AFemVl012004
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:40:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AFempT031856
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:40:48 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:40:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 05/11]
	ti-connectivity/wpa-supplicant-wl18xx:	Ensure version'd patch applied
	first
Thread-Index: AQHOxcnwHscj3kWWH0iffSkuE0egDZnuCkfg
Date: Thu, 10 Oct 2013 15:40:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015979BD1E@DLEE11.ent.ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
	<1381420942-16810-6-git-send-email-r-monk@ti.com>
In-Reply-To: <1381420942-16810-6-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 05/11] ti-connectivity/wpa-supplicant-wl18xx:	Ensure version'd patch applied first
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
X-List-Received-Date: Thu, 10 Oct 2013 15:40:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Monk, Roger
>Sent: Thursday, October 10, 2013 11:02 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv2 05/11] ti-connectivity/wpa-
>supplicant-wl18xx: Ensure version'd patch applied first
>
>Signed-off-by: Roger Monk <r-monk@ti.com>
>---
> .../wpa-supplicant-wl18xx_r8.a7.02.bb              |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta-arago-extras/recipes-connectivity/wpa-
>supplicant/wpa-supplicant-wl18xx_r8.a7.02.bb b/meta-arago-
>extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
>wl18xx_r8.a7.02.bb
>index 0ea9ff5..392bff3 100644
>--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
>supplicant-wl18xx_r8.a7.02.bb
>+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
>supplicant-wl18xx_r8.a7.02.bb
>@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
>"file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
>
>file://../README;md5=3D5cb758942d25f6f61fd4ac388fd446fa \
>
>file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=3D8835156c8ab8cad
>6356ec7f39ebe3aba"
>
>-FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-supplicant:"
>+FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-supplicant-wl18xx-
>r8.a7.02:${THISDIR}/wpa-supplicant:"

Any reason this needs to be version specific directory instead of wpa-suppl=
icant-wl18xx?

>
> COMPATIBLE_MACHINE =3D "(omap-a15)"
>
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

