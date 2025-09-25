Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A454FCAC5BA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 19:30:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.167.1758828622358578509
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 12:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8AAC740C56;
	Thu, 25 Sep 2025 19:30:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STZTIWlpgO32; Thu, 25 Sep 2025 19:30:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6FE4640A30;
	Thu, 25 Sep 2025 19:30:20 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 225D2163ADF;
	Thu, 25 Sep 2025 15:30:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH v2] linux-firmware-arago: correct removal of overlapping FW
Date: Thu, 25 Sep 2025 15:30:19 -0400
Message-Id: <20250925193019.2938469-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 19:30:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16637

From: Denys Dmytriyenko <denys@konsulko.com>

Use the correct variable, instead of hard-coding /lib/firmware, when
removing firmware images that overlap with the ones from meta-ti-bsp.
This way it will work properly even when usrmerge is enabled.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - separate patches for master and scarthgap

 .../recipes-kernel/linux-firmware/linux-firmware-arago.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmwa=
re-arago.inc b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firm=
ware-arago.inc
index 43c54575..30bf399d 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arag=
o.inc
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arag=
o.inc
@@ -1,6 +1,7 @@
-PR:append =3D ".arago2"
+PR:append =3D ".arago3"
=20
+# meta-ti-bsp packages newer versions on these
 do_install:append() {
-	rm -rf  ${D}/lib/firmware/ti-connectivity/
-	rm -rf  ${D}/lib/firmware/cadence/
+	rm -rf  ${D}${nonarch_base_libdir}/firmware//ti-connectivity/
+	rm -rf  ${D}${nonarch_base_libdir}/firmware//cadence/
 }
--=20
2.25.1


