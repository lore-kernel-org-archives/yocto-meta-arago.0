Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.21700.1643242928021359189
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C2CA340C82
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2F6_HYZjkXgl for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ADA1840CB6
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2FD9217472A
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 02/23] qtbase-conf: disable the seccomp filter sandbox
Date: Wed, 26 Jan 2022 19:21:43 -0500
Message-Id: <1643242924-25090-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Vivien Didelot <vivien.didelot@gmail.com>

SECCOMP-BPF Sandbox is known to cause runtime issues so set the
QTWEBENGINE_CHROMIUM_FLAGS environment variable to disable this
feature temporarily until those issues are resolved.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
Acked-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh       | 5 +++++
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
index 146ee07..928e2cc 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
@@ -6,3 +6,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
 export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
 export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
+
+# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
+# from the pthread implementation. Disable this feature temporarily until
+# those issues are resolved.
+export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 29fa296..9652639 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -7,3 +7,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
 export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
 export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
+
+# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
+# from the pthread implementation. Disable this feature temporarily until
+# those issues are resolved.
+export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
-- 
2.7.4

