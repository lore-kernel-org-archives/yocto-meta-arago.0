Return-Path: <vivien.didelot@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by arago-project.org (Postfix) with ESMTPS id C647552AA7
	for <meta-arago@arago-project.org>;
	Thu,  7 Oct 2021 17:57:30 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id m26so7052952qtn.1
	for <meta-arago@arago-project.org>;
	Thu, 07 Oct 2021 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4ZjewJ0NUIqv3EOcWRI8z9SD3GNhU1Nm3uEFaxtZdNU=;
	b=ByVdxm85X5/JyyUIXxthe6tzuKXfshRrb7f5IhYtUJSoG7Ww3CKfqrJ8R0ytOmmeoa
	QYTItSo2FlwQjNBeJE7535ozGvkIP9rq8Jq3lUajWpyQ5DeSQjcBBNYQUQHTtUg1kr1m
	ufBFCS8BAwajAA5VI6W6etHboFwH4jAuC6o3CZfhcl6fkTez+diZnGyAwBxjqB/KI+ub
	qBYxAbKWdv2iw9DsT6XG6q0zKARJsolJmBUG5WGL3bkRGGNVeLlNnLSlaES4Hu2y+ac5
	4zzj2aezjTo550C33W9CWZpgaz/yyakmn+79pJVWBFTWg2j5ObX1GhXcJ9+00CNsOZF0
	nPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4ZjewJ0NUIqv3EOcWRI8z9SD3GNhU1Nm3uEFaxtZdNU=;
	b=gjXIg1X5g+HzbqsEMJhHXpiaR4aT5LXyTaxjE4uf3ygAfGXF47b5HUd4szC9buh3Vq
	2MHKTwNPKj0IWyjIxA4Pv511iM/B8dIQOvxzw3MHWdNh4zTm6dBroDc9e1Y8YDxaYvKc
	U87pNu6Ei0ABTZsEhcBeOHzBGH04+mLAFf02SPOr5u4CvgIjkL/HZ4AoBRKPJxs8KVJz
	zN9/Lrnfv8kaFWZ7bP26+yi3nRHNnjJnBqURSxFbMVCMM3wgYC/I4qay785r/ywdViTO
	NYag+FDgzKzqqGsN2FtgbZO97Lnt+mgDf1ZvwBAtdpIS4X9C3MTphax4D409152EMsuO
	g7uQ==
X-Gm-Message-State: AOAM532biRy5XIjAxziw4uFeaFHhae9jzaXZSDZaSZwB07taaUA26lBw
	FyHbVnBWuuEH8zrMByXx4r/1mj/h5LU=
X-Google-Smtp-Source: ABdhPJzMusykOBAeSbDx/QOzx4v2Gs9BLluLJdEmVbzg6CBsq+ntHwHpNiQj9szrEo+eWsGL702vDA==
X-Received: by 2002:a05:622a:1793:: with SMTP id
	s19mr6777468qtk.231.1633629492357; 
	Thu, 07 Oct 2021 10:58:12 -0700 (PDT)
Received: from localhost
	(bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca.
	[70.53.240.121])
	by smtp.gmail.com with ESMTPSA id i11sm91751qki.28.2021.10.07.10.58.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Oct 2021 10:58:10 -0700 (PDT)
From: Vivien Didelot <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: meta-arago@arago-project.org
Date: Thu,  7 Oct 2021 13:57:30 -0400
Message-Id: <20211007175730.152202-2-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007175730.152202-1-vdidelot@pbsc.com>
References: <20211007175730.152202-1-vdidelot@pbsc.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Oct 2021 18:09:22 +0000
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH v2 2/2] qtwebengine: remove seccomp filter sandbox hack
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
X-List-Received-Date: Thu, 07 Oct 2021 17:57:31 -0000
Content-Transfer-Encoding: 8bit

Now that qtbase-conf disables the seccomp filter sandbox via an
environment variable, the hack patch against qtwebengine can be
dropped.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 ...-disable-SECCOMP-BPF-Sandbox-at-star.patch | 32 -------------------
 .../recipes-qt/qt5/qtwebengine_git.bbappend   |  4 ---
 2 files changed, 36 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch

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


