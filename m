Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22084.1643242928218669625
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C2FD40CC9
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eH5vQsmFs200 for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7EDB740C2E
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3C11717472B
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 03/23] qtwebengine: remove seccomp filter sandbox hack
Date: Wed, 26 Jan 2022 19:21:44 -0500
Message-Id: <1643242924-25090-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Vivien Didelot <vivien.didelot@gmail.com>

Now that qtbase-conf disables the seccomp filter sandbox via an
environment variable, the hack patch against qtwebengine can be
dropped.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
Acked-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch | 32 ----------------------
 .../recipes-qt/qt5/qtwebengine_git.bbappend        |  4 ---
 2 files changed, 36 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
deleted file mode 100644
index 09f1870..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 77fc6e4391562a1f84d82b58319a73de08242797 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Fri, 8 Mar 2019 18:17:06 -0500
-Subject: [PATCH 3/3] qtwebengine: HACK: disable SECCOMP-BPF Sandbox at startup
-
-SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
-from the pthread implementation
-Disable this feature temporarily until those issues are resolved.
-
-Upstream-Status: Inappropriate [HACK]
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/core/web_engine_context.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/core/web_engine_context.cpp b/src/core/web_engine_context.cpp
-index 48e5bc4..9ba3fa4 100644
---- a/src/core/web_engine_context.cpp
-+++ b/src/core/web_engine_context.cpp
-@@ -347,6 +347,8 @@ WebEngineContext::WebEngineContext()
-         parsedCommandLine->AppendSwitch(switches::kNoSandbox);
- #elif defined(Q_OS_LINUX)
-         parsedCommandLine->AppendSwitch(service_manager::switches::kDisableSetuidSandbox);
-+        // HACK: disable seccomp filter sandbox for now because it does not work
-+        parsedCommandLine->AppendSwitch(service_manager::switches::kDisableSeccompFilterSandbox);
- #endif
-     } else {
-         parsedCommandLine->AppendSwitch(switches::kNoSandbox);
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
index c50b020..6459bbf 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -1,8 +1,4 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 PR_append = ".arago1"
 
-SRC_URI += " \
-    file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch \
-"
-
 DEPENDS += "bison-native"
-- 
2.7.4

