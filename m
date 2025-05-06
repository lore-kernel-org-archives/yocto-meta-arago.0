Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9742C3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 23:35:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.239.1746574501316891078
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 May 2025 16:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8F2A840CB6;
	Tue,  6 May 2025 23:35:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLPaQrSPzOJr; Tue,  6 May 2025 23:35:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7376440C50;
	Tue,  6 May 2025 23:34:59 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C3AED16792D;
	Tue,  6 May 2025 19:34:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] switch-config: use proper definition of boolean type
Date: Tue,  6 May 2025 19:34:57 -0400
Message-Id: <20250506233457.436824-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 May 2025 23:35:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16186

From: Denys Dmytriyenko <denys@konsulko.com>

Newer versions of GCC and C standard have bool as a built-in
keyword - use a standard stdbool.h header to properly handle it.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...se-proper-definition-of-boolean-type.patch | 34 +++++++++++++++++++
 .../switch-config/switch-config_git.bb        |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arago-test/recipes-bsp/switch-config/files/0001-=
Use-proper-definition-of-boolean-type.patch

diff --git a/meta-arago-test/recipes-bsp/switch-config/files/0001-Use-pro=
per-definition-of-boolean-type.patch b/meta-arago-test/recipes-bsp/switch=
-config/files/0001-Use-proper-definition-of-boolean-type.patch
new file mode 100644
index 00000000..23c6d297
--- /dev/null
+++ b/meta-arago-test/recipes-bsp/switch-config/files/0001-Use-proper-def=
inition-of-boolean-type.patch
@@ -0,0 +1,34 @@
+From 5190913c7a86cd36b91dc3a6ff4c1eb22ea6375e Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@konsulko.com>
+Date: Tue, 6 May 2025 12:52:14 -0400
+Subject: [PATCH] Use proper definition of boolean type
+
+Newer versions of GCC and C standard have bool as a built-in
+keyword - use a standard stdbool.h header to properly handle it.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
+---
+ switch-config.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/switch-config.c b/switch-config.c
+index d31a237..5b5db3a 100644
+--- a/switch-config.c
++++ b/switch-config.c
+@@ -13,10 +13,7 @@
+  * GNU General Public License for more details.
+  */
+=20
+-#define true 1
+-#define false 0
+-typedef int bool;
+-
++#include <stdbool.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+--=20
+2.25.1
+
diff --git a/meta-arago-test/recipes-bsp/switch-config/switch-config_git.=
bb b/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
index 1160b45d..4d4b1f60 100644
--- a/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
@@ -13,6 +13,8 @@ SRCREV:aarch64 =3D "0f52dcb3c4e3678e96427d546d6c2e1fabc=
2ad91"
=20
 SRC_URI =3D "git://git.ti.com/git/switch-config/switch-config.git;protoc=
ol=3Dhttps;branch=3D${BRANCH}"
=20
+SRC_URI +=3D "file://0001-Use-proper-definition-of-boolean-type.patch"
+
 S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${CC}""
--=20
2.25.1


