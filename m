Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA86FF6E87
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 21:34:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.386.1773783236527362417
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 14:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E32040B96;
	Tue, 17 Mar 2026 21:33:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pv3lIounYh5I; Tue, 17 Mar 2026 21:33:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 48175406B9;
	Tue, 17 Mar 2026 21:33:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0FBB217A477; Tue, 17 Mar 2026 17:33:50 -0400 (EDT)
Date: Tue, 17 Mar 2026 17:33:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: t-lannynd@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, detheridge@ti.com,
	b-brnich@ti.com, a-christidis@ti.com
Subject: Re: [meta-arago][master][PATCH v2] chromium: Add a patch to fix
 build against GLIBC 2.43
Message-ID: <20260317213350.GF11121@denix.org>
References: <20260317211840.384483-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20260317211840.384483-1-t-lannynd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 21:34:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17390

On Tue, Mar 17, 2026 at 04:18:40PM -0500, Thorsten Lannynd via lists.yoct=
oproject.org wrote:
> From: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
>=20
> An update to oe-core leads to build failures with Chromium v142. This f=
ix
> is currently pending in meta-browser but is needed to get Chromium to b=
uild
> succesfully.
>=20
> Signed-off-by: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>

While I understsand that nested patches may be a bit confusing, but you d=
on't=20
need the original SoB for the yocto patch. And that is a minor issue - I'=
ll=20
let Ryan decide.


> ---
> v2:
> - Update From and Signed off to include original author
> - Update Upstream-Status to Submitted
>  .../fix-SYS_SECCOMP-redefinition.patch           | 16 ++++++++++++++++
>  .../chromium/chromium-ozone-wayland-arago.inc    |  1 +
>  2 files changed, 17 insertions(+)
>  create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-l=
ayer/recipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-S=
YS_SECCOMP-redefinition.patch
>=20
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECC=
OMP-redefinition.patch b/meta-arago-distro/dynamic-layers/chromium-browse=
r-layer/recipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fi=
x-SYS_SECCOMP-redefinition.patch
> new file mode 100644
> index 00000000..52085fbf
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-red=
efinition.patch
> @@ -0,0 +1,16 @@
> +Taken from:
> +https://aur.archlinux.org/cgit/aur.git/tree/0007-qt5-webengine-glibc-2=
.43-SYS_SECCOMP-as-enum@chromium.patch?h=3Dqt5-webengine
> +
> +Upstream-Status: Submitted [https://github.com/OSSystems/meta-browser/=
pull/962/changes/4e450497be557fc4b5ff1397f78fa0f8381e281d]
> +diff --git a/sandbox/linux/system_headers/linux_seccomp.h b/sandbox/li=
nux/system_headers/linux_seccomp.h
> +index 8690a96eb0..8988836508 100644
> +--- a/sandbox/linux/system_headers/linux_seccomp.h	2026-03-13 17:54:03=
.000000000 +0100
> ++++ b/sandbox/linux/system_headers/linux_seccomp.h	2026-03-16 08:52:25=
.509439677 +0100
> +@@ -6,6 +6,7 @@
> + #define SANDBOX_LINUX_SYSTEM_HEADERS_LINUX_SECCOMP_H_
> +
> + #include <stdint.h>
> ++#include <signal.h>
> + #include <sys/ioctl.h>
> +
> + #include "build/build_config.h"
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-dist=
ro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromiu=
m-ozone-wayland-arago.inc
> index 5b0f2703..3ec0610a 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland-arago.inc
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland-arago.inc
> @@ -9,6 +9,7 @@ SRC_URI:append =3D " \
>                    file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-a=
ccess-to-V4L.patch \
>                    file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-strea=
ming-in-V4L2.patch \
>                    file://0004-media-gpu-v4l2-Avoid-placing-incomplete-=
H264-access-.patch \
> +                  file://fix-SYS_SECCOMP-redefinition.patch \
>                    "
> =20
>  # Override do_copy_clang_library to handle both target and host archit=
ectures
> --=20
> 2.34.1

