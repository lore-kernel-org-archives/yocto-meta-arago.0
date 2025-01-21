Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A77C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 20:55:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.26680.1737492904836361363
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 12:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 47CB840C82;
	Tue, 21 Jan 2025 20:55:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9VbxpeZw2y7; Tue, 21 Jan 2025 20:55:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2CFDA40A46;
	Tue, 21 Jan 2025 20:55:03 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DFEC1164157;
	Tue, 21 Jan 2025 15:55:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][PATCH] arago-optimized.conf: add a Distro variant with optimized tunes
Date: Tue, 21 Jan 2025 15:55:02 -0500
Message-Id: <20250121205502.2077889-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 20:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15734

From: Denys Dmytriyenko <denys@konsulko.com>

Add a configuration file that sets tunes for elevated compiler
optimizations across all K3 devices as "cortexa72-cortexa53".

Intended use is to set DISTRO=3D"arago-optimized"

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago-optimized.conf | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/arago-optimized.conf

diff --git a/meta-arago-distro/conf/distro/arago-optimized.conf b/meta-ar=
ago-distro/conf/distro/arago-optimized.conf
new file mode 100644
index 00000000..1dbcd9b1
--- /dev/null
+++ b/meta-arago-distro/conf/distro/arago-optimized.conf
@@ -0,0 +1,5 @@
+require arago.conf
+
+DISTRO_NAME =3D "Arago (optimized)"
+
+DEFAULTTUNE:k3 =3D "cortexa72-cortexa53"
--=20
2.25.1


