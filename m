Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1FDE95299B
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 14:36:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AEaAOo026717
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 09:36:10 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AEaAU3001558
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 09:36:10 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 09:36:10 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] ti-connectivity/wlconf_r8.a6.01: Fix
	missing line continuation in install method
Thread-Index: AQHOxUtbrbyOpl81ikiachukI2quQJnuAXJQ
Date: Thu, 10 Oct 2013 14:36:09 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015979B1ED@DLEE11.ent.ti.com>
References: <1381366559-13586-1-git-send-email-r-monk@ti.com>
	<1381366559-13586-2-git-send-email-r-monk@ti.com>
In-Reply-To: <1381366559-13586-2-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ti-connectivity/wlconf_r8.a6.01: Fix	missing line continuation in install method
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
X-List-Received-Date: Thu, 10 Oct 2013 14:36:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Monk, Roger
>Sent: Wednesday, October 09, 2013 7:56 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/2] ti-connectivity/wlconf_r8.a6.01:
>Fix missing line continuation in install method
>
>   * Broken recipe, fix line continuation
>
>Signed-off-by: Roger Monk <r-monk@ti.com>
>---
> .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta-arago-extras/recipes-
>connectivity/wlconf/wlconf_r8.a6.01.bb b/meta-arago-
>extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
>index 8cc932f..8076350 100644
>--- a/meta-arago-extras/recipes-
>connectivity/wlconf/wlconf_r8.a6.01.bb
>+++ b/meta-arago-extras/recipes-
>connectivity/wlconf/wlconf_r8.a6.01.bb
>@@ -25,7 +25,7 @@ do_install() {
> 	install -m 0755 README ${D}${bindir}/wlconf/
> 	install -m 0755 example.conf ${D}${bindir}/wlconf/
> 	install -m 0755 example.ini ${D}${bindir}/wlconf/
>-	install -m 0755 ${S}/official_inis/*
>+	install -m 0755 ${S}/official_inis/* \
> 			${D}${bindir}/wlconf/official_inis/
> }
>
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

