Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2F96E52A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:11:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJBHVa025171;
	Fri, 20 Jun 2014 14:11:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJBHvI006206;
	Fri, 20 Jun 2014 14:11:17 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:11:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 17/19] arago.conf: with unification on
	mainline, remove PACKAGE_ARCH logic
Thread-Index: AQHPjLJvs956hxOdzkKOLMIbdBhXg5t6XWjw
Date: Fri, 20 Jun 2014 19:11:16 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0D9519@DLEE11.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-18-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-18-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 17/19] arago.conf: with unification on mainline, remove PACKAGE_ARCH logic
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
X-List-Received-Date: Fri, 20 Jun 2014 19:11:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, June 20, 2014 12:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 17/19] arago.conf: with unification
>on mainline, remove PACKAGE_ARCH logic
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/conf/distro/arago.conf | 9 ---------
> 1 file changed, 9 deletions(-)
>
>diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
>arago-distro/conf/distro/arago.conf
>index 7bd1de2..b652fda 100644
>--- a/meta-arago-distro/conf/distro/arago.conf
>+++ b/meta-arago-distro/conf/distro/arago.conf
>@@ -72,12 +72,3 @@ ENTERPRISE_DISTRO =3D "1"
> # Arago based SDK. No need to prevent gst-ffmpeg from being used
>since we
> # disable troublesome software.
> LICENSE_FLAGS_WHITELIST =3D "commercial_gst-ffmpeg"
>-
>-# Some machines with the same architecture use different kernel
>versions.
>-# Set PACKAGE_ARCH to allow packages to be seperated by both
>architecture and
>-# linux-libc-headers version.
>-PACKAGE_ARCH :=3D "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-
>headers}"
>-# Need to include the new PACKAGE_ARCH to the PACKAGE_ARCHS
>variable
>-PACKAGE_ARCHS +=3D "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-
>headers}"
>-# Adjust some vars accordingly
>-STAGING_BINDIR_TOOLCHAIN =3D
>"${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}-
>${PREFERRED_VERSION_linux-libc-headers}${TARGET_VENDOR}-
>${TARGET_OS}"
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

