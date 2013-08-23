Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0697652A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:23:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NKNFP4017880;
	Fri, 23 Aug 2013 15:23:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKNF4f017591;
	Fri, 23 Aug 2013 15:23:15 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 15:23:15 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/4] toolchain-linaro.inc: set default
	tunes	for am437x-evm
Thread-Index: AQHOoD3CkCrVNzktDkm9p2WDDqsXp5mjPJ6A
Date: Fri, 23 Aug 2013 20:23:15 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DF221@DLEE11.ent.ti.com>
References: <1377289002-20230-1-git-send-email-denis@denix.org>
	<1377289002-20230-2-git-send-email-denis@denix.org>
In-Reply-To: <1377289002-20230-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] toolchain-linaro.inc: set default tunes	for am437x-evm
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
X-List-Received-Date: Fri, 23 Aug 2013 20:23:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, August 23, 2013 3:17 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 2/4] toolchain-linaro.inc: set
>default tunes for am437x-evm
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/meta-arago-distro/conf/distro/include/toolchain-
>linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-
>linaro.inc
>index 45bc715..1ab13ee 100644
>--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
>+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
>@@ -7,6 +7,7 @@ DEFAULTTUNE =3D "cortexa8thf-neon"
> DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
> DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
> DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
>+DEFAULTTUNE_ti43x =3D "cortexa9thf-neon"
>
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D
>"external-linaro-toolchain"
>
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

