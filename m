Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95061D3B7E2
	for <webhook@archiver.kernel.org>; Sun,  7 Dec 2025 17:03:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30914.1765126999906177112
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 07 Dec 2025 09:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0CCE740C8F;
	Sun,  7 Dec 2025 17:03:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4s0aH30_8nSM; Sun,  7 Dec 2025 17:03:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E420C40C76;
	Sun,  7 Dec 2025 17:03:17 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B15BA175583;
	Sun,  7 Dec 2025 12:03:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 1/2] libyang: remove unused files
Date: Sun,  7 Dec 2025 12:03:08 -0500
Message-Id: <20251207170309.1924061-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 07 Dec 2025 17:03:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16870

From: Denys Dmytriyenko <denys@konsulko.com>

After converting libyang from a separate version to a bbappend,
these files are no longer needed locally.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...ntext-skip-test-case-test_searchdirs.patch | 29 -------------------
 .../sysrepo/libyang/run-ptest                 | 18 ------------
 2 files changed, 47 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang/00=
01-test_context-skip-test-case-test_searchdirs.patch
 delete mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang/ru=
n-ptest

diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang/0001-test=
_context-skip-test-case-test_searchdirs.patch b/meta-arago-extras/recipes=
-extended/sysrepo/libyang/0001-test_context-skip-test-case-test_searchdir=
s.patch
deleted file mode 100644
index 3c6aee92..00000000
--- a/meta-arago-extras/recipes-extended/sysrepo/libyang/0001-test_contex=
t-skip-test-case-test_searchdirs.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 5de24e1b39c09adb0c5bf4bb4228bd1bb935542a Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Wed, 22 Mar 2023 16:03:56 +0800
-Subject: [PATCH] test_context: skip test case test_searchdirs
-
-Skip test case test_searchdirs as it searchs the source code directory.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- tests/utests/basic/test_context.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tests/utests/basic/test_context.c b/tests/utests/basic/test=
_context.c
-index cfba1d30f..8c3bb7ad6 100644
---- a/tests/utests/basic/test_context.c
-+++ b/tests/utests/basic/test_context.c
-@@ -1061,7 +1061,6 @@ int
- main(void)
- {
-     const struct CMUnitTest tests[] =3D {
--        UTEST(test_searchdirs),
-         UTEST(test_options),
-         UTEST(test_models),
-         UTEST(test_imports),
---=20
-2.25.1
-
diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang/run-ptest=
 b/meta-arago-extras/recipes-extended/sysrepo/libyang/run-ptest
deleted file mode 100644
index c507afb2..00000000
--- a/meta-arago-extras/recipes-extended/sysrepo/libyang/run-ptest
+++ /dev/null
@@ -1,18 +0,0 @@
-#!/bin/sh
-
-# cd into right directory
-ptestdir=3D$(dirname "$(readlink -f "$0")")
-cd "$ptestdir"/tests || exit
-
-tests=3D$(find * -type f -name 'utest_*')
-
-for f in $tests
-do
-    if test -x ./"$f"; then
-        if ./"$f" > ./"$f".out 2> ./"$f".err; then
-            echo "PASS: $f"
-        else
-            echo "FAIL: $f"
-        fi
-    fi
-done
--=20
2.25.1


