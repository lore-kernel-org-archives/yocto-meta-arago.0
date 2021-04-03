Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E6A8B52A58
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D5EAE40BEC;
	Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 06ozK1wOVDb5; Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A9B5640C56;
	Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 811E1174580;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:23 -0400
Message-Id: <1617408644-2675-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 08/29] gstreamer-plugins: unify removal of GFX options for headless platforms
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:46 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...plugins-good_1.16.%.bbappend => gstreamer1.0-plugins-%.bbappend} | 0
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend              | 6 ------
 .../gstreamer/gstreamer1.0-plugins-base_1.16.%.bbappend             | 6 ------
 3 files changed, 12 deletions(-)
 rename meta-arago-distro/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.%.bbappend => gstreamer1.0-plugins-%.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
rename to meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-%.bbappend
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
deleted file mode 100644
index 5f6374a..0000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Remove all GFX PACKAGECONFIGs for platforms w/o GPU
-PACKAGECONFIG_remove = "${@bb.utils.contains('MACHINE_FEATURES','gpu','','x11 wayland gl egl gles2 qt5',d)}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR_append = ".0"
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.%.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.%.bbappend
deleted file mode 100644
index 5f6374a..0000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.%.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Remove all GFX PACKAGECONFIGs for platforms w/o GPU
-PACKAGECONFIG_remove = "${@bb.utils.contains('MACHINE_FEATURES','gpu','','x11 wayland gl egl gles2 qt5',d)}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR_append = ".0"
-- 
2.7.4


