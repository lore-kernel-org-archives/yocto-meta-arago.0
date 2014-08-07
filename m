Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 929B952996
	for <meta-arago@arago-project.org>;
	Thu,  7 Aug 2014 12:51:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s77CpAUQ031400;
	Thu, 7 Aug 2014 07:51:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77CpAuw012388;
	Thu, 7 Aug 2014 07:51:10 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 7 Aug 2014 07:51:10 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/4] arago.conf: cleanup and document
	additional package configuration
Thread-Index: AQHPsclbYFXQCGGg2UKYTj8eZ6W60ZvFGO5A
Date: Thu, 7 Aug 2014 12:51:09 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D1AD052@DLEE11.ent.ti.com>
References: <1407365627-29059-1-git-send-email-denis@denix.org>
	<1407365627-29059-4-git-send-email-denis@denix.org>
In-Reply-To: <1407365627-29059-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] arago.conf: cleanup and document additional package configuration
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
X-List-Received-Date: Thu, 07 Aug 2014 12:51:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, August 06, 2014 5:54 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 4/4] arago.conf: cleanup and document
>additional package configuration
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/conf/distro/arago.conf | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>
>diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
>arago-distro/conf/distro/arago.conf
>index 4927fe9..0074b8b 100644
>--- a/meta-arago-distro/conf/distro/arago.conf
>+++ b/meta-arago-distro/conf/distro/arago.conf
>@@ -19,17 +19,20 @@ NO32LIBS =3D "0"
> # Set our distro features, don't forget all the standard libc
>ones
> DISTRO_FEATURES =3D "alsa argp bluetooth ext2 irda largefile pcmcia
>usbgadget usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6
>pulseaudio ${DISTRO_FEATURES_LIBC}"
>
>-# Set additional distro features to enable Wayland and Weston
>+# Set additional distro features
> DISTRO_FEATURES +=3D "opengl pam"
>+
>+# Set preferred Qt version
>+QT_PROVIDER =3D "qt5"
>+
>+# Distro-specific package configuration
>+# Weston - use fbdev compositor and provide launcher
> PACKAGECONFIG_pn-weston =3D "fbdev launch"
>
> # Configure Qt5 flags (GLES is still required for qtdeclarative
>and qtwebkit)
> PACKAGECONFIG_GL_pn-qtbase =3D "gles2 linuxfb"
> PACKAGECONFIG_DISTRO_pn-qtbase =3D "icu"
>
>-# Set preferred Qt version
>-QT_PROVIDER =3D "qt5"
>-
> # ARM9 is not supported by the Linaro toolchain so default back
>to the Arago
> # toolchain for ARM9 based SOCs.
> TC_SANE_DEFAULT :=3D
>"${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}
>"
>--
>2.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

