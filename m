Return-Path: <eyalreizer@gmail.com>
Received: from mail-bk0-f50.google.com (mail-bk0-f50.google.com
	[209.85.214.50])
	by arago-project.org (Postfix) with ESMTPS id 95E60529CE
	for <meta-arago@arago-project.org>;
	Sun,  1 Dec 2013 12:46:00 +0000 (UTC)
Received: by mail-bk0-f50.google.com with SMTP id e11so4927327bkh.37
	for <meta-arago@arago-project.org>;
	Sun, 01 Dec 2013 04:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VaW95lnDrwro+1LE3HUUfcqg87Y5nNIS/lty9eBZBCQ=;
	b=0HZ0u6bwkwaC2t7V3AZj0f4s5o1eWS5C/6HNx3alymi1XINNjHIuFJV3of/HtJEe6f
	hMG/sY106ZuhIjscGcq0EZvI3umrGU46c19CE06IZg8Kh5ma/gIqYuNpZYJCxY+302BQ
	aoaEvyfjYtd99ENFeGrTJXWGlWtbo1TdvSeVYAIhNThjT/SQQYYZKOqoBbwQXZucJRHd
	1oEhLRamfXUcCu0YPPnxJLAaqVL6ek+HyzARwc6LZqJR/P3UMNueo5qMbNwIwdypKMNj
	s8QEfvCNMtPfhTHpsRLWYzhjBXwBeY5+YgZVHiQMfM8Gww13TrVcrrW54LzfUYAhTJ2J
	iPHA==
X-Received: by 10.204.118.131 with SMTP id v3mr8195447bkq.30.1385901959205;
	Sun, 01 Dec 2013 04:45:59 -0800 (PST)
Received: from localhost.localdomain (46-116-178-164.bb.netvision.net.il.
	[46.116.178.164]) by mx.google.com with ESMTPSA id
	no2sm70831578bkb.15.2013.12.01.04.45.57 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 01 Dec 2013 04:45:58 -0800 (PST)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  1 Dec 2013 14:45:46 +0200
Message-Id: <1385901947-10316-2-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1385901947-10316-1-git-send-email-eyalr@ti.com>
References: <1385901947-10316-1-git-send-email-eyalr@ti.com>
Subject: [PATCH 2/2] ti-compat-wireless-wl18xx: remove older ol_r8.a6.01 release
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
X-List-Received-Date: Sun, 01 Dec 2013 12:46:00 -0000

Remove the recipe building compat-wireless based on an older release.
This recipe is replced by a new recipe which build ol_r8.a8.08

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../ti-compat-wireless-wl18xx_r8.a6.01.bb          |   67 --------------------
 1 files changed, 0 insertions(+), 67 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
deleted file mode 100644
index a69b7d6..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-# This is a TI specific version of the compat-wireless recipe using a
-# compat-wireless package created from the TI Systems Tested mac80211 releases.
-
-DESCRIPTION = "ti compat-wireless drivers for wl18xx"
-HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
-SECTION = "kernel/modules"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-RDEPENDS_${PN} = "wireless-tools"
-
-PROVIDES += "ti-compat-wireless-wl12xx"
-RPROVIDES_${PN} += "ti-compat-wireless-wl12xx"
-RREPLACES_${PN} += "ti-compat-wireless-wl12xx"
-RCONFLICTS_${PN} += "ti-compat-wireless-wl12xx"
-
-PV = "r8.a6.01"
-inherit module
-
-PR = "${MACHINE_KERNEL_PR}"
-PR_append = "c"
-
-# Tags: ol_r8.a6.01
-SRCREV_wl18xx = "f076cdad1988daf207ad560db2fe96caaa7c596e"
-SRCREV_compat = "c37c46c4ab5085ba50f650d15854404983b8d09b"
-SRCREV_compat-wireless = "3ec9ecca2cb07584e115ba53117f0084fc8faa25"
-
-SRCREV_FORMAT = "compat-wireless"
-
-S = "${WORKDIR}/compat-wireless"
-
-SRC_URI = "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=compat-wireless;name=compat-wireless \
-           git://github.com/TI-OpenLink/compat.git;destsuffix=compat;name=compat \
-           git://github.com/TI-OpenLink/wl18xx.git;destsuffix=wl18xx;name=wl18xx \
-           file://0001-git-version-wl18xx-use-compat-base-tree.patch;patchdir=../wl18xx \
-           file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch;patchdir=../wl18xx \
-          "
-
-
-EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
-
-# Prevent sourceipk adjust_git function from running.
-# This preserves the git repo until driver-select is ran.
-
-adjust_git() {
-    :
-}
-
-do_configure() {
-    cd ${S}
-    GIT_TREE="${WORKDIR}/wl18xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh
-    ./scripts/driver-select wl18xx
-
-    # Delete the .git repository since it should no longer be needed.
-    rm -rf ${S}/.git ${S}/.gitignore
-
-    # Now generate the sourceipk with the properly configured sources
-    sourceipk_do_create_srcipk
-}
-
-do_configure_append() {
-    sed -i "s#@./scripts/update-initramfs## " Makefile
-}
-
-do_install() {
-    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
-}
-- 
1.7.0.4


