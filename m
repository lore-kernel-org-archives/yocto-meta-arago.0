Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E94C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 22:45:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.275.1714603541594442284
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 May 2024 15:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9A41040C79;
	Wed,  1 May 2024 22:45:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Nx6PEmXLu8C; Wed,  1 May 2024 22:45:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7C6AA40BE6;
	Wed,  1 May 2024 22:45:38 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C0563163F53;
	Wed,  1 May 2024 18:45:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] linux-firmware: remove packaging of Intel AC 9260 bluetooth firmware
Date: Wed,  1 May 2024 18:45:37 -0400
Message-Id: <20240501224537.1873145-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 May 2024 22:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15319

From: Denys Dmytriyenko <denys@konsulko.com>

Intel AC 9260 bluetooth firmware is now being packaged upstream by OE-Cor=
e:
https://git.openembedded.org/openembedded-core/commit/?id=3D33827edf82127=
05a829c5aa23b69e8d1f7131d08

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../linux-firmware/linux-firmware_%.bbappend           | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmwa=
re_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-fir=
mware_%.bbappend
index cb9573a1..43c54575 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bb=
append
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bb=
append
@@ -1,12 +1,4 @@
-PR:append =3D ".arago1"
-
-PACKAGES =3D+ "${PN}-ibt-18"
-
-LICENSE:${PN}-ibt-18 =3D "Firmware-ibt_firmware"
-
-FILES:${PN}-ibt-18 =3D "${nonarch_base_libdir}/firmware/intel/ibt-18-*.s=
fi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
-
-RDEPENDS:${PN}-ibt-18 +=3D "${PN}-ibt-license"
+PR:append =3D ".arago2"
=20
 do_install:append() {
 	rm -rf  ${D}/lib/firmware/ti-connectivity/
--=20
2.25.1


