Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4B13D529AD
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E96DD40C32;
	Wed,  8 Apr 2020 00:45:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uFaKyUHGjHQ0; Wed,  8 Apr 2020 00:45:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF30240A6E;
	Wed,  8 Apr 2020 00:45:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 87C5F17126C;
	Tue,  7 Apr 2020 20:45:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:39 -0400
Message-Id: <1586306702-7953-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 01/24] voxelsdk: require dsp machine and opencv distro feature
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend | 3 ---
 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb     | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend

diff --git a/meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend b/meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend
deleted file mode 100644
index 249ddb7..0000000
--- a/meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES = "dsp"
diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
index 30c4fbf..c83b41e 100644
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
+++ b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
@@ -4,6 +4,11 @@ SECTION = "multimedia"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e69c599445026ffeae140a21181dfa88"
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
+REQUIRED_DISTRO_FEATURES = "opencv"
+
 PV = "0.6.8"
 PR = "r1"
 BRANCH = "plsdk-devel"
-- 
2.7.4


