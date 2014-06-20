Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BB9EA52A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:10:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJA24Y030878;
	Fri, 20 Jun 2014 14:10:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJA1JS004878;
	Fri, 20 Jun 2014 14:10:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:10:01 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 13/19] wpa-supplicant: specify the branch
	being used for this version
Thread-Index: AQHPjLJvfMHtE8Z7AEixVr/+phMjX5t6XQ0Q
Date: Fri, 20 Jun 2014 19:10:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0D9402@DLEE11.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-14-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-14-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 13/19] wpa-supplicant: specify the branch being used for this version
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
X-List-Received-Date: Fri, 20 Jun 2014 19:10:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, June 20, 2014 12:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 13/19] wpa-supplicant: specify the
>branch being used for this version
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Bitbake fetcher now requires the branch to be specified when
>SRCREV is not on master
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
>| 1 +
> .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
>| 2 +-
> 2 files changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/meta-arago-extras/recipes-connectivity/wpa-
>supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb b/meta-arago-
>extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
>wl18xx_r8.a8.10.bb
>index 6340967..bfe617e 100644
>--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
>supplicant-wl18xx_r8.a8.10.bb
>+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
>supplicant-wl18xx_r8.a8.10.bb
>@@ -12,6 +12,7 @@ FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-
>supplicant:"
>
> # Tag: ol_r8.a8.10
> SRCREV =3D "257ab333aad993b4be81808524bc0d939c276058"
>+BRANCH =3D "mbss_suspend"
> PR_append =3D "b+gitr${SRCPV}"
>
> # Add ti to the PV to indicate that this is a TI modify version
>of wpa-supplicant.
>diff --git a/meta-arago-extras/recipes-connectivity/wpa-
>supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-
>connectivity/wpa-supplicant/wpa-supplicant.inc
>index 9678b1b..e0bda11 100644
>--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
>supplicant.inc
>+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
>supplicant.inc
>@@ -16,7 +16,7 @@ DEFAULT_PREFERENCE =3D "-1"
>
> PR =3D "r6"
>
>-SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit \
>+SRC_URI =3D "git://github.com/TI-
>OpenLink/hostap.git;protocol=3Dgit;branch=3D${BRANCH} \
>            file://defconfig \
>            file://defaults-sane \
>            file://wpa-supplicant.sh \
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

