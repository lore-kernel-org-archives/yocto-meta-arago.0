Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7A3C0529B0
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:42:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AFggfZ002633
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:42:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AFggK0002782
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:42:42 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:42:42 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 07/11]
	ti-connectivity/hostap-daemon-wl18xx:	Ensure version'd patch applied
	first
Thread-Index: AQHOxcnyE0oFwWGvmkGKuRmKzFvBpZnuEwhA
Date: Thu, 10 Oct 2013 15:42:41 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015979BD9D@DLEE11.ent.ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
	<1381420942-16810-8-git-send-email-r-monk@ti.com>
In-Reply-To: <1381420942-16810-8-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 07/11] ti-connectivity/hostap-daemon-wl18xx:	Ensure version'd patch applied first
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
X-List-Received-Date: Thu, 10 Oct 2013 15:42:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Monk, Roger
>Sent: Thursday, October 10, 2013 11:02 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv2 07/11] ti-connectivity/hostap-
>daemon-wl18xx: Ensure version'd patch applied first
>
>Signed-off-by: Roger Monk <r-monk@ti.com>
>---
> .../hostap/hostap-daemon-wl18xx_r8.a7.02.bb        |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-
>daemon-wl18xx_r8.a7.02.bb b/meta-arago-extras/recipes-
>connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb
>index 734a798..517462c 100644
>--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
>wl18xx_r8.a7.02.bb
>+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
>wl18xx_r8.a7.02.bb
>@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE =3D "(omap-a15)"
>
> PR_append =3D "c+gitr${SRCPV}"
>
>-FILESEXTRAPATHS_append :=3D "${THISDIR}/hostap-daemon:"
>+FILESEXTRAPATHS_append :=3D "${THISDIR}/hostap-daemon-wl18xx-
>r8.a7.02:${THISDIR}/hostap-daemon:"

Same question about whether full version is needed.

>
> # Add TI to the end to make it clear that this is a TI customized
>version
> # of hostap
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

