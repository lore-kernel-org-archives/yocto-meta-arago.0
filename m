Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD229C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 21:26:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1950.1672953972057181225
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 13:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F3B50409AE;
	Thu,  5 Jan 2023 21:26:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7NESBlKBJJZ; Thu,  5 Jan 2023 21:26:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DA0D640027;
	Thu,  5 Jan 2023 21:26:09 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 605581636C0;
	Thu,  5 Jan 2023 16:25:53 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] libdrm: remove alternative setup for kmstest
Date: Thu,  5 Jan 2023 21:26:08 +0000
Message-Id: <20230105212608.2105546-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Jan 2023 21:26:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14159

From: Denys Dmytriyenko <denys@konsulko.com>

libdrm no longer provides kms driver and tests for it.

Fixes:

WARNING: libdrm-2.4.114-r0.arago3 do_package: libdrm: alternative target =
(/usr/bin/kmstest or /usr/bin/kmstest.libdrm) does not exist, skipping...
WARNING: libdrm-2.4.114-r0.arago3 do_package: libdrm: NOT adding alternat=
ive provide /usr/bin/kmstest: /usr/bin/kmstest.libdrm does not exist
WARNING: libdrm-2.4.114-r0.arago3 do_package: libdrm: alt_link =3D=3D alt=
_target: /usr/bin/kmstest =3D=3D /usr/bin/kmstest

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/m=
eta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
index 85152b5f..ea8b5ca1 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
@@ -8,10 +8,4 @@ file://0001-libsync-add-support-for-pre-v4.7-kernels.pat=
ch \
 file://0002-Add-sync_fence_info-and-sync_pt_info.patch \
 "
=20
-PR:append =3D ".arago3"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY =3D "10"
-ALTERNATIVE:${PN} =3D "kmstest"
-ALTERNATIVE_LINK_NAME[kmstest] =3D "${bindir}/kmstest"
+PR:append =3D ".arago4"
--=20
2.25.1


