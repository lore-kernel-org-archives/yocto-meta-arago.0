Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1695C6FD20
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:04:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22763.1679425471633939827
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 12:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9580240C46
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:04:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMant756apxM for <meta-arago@lists.yoctoproject.org>;
	Tue, 21 Mar 2023 19:04:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8271640C5D
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:04:30 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 60DB71637C3
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 15:03:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [kirkstone/master][PATCH 1/4] irqbalance: Move to the latest tip v1.9.2+
Date: Tue, 21 Mar 2023 19:04:25 +0000
Message-Id: <20230321190428.2818600-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:04:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14266

From: Vignesh Raghavendra <vigneshr@ti.com>

This fixes timeouts seen on daemon stop during reboot
Switches to using irqbalance provide irqbalance.service instead of
custom one
Fixes some IRQs not being classified and thus not balanced.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-extended/irqbalance/irqbalance_git.bbappend   | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-distro/recipes-extended/irqbalance/irqbala=
nce_git.bbappend

diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git=
.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.=
bbappend
new file mode 100644
index 00000000..3ba30b5d
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappe=
nd
@@ -0,0 +1,8 @@
+SRCREV =3D "c24ed221e9e82faf1ad22de133c3c97a0117c5d7"
+PV =3D "1.9.2"
+
+do_install_append () {
+         install -m 0644 ${S}/misc/irqbalance.service ${D}${systemd_unit=
dir}/system/irqbalanced.service
+}
+
+PR_append =3D ".arago3"
--=20
2.25.1


