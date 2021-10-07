Return-Path: <vivien.didelot@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by arago-project.org (Postfix) with ESMTPS id 37DE252AA7
	for <meta-arago@arago-project.org>;
	Thu,  7 Oct 2021 17:57:28 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id i1so5856431qtr.6
	for <meta-arago@arago-project.org>;
	Thu, 07 Oct 2021 10:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sUvrj3HxQ+dN8UtZGMzOW/Migc/FwbEvpZj5j2q9ouw=;
	b=P6G/Ws20HLTNc3YQV56e75wqZxakoATW4GaXbX1fYD8It4D1yJlIQbKk6giZuIO+iw
	i73zlVv+FITf5AtCqdlyh1WtTooUep9e94bReQAWeHZd1nsYVVoDZH1f2cLJ6xtlV6d9
	fyKxTwTFpNLR1oL0EWNmO/bEc9tOxX3wWctjwsE0PEgz33qguA3iXxyuWkV9xCr4xGr0
	jGmXYUTXTb+wRcCDSKF4VDlNkL/NGsNiVtuYp14qsBqEgIyfJqAkXZMSlguM4zrdB/bx
	+eaUDAWgkSIciwTK/drc5Q/3xReZ3+kRiaNnzp9qeCLSNA34DZs5deGdRyhq4TfrbDoH
	okRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sUvrj3HxQ+dN8UtZGMzOW/Migc/FwbEvpZj5j2q9ouw=;
	b=4+y366w/x+NxC0Rac8fbmn9c1KJB3SHLa5ERdI1kdvtu0HJd4l2DOpPBl8XVULQeXc
	IhT4UXFs+Gb5NYa+JajQpHp0vZNAeAtNukU9zVdlDQPiB6/CdJkXuMFHiyfCqkMsLJsS
	9IDs27hH5MMMDvbIXoePAULMOgTUQuMQ48WhOcNOpT2ULL1V09JGQNdwUtUlxIAw+ibD
	fRVqOKycOUoycH/Up9ZQxQgmw7yddQPS5E5+H8JsntHAVtAwGe0sVijDRnLtGjCEOPaT
	n4VJgReFKCRs3I8LPdxW0sIgxTBhY2Nev7UG8C+2UTDYoO9IWaadOYHld975xgewilp+
	w6CQ==
X-Gm-Message-State: AOAM530ZffB6aBo4U79YqkLIvOB0yUz1dkW2/GG2Awkjbx53pDWKJSYL
	PijjhIJdLxpJ8B38vDzksDRiULqunJg=
X-Google-Smtp-Source: ABdhPJzZYIfMeenod2gOSJn9UkWxc1wiYXsmJ8UvuPZWIzEqNJ3W9IrAolSOFAzvW+uDFpzjG6Xt1Q==
X-Received: by 2002:aed:2796:: with SMTP id a22mr6326533qtd.250.1633629489529; 
	Thu, 07 Oct 2021 10:58:09 -0700 (PDT)
Received: from localhost ([70.53.240.121])
	by smtp.gmail.com with ESMTPSA id l28sm69059qtn.1.2021.10.07.10.58.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Oct 2021 10:58:09 -0700 (PDT)
From: Vivien Didelot <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: meta-arago@arago-project.org
Date: Thu,  7 Oct 2021 13:57:29 -0400
Message-Id: <20211007175730.152202-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Oct 2021 18:09:22 +0000
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH v2 1/2] qtbase-conf: disable the seccomp filter sandbox
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
X-List-Received-Date: Thu, 07 Oct 2021 17:57:28 -0000
Content-Transfer-Encoding: 8bit

SECCOMP-BPF Sandbox is known to cause runtime issues so set the
QTWEBENGINE_CHROMIUM_FLAGS environment variable to disable this
feature temporarily until those issues are resolved.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh       | 5 +++++
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
index 146ee07e..928e2cc7 100644
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
-- 
2.33.0


