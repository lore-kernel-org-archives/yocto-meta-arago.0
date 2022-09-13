Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D935EC6FD19
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.856.1663041770260654065
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C038E40D92
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fLDiiaYMVhY for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7D7140D8D
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 637421749CF
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 31/52] tisdk-uenv: remove uEnv.txt for k3
Date: Tue, 13 Sep 2022 04:02:25 +0000
Message-Id: <20220913040246.2365077-32-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14015

From: Andrew Davis <afd@ti.com>

This fixup should have been done in u-boot and not in a uEnv.txt
file. It is not correct for all K3 anymore either. Remove it.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../tisdk-uenv/tisdk-uenv/k3/uEnv.txt         | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv=
/k3/uEnv.txt

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEn=
v.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
deleted file mode 100644
index 80ea34f5..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-# This uEnv.txt file can contain additional environment settings that yo=
u
-# want to set in U-Boot at boot time.  This can be simple variables such
-# as the serverip or custom variables.  The format of this file is:
-#    variable=3Dvalue
-# NOTE: This file will be evaluated after the bootcmd is run and the
-#       bootcmd must be set to load this file if it exists (this is the
-#       default on all newer U-Boot images.  This also means that some
-#       variables such as bootdelay cannot be changed by this file since
-#       it is not evaluated until the bootcmd is run.
-
-# The specific board is not able to be automatically detected. The below=
 is a
-# workaround to set a sane default incase the user has not manually conf=
igured
-# a specific board.
-def_board_name=3D"am65x"
-
-# Check if using default board_name when name_overlays is not set
-check_for_board=3Dif test $name_overlays; then echo "Using board_name =3D=
 $board_name"; else setenv board_name $def_board_name; fi
-
-uenvcmd=3Drun check_for_board; run findfdt
--=20
2.25.1


