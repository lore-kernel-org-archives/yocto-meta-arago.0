Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 065CB52A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:09:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJ9p4I021906;
	Fri, 20 Jun 2014 14:09:51 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJ9p33018307;
	Fri, 20 Jun 2014 14:09:51 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:09:51 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 11/19] wl18xx-firmware: specify the branch
	being used for this version
Thread-Index: AQHPjLJuSPJXS+EL+ECKqnMQffrwOpt6XO0g
Date: Fri, 20 Jun 2014 19:09:50 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0D93C3@DLEE11.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-12-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-12-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 11/19] wl18xx-firmware: specify the branch being used for this version
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
X-List-Received-Date: Fri, 20 Jun 2014 19:09:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On second thought, looking at patch 12 is there any reason not to use a BRA=
NCH variable?


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, June 20, 2014 12:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 11/19] wl18xx-firmware: specify the
>branch being used for this version
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Bitbake fetcher now requires the branch to be specified when
>SRCREV is not on master
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
>| 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
>firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-
>firmware/wl18xx-firmware_r8.a8.10.bb
>index 5db1c99..b59f1c4 100644
>--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
>firmware_r8.a8.10.bb
>+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
>firmware_r8.a8.10.bb
>@@ -13,7 +13,7 @@ RCONFLICTS_${PN} +=3D "wl12xx-firmware"
>
> # Tag: ol_r8.a8.10
> SRCREV =3D "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
>-SRC_URI =3D "git://github.com/TI-
>OpenLink/wl18xx_fw.git;protocol=3Dgit \
>+SRC_URI =3D "git://github.com/TI-
>OpenLink/wl18xx_fw.git;protocol=3Dgit;branch=3Dmbss \
>            file://0001-Add-Makefile-for-SDK.patch \
>           "
>
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

