Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF74C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 17:40:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1537.1706809235049859432
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 09:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 65BB640CBA;
	Thu,  1 Feb 2024 17:40:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAa5vg_A9GmK; Thu,  1 Feb 2024 17:40:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 398BF40AB7;
	Thu,  1 Feb 2024 17:40:33 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id EF6F5163DF1;
	Thu,  1 Feb 2024 12:40:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/2] libnl: update for 3.9.0
Date: Thu,  1 Feb 2024 12:40:29 -0500
Message-Id: <20240201174029.2592430-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201174029.2592430-1-denis@denix.org>
References: <20240201174029.2592430-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Feb 2024 17:40:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15102

From: Denys Dmytriyenko <denys@konsulko.com>

Update bbappend for 3.9.0 release. The location of the private headers ha=
s
changed slightly, adjust accordingly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../libnl/{libnl_3.7.0.bbappend =3D> libnl_3.9.0.bbappend}   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-arago-distro/recipes-support/libnl/{libnl_3.7.0.bbappend =3D=
> libnl_3.9.0.bbappend} (22%)

diff --git a/meta-arago-distro/recipes-support/libnl/libnl_3.7.0.bbappend=
 b/meta-arago-distro/recipes-support/libnl/libnl_3.9.0.bbappend
similarity index 22%
rename from meta-arago-distro/recipes-support/libnl/libnl_3.7.0.bbappend
rename to meta-arago-distro/recipes-support/libnl/libnl_3.9.0.bbappend
index 523335c4..26c9b6de 100644
--- a/meta-arago-distro/recipes-support/libnl/libnl_3.7.0.bbappend
+++ b/meta-arago-distro/recipes-support/libnl/libnl_3.9.0.bbappend
@@ -2,7 +2,8 @@ PR:append =3D ".arago0"
=20
 do_install:append() {
 #   Install private files to allow libnl extensions
-    install -d ${D}${includedir}/netlink-private
-    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/net=
link-private/
-    cp -r ${S}/include/netlink-private/object-api.h ${D}${includedir}/ne=
tlink-private/
+    install -d ${D}${includedir}/nl-priv-dynamic-core
+    cp -r ${S}/include/nl-priv-dynamic-core/cache-api.h ${D}${includedir=
}/nl-priv-dynamic-core/
+    cp -r ${S}/include/nl-priv-dynamic-core/object-api.h ${D}${includedi=
r}/nl-priv-dynamic-core/
+    cp -r ${S}/include/nl-priv-dynamic-core/nl-core.h ${D}${includedir}/=
nl-priv-dynamic-core/
 }
--=20
2.25.1


