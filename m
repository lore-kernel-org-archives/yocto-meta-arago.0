Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737E9FD708D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:18:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86135.1773778701943369766
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 13:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 412D9406B9;
	Tue, 17 Mar 2026 20:18:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNz8VtBK6ixL; Tue, 17 Mar 2026 20:18:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DA9C340021;
	Tue, 17 Mar 2026 20:18:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9404217A443; Tue, 17 Mar 2026 16:18:15 -0400 (EDT)
Date: Tue, 17 Mar 2026 16:18:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, t-lannynd@ti.com,
	meta-arago@lists.yoctoproject.org, detheridge@ti.com,
	b-brnich@ti.com
Subject: Re: [meta-arago][master][PATCH] chromium: Add a patch to fix build
 against GLIBC 2.43
Message-ID: <20260317201815.GD11121@denix.org>
References: <20260317193808.343457-1-t-lannynd@ti.com>
 <3b8eb759-eeb0-4113-9873-504ecbca0db1@ti.com>
 <d3cb5d89-1668-4d7b-bb4a-b662152a7fb8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <d3cb5d89-1668-4d7b-bb4a-b662152a7fb8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 20:18:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17379

On Tue, Mar 17, 2026 at 03:01:22PM -0500, Antonios Christidis via lists.y=
octoproject.org wrote:
>=20
> On 3/17/26 2:56 PM, Ryan Eatmon wrote:
> >
> >
> >On 3/17/2026 2:38 PM, Thorsten Lannynd via lists.yoctoproject.org wrot=
e:
> >>An update to oe-core leads to build failures with Chromium v142.
> >>This fix
> >>is currently pending in meta-browser but is needed to get
> >>Chromium to build
> >>succesfully.
> >>
> >>https://github.com/OSSystems/meta-browser/pull/962/changes/4e450497be=
557fc4b5ff1397f78fa0f8381e281d
> >>
> >>
> >>Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> >>---
> >>=A0 .../fix-SYS_SECCOMP-redefinition.patch=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 16 ++++++++++++++++
> >>=A0 .../chromium/chromium-ozone-wayland-arago.inc=A0=A0=A0 |=A0 1 +
> >>=A0 2 files changed, 17 insertions(+)
> >>=A0 create mode 100644 meta-arago-distro/dynamic-layers/chromium-brow=
ser-layer/recipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/=
fix-SYS_SECCOMP-redefinition.patch
> >>
> >>diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/=
recipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SE=
CCOMP-redefinition.patch b/meta-arago-distro/dynamic-layers/chromium-brow=
ser-layer/recipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/=
fix-SYS_SECCOMP-redefinition.patch
> >>
> >>new file mode 100644
> >>index 00000000..594729b3
> >>--- /dev/null
> >>+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-r=
edefinition.patch
> >>@@ -0,0 +1,16 @@
> >>+Taken from:
> >>+https://aur.archlinux.org/cgit/aur.git/tree/0007-qt5-webengine-glibc=
-2.43-SYS_SECCOMP-as-enum@chromium.patch?h=3Dqt5-webengine
> >>
> >>+
> >>+Upstream-Status: Inappropriate [glibc 2.43 fix]
> >
> >I would argue that this is not "Inappropriate" as this is not an
> >OE specific kind of change.=A0 This should either be a Backport of a
> >patch that is pending on meta-browser, or Pending if you have
> >submitted this patch to the chromium project itself.
> >
> Could this be "Submitted [link]", link pointing to https://github.com/O=
SSystems/meta-browser/pull/962/changes/4e450497be557fc4b5ff1397f78fa0f838=
1e281d
> ?

Yes, this sounds correct ^^^


> >>+diff --git a/sandbox/linux/system_headers/linux_seccomp.h
> >>b/sandbox/linux/system_headers/linux_seccomp.h
> >>+index 8690a96eb0..8988836508 100644
> >>+--- a/sandbox/linux/system_headers/linux_seccomp.h
> >>++++ b/sandbox/linux/system_headers/linux_seccomp.h
> >>+@@ -6,6 +6,7 @@
> >>+ #define SANDBOX_LINUX_SYSTEM_HEADERS_LINUX_SECCOMP_H_
> >>+
> >>+ #include <stdint.h>
> >>++#include <signal.h>
> >>+ #include <sys/ioctl.h>
> >>+
> >>+ #include "build/build_config.h"
> >>diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/=
recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-di=
stro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chrom=
ium-ozone-wayland-arago.inc
> >>
> >>index 5b0f2703..3ec0610a 100644
> >>--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland-arago.inc
> >>+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland-arago.inc
> >>@@ -9,6 +9,7 @@ SRC_URI:append =3D " \
> >>file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patc=
h \
> >>file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patc=
h \
> >>file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patc=
h \
> >>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://fix-SYS_S=
ECCOMP-redefinition.patch \
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> >>=A0 =A0 # Override do_copy_clang_library to handle both target and
> >>host architectures

