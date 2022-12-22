Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E67C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 22:12:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.58754.1671747136976429441
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 14:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E10C40C2C;
	Thu, 22 Dec 2022 22:12:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFyMAQ3ivJfE; Thu, 22 Dec 2022 22:12:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1793340027;
	Thu, 22 Dec 2022 22:12:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C55C21636B6;
	Thu, 22 Dec 2022 17:12:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell][PATCH 4/4] arago-image: fix bashisms
Date: Thu, 22 Dec 2022 22:12:05 +0000
Message-Id: <20221222221205.1312505-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222221205.1312505-1-denis@denix.org>
References: <20221222221205.1312505-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Dec 2022 22:12:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14135

From: Denys Dmytriyenko <denys@konsulko.com>

Remove postprocessing code for making /boot symlinks relative. That hasn'=
t
been needed for some time now - a more generic code for this is in OE-Cor=
e.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/images/arago-image.inc        | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta=
-arago-distro/recipes-core/images/arago-image.inc
index e068287e..5d517b2e 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -22,24 +22,6 @@ IMAGE_LINGUAS =3D ""
 TOOLCHAIN_HOST_TASK +=3D "nativesdk-buildtools-perl-dummy"
 SDK_PACKAGE_ARCHS +=3D "buildtools-dummy-${SDKPKGSUFFIX}"
=20
-make_bootfiles_symlinks_relative() {
-    for f in "${IMAGE_ROOTFS}/boot"/*
-    do
-        [ -L "$f" ] || continue
-
-        l=3D$(readlink "$f")
-        if [ "${l:0:6}" =3D=3D "/boot/" ]
-        then
-            ln -sf "${l##/boot/}" "$f"
-        elif ["${l:0:1}" =3D=3D "/" ]
-        then
-            ln -sf "..$l" "$f"
-        fi
-    done
-}
-
-ROOTFS_POSTPROCESS_COMMAND +=3D "make_bootfiles_symlinks_relative;"
-
 BAD_RECOMMENDATIONS +=3D " \
     ti-llvm3.6-dev \
     opencl-monitor-dev \
--=20
2.25.1


