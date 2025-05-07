Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20C9C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 23:18:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3145.1746659893731230656
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 May 2025 16:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A632740C21;
	Wed,  7 May 2025 23:18:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecxPb9m6j19R; Wed,  7 May 2025 23:18:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8818940A22;
	Wed,  7 May 2025 23:18:11 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DF817167A59;
	Wed,  7 May 2025 19:18:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] omapconf: use proper definition of boolean type
Date: Wed,  7 May 2025 19:18:10 -0400
Message-Id: <20250507231810.2027418-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 May 2025 23:18:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16191

From: Denys Dmytriyenko <denys@konsulko.com>

Newer versions of GCC and C standard have bool as a built-in
keyword - use a standard stdbool.h header to properly handle it.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...se-proper-definition-of-boolean-type.patch | 41 +++++++++++++++++++
 .../recipes-devtools/omapconf/omapconf_git.bb |  2 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-arago-test/recipes-devtools/omapconf/files/0001-=
Use-proper-definition-of-boolean-type.patch

diff --git a/meta-arago-test/recipes-devtools/omapconf/files/0001-Use-pro=
per-definition-of-boolean-type.patch b/meta-arago-test/recipes-devtools/o=
mapconf/files/0001-Use-proper-definition-of-boolean-type.patch
new file mode 100644
index 00000000..e1a29c9c
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/omapconf/files/0001-Use-proper-def=
inition-of-boolean-type.patch
@@ -0,0 +1,41 @@
+From c52280d923c167032a84f1c67574eb340e38572c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@konsulko.com>
+Date: Wed, 7 May 2025 17:03:20 -0400
+Subject: [PATCH] Use proper definition of boolean type
+
+Newer versions of GCC and C standard have bool as a built-in
+keyword - use a standard stdbool.h header to properly handle it.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
+---
+ arch/arm/mach-omap/common/statcoll/sci.h | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/arch/arm/mach-omap/common/statcoll/sci.h b/arch/arm/mach-om=
ap/common/statcoll/sci.h
+index 4134c00..1a393b4 100644
+--- a/arch/arm/mach-omap/common/statcoll/sci.h
++++ b/arch/arm/mach-omap/common/statcoll/sci.h
+@@ -48,17 +48,11 @@
+ #ifndef SCI_H
+ #define SCI_H
+=20
++#include <stdbool.h>
+ #include <stdlib.h>
+ #include <stdint.h>		// The library uses C99 exact-width integer types
+ #include "sci_dev.h"
+=20
+-#if !defined(__bool_true_false_are_defined) && !defined(_STM_Logging)
+-typedef enum {
+-	false =3D 0,
+-	true =3D 1
+-} bool;
+-#endif
+-
+ #ifdef _STM_Logging
+ #include "StmLibrary.h"
+ #endif
+--=20
+2.25.1
+
diff --git a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb b/=
meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
index 175c6771..dad8ece0 100644
--- a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
@@ -13,6 +13,8 @@ SRCREV =3D "ff07b6992bacb1e1586c72b7d2be469caee4a347"
=20
 SRC_URI =3D "git://github.com/omapconf/omapconf.git;protocol=3Dhttps;bra=
nch=3D${BRANCH}"
=20
+SRC_URI +=3D "file://0001-Use-proper-definition-of-boolean-type.patch"
+
 S =3D "${WORKDIR}/git"
=20
 do_compile () {
--=20
2.25.1


