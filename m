Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C6E4352A42
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE30240C29;
	Tue, 23 Mar 2021 21:15:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ACGMPjoAkWs5; Tue, 23 Mar 2021 21:15:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A7A2240C2B;
	Tue, 23 Mar 2021 21:15:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 46BAE17455A;
	Tue, 23 Mar 2021 17:15:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 23 Mar 2021 17:15:07 -0400
Message-Id: <1616534107-46438-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616534107-46438-1-git-send-email-denis@denix.org>
References: <1616534107-46438-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH 4/4] qtwebengine: fix building latest qtwebengine with meta-python2
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Mar 2021 21:15:00 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

When meta-python2 (dunfell) layer is present, qtwebengine can be built.

Enable "examples" flag to package them into qtwebengine-examples package.

Drop old inappropriate patch that no longer applies to Qt 5.14

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf           |  1 +
 ...-set-default-logging-level-back-to-LOG_FA.patch | 47 ----------------------
 .../recipes-qt/qt5/qtwebengine_git.bbappend        |  1 -
 3 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 7c70281..206e65e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -132,6 +132,7 @@ PACKAGECONFIG_append_pn-qtscript = " examples"
 PACKAGECONFIG_append_pn-qtserialport = " examples"
 PACKAGECONFIG_append_pn-qtsvg = " examples"
 PACKAGECONFIG_append_pn-qtwayland = " examples"
+PACKAGECONFIG_append_pn-qtwebengine = " examples"
 
 # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
 PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch
deleted file mode 100644
index 1486d17..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 7e2a1b06447693c588a0608cef22636bc6edb466 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Thu, 25 May 2017 16:55:38 -0400
-Subject: [PATCH 2/3] qtwebengine: set default logging level back to LOG_FATAL
-
-Suppress info, warning and error messages by default to be consistent
-with QT5.6.2 behavior
-
-Upstream-Status: Inappropriate
-It is clear that this workaround reverses the course of QT, but we do need
-this change as described above.
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/core/content_main_delegate_qt.cpp | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/src/core/content_main_delegate_qt.cpp b/src/core/content_main_delegate_qt.cpp
-index 8bd07ef..6d8cfb1 100644
---- a/src/core/content_main_delegate_qt.cpp
-+++ b/src/core/content_main_delegate_qt.cpp
-@@ -111,14 +111,21 @@ void ContentMainDelegateQt::PreSandboxStartup()
-     settings.logging_dest = DetermineLogMode(*parsedCommandLine);
-     logging::InitLogging(settings);
- 
-+    // Suppress info, warning and error messages per default.
-+    int logLevel = logging::LOG_FATAL;
-+
-     if (logging::GetMinLogLevel() >= logging::LOG_INFO) {
-         if (parsedCommandLine->HasSwitch(switches::kLoggingLevel)) {
-             std::string logLevelValue = parsedCommandLine->GetSwitchValueASCII(switches::kLoggingLevel);
-             int level = 0;
-             if (base::StringToInt(logLevelValue, &level) && level >= logging::LOG_INFO && level < logging::LOG_NUM_SEVERITIES)
--                logging::SetMinLogLevel(level);
-+                logLevel = level;
-+                //logging::SetMinLogLevel(level);
-         }
-     }
-+
-+    logging::SetMinLogLevel(logLevel);
-+
- }
- 
- content::ContentBrowserClient *ContentMainDelegateQt::CreateContentBrowserClient()
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
index 28ff601..c50b020 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -2,7 +2,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 PR_append = ".arago1"
 
 SRC_URI += " \
-    file://0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch \
     file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch \
 "
 
-- 
2.7.4


