Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4D9C433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 05:08:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3618.1666415302984312183
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 22:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5B08140DEF;
	Sat, 22 Oct 2022 05:08:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BdTHBvgBIud; Sat, 22 Oct 2022 05:08:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3DE5240DE8;
	Sat, 22 Oct 2022 05:08:21 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2F2C6174A39;
	Sat, 22 Oct 2022 01:08:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] branding-next: add configuration for AUTOREV-ed linux-next and u-boot master
Date: Sat, 22 Oct 2022 05:08:20 +0000
Message-Id: <20221022050820.3386545-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Oct 2022 05:08:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14087

From: Denys Dmytriyenko <denys@konsulko.com>

This configuration helps with enabling linux-next daily test plans with
ARAGO_BRAND=3D"next"

Builds the current HEADs of linux-next and u-boot master.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/branding-next.inc | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-next.i=
nc

diff --git a/meta-arago-distro/conf/distro/include/branding-next.inc b/me=
ta-arago-distro/conf/distro/include/branding-next.inc
new file mode 100644
index 00000000..a4fe66dc
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-next.inc
@@ -0,0 +1,8 @@
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-next"
+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-mainline"
+PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-mainline"
+SRCREV:pn-linux-ti-next =3D "${AUTOREV}"
+SRCREV:pn-u-boot-ti-mainline =3D "${AUTOREV}"
+
+# GPU support requires out-of-tree SGX and RGX drivers not available in =
next
+MACHINE_FEATURES:remove =3D "gpu"
--=20
2.25.1


