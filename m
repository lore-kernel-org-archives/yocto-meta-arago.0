Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A24C0015E
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 00:03:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2189.1689811408984067396
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 17:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B3EA740C79;
	Thu, 20 Jul 2023 00:03:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nD7mBxCz5vTQ; Thu, 20 Jul 2023 00:03:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 97DC2406BD;
	Thu, 20 Jul 2023 00:03:26 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C8DBC163C07;
	Wed, 19 Jul 2023 20:03:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] packagegroup-arago-sysvinit-boot: fix tiny image unable to login issue
Date: Thu, 20 Jul 2023 00:03:24 +0000
Message-Id: <20230720000324.3094300-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Jul 2023 00:03:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14805

From: Denys Dmytriyenko <denys@konsulko.com>

Commit 292b4549c14c73c7b9d50051ef7a999377ab8f40 changed how login_manager
gets set conditionally for systemd vs. sysvinit builds. But tiny image is
rather special as it uses sysvinit even during systemd build. That's why
all other conditional VIRTUAL_RUNTIME variables were being forced in the
packagegroup-arago-sysvinit-boot - need to do the same for login_manager.
Otherwise it pulls shadow-base into a tiny image w/o additional required
dependencies for securetty and few pam plugins, preventing root user from
being able to login.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-sysvinit-boot.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-sysvinit-boot.bb
index 9f937343..df7ff960 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sys=
vinit-boot.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sys=
vinit-boot.bb
@@ -12,3 +12,4 @@ VIRTUAL-RUNTIME_dev_manager =3D ""
 VIRTUAL-RUNTIME_init_manager =3D "sysvinit"
 VIRTUAL-RUNTIME_initscripts =3D "initscripts"
 VIRTUAL-RUNTIME_initramfs =3D "sysvinit-initramfs"
+VIRTUAL-RUNTIME_login_manager =3D "busybox"
--=20
2.25.1


