Return-Path: <vivien.didelot@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by arago-project.org (Postfix) with ESMTPS id BA842530AE
	for <meta-arago@arago-project.org>;
	Wed,  6 Oct 2021 20:54:17 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id e16so4112863qts.4
	for <meta-arago@arago-project.org>;
	Wed, 06 Oct 2021 13:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dZI0ySfH8vY5h1ZB7JmKo7yBNmBiygqLeqK60tCXEGY=;
	b=eAghaCnJxtw0as/tQzOn1ZTMVS6bb4IEGzUXV4iVgYKO33B3TfOtPcb52AFyp7D7jk
	Bk7F2/fVdyGmM7/3gQHa6Vqnoq4Z/XXLeSiY2y8/6UuRW4gl8ui3ORG44zkqT7jgRhF8
	bzBdDhaeA3rCNnhl1lVzNPwJUJgB+WpJI67Oxx/6vBXJuwDWPKiHgE7aXGApdv6A7GEf
	L8w7uGvkOzP3vlARm5K+G5ynj7qMZrzM+hPNEUkhNWDTv+LaIPpLXE2+EaUgxKJmOIl/
	ghcgkzOpu+5WWN3igug4Bw4Hwa5xgdDrP1GIhm3SXzGlvZqCf6S7kdUsyoaG52jRgZQE
	waCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dZI0ySfH8vY5h1ZB7JmKo7yBNmBiygqLeqK60tCXEGY=;
	b=bWYfmv9PCQzZ63Q0V3uJQBFxwAVT9rEXnC2gfu6+wMOj7vpBvFKFBUjGI6HCqutBz1
	aJ+uJG5osta4jOm9/GGldePVu3FFzY7pAIF9YSv4Yw8nKB7PvQ82zlRfsbWkVwm/ff+I
	4vbC8FlovQVKqRFdjflTeJRboATuLMs8B3RMvVO7r9rEjbCdMzsvBHLTEvg8lPfqoX61
	Nr3UssTfVr2TVQcpLHdCeU4P1x9/c5K0y+zG+qFY/6xf0NyVkpToi/P4NHv/5STA2mwB
	Nglvwacvqp6H/l/V54Td7Fn0sw6zMpFrSk+XmN+Am3UljBUv0Ck3/+y3T9gZydVSNOTW
	Qw7A==
X-Gm-Message-State: AOAM5327LuXnQxRBMO7Uwa0HMR5gmVkCKj7R4PNk80iljTJXbHmKe0wM
	8gSMmtqxXsX0botXapDuQo+wWsrtCSE=
X-Google-Smtp-Source: ABdhPJy0Vy4DWbSl2qhRmCMBYO/gB4GhO6XASo3Qddgz+zssCzWAvYdMVcwq+Yho9CL81cKF+0H1dw==
X-Received: by 2002:ac8:764a:: with SMTP id i10mr415521qtr.414.1633553698902; 
	Wed, 06 Oct 2021 13:54:58 -0700 (PDT)
Received: from localhost
	(bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca.
	[70.53.240.121]) by smtp.gmail.com with ESMTPSA id
	k16sm14960085qta.27.2021.10.06.13.54.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Oct 2021 13:54:58 -0700 (PDT)
From: Vivien Didelot <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: meta-arago@arago-project.org
Date: Wed,  6 Oct 2021 16:54:54 -0400
Message-Id: <20211006205454.4056166-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Oct 2021 22:56:55 +0000
Cc: Denys Dmytriyenko <denys@konsulko.com>, Eric Ruei <e-ruei1@ti.com>
Subject: [PATCH] qtwebengine: replace patch with chromium flags
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
X-List-Received-Date: Wed, 06 Oct 2021 20:54:18 -0000
Content-Transfer-Encoding: 8bit

Instead of maintaining an inappropriate hack on qtwebengine to disable
seccomp filter sandbox, export the corresponding chromium flag in
the QTWEBENGINE_CHROMIUM_FLAGS environment variable.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 .../qt5/qtbase-conf/ti33x/qt_env.sh           |  5 +++
 ...-disable-SECCOMP-BPF-Sandbox-at-star.patch | 32 -------------------
 .../recipes-qt/qt5/qtwebengine_git.bbappend   |  4 ---
 3 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 29fa2969..96526393 100644
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
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
deleted file mode 100644
index 09f1870d..00000000
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
index c50b020f..6459bbf7 100644
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
2.33.0


