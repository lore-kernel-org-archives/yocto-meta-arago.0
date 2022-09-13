Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F5DC6FD23
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.887.1663041767718604582
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2C32040D68
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0Qm2Tbhi_5L for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1146B40D6E
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:46 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 54FA91749CF
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 03/52] weston-init: Update initscript for
 weston-calibration
Date: Tue, 13 Sep 2022 04:01:57 +0000
Message-Id: <20220913040246.2365077-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13985

From: Priya N S <priya.ns@ti.com>

Increase the sleep time before starting the weston-calibrator.
It takes some time for the completion of the runWeston script.
If the weston-calibration is started before the completion of
the runWeston script, the weston-calibrator will fail.

Signed-off-by: Priya N S <priya.ns@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend | 2 +-
 meta-arago-distro/recipes-graphics/wayland/weston-init/init     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbapp=
end b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 1a32f196..28e7ae39 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR:append =3D ".arago11"
+PR:append =3D ".arago12"
=20
 SRC_URI:append =3D " \
     file://runWeston \
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init =
b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index 461b0787..7a80238b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -79,7 +79,7 @@ case "$1" in
             echo
             echo    "*** To continue, please complete the touchscreen ca=
libration"
             echo -n "*** by touching the crosshairs on the LCD screen"
-            sleep 1
+            sleep 2
             CAL_VALUES=3D`weston-calibrator|cut -c21-`
             echo 'SUBSYSTEM=3D=3D"input", ENV{WL_CALIBRATION}=3D"'$CAL_V=
ALUES'"' > $WS_CALUDEV_FILE
             echo "."
--=20
2.25.1


