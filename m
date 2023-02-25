Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E0EC7EE31
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 04:42:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.38584.1677300158873606062
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 20:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 225F740CA2;
	Sat, 25 Feb 2023 04:42:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRsZVMrDNczp; Sat, 25 Feb 2023 04:42:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0422840C5F;
	Sat, 25 Feb 2023 04:42:36 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C8D76163764;
	Fri, 24 Feb 2023 23:42:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/6] branding-core: disable gc320 features, as drivers breaks with gcc12
Date: Sat, 25 Feb 2023 04:42:31 +0000
Message-Id: <20230225044235.1967733-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225044235.1967733-1-denis@denix.org>
References: <20230225044235.1967733-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 25 Feb 2023 04:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14230

From: Denys Dmytriyenko <denys@konsulko.com>

gc320 driver errors out with new gcc12 checks, disable for now until reso=
lved.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/me=
ta-arago-distro/conf/distro/include/branding-core.inc
index b28fb196..c9a103d3 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -14,3 +14,6 @@ ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos =3D "15"
=20
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GS=
T 1.18
 MACHINE_FEATURES:remove =3D "mmip"
+
+# Remove gc320 - the driver fails to build with gcc12
+MACHINE_FEATURES:remove =3D "gc320"
--=20
2.25.1


