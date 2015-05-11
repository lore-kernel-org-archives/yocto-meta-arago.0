Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 32A7252A2B
	for <meta-arago@arago-project.org>;
	Mon, 11 May 2015 21:06:12 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NO7002IKELGGWW0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 May 2015 16:05:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=E6x6fhYN c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=6WwC1E4SZSZHZn3zVeUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 34D1F200EB;	Mon,
	11 May 2015 17:05:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 May 2015 17:05:39 -0400
Message-id: <1431378339-10594-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1431378339-10594-1-git-send-email-denis@denix.org>
References: <1431378339-10594-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] layer.conf: mark safe deps from allarch to arch/mach specific packages
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
X-List-Received-Date: Mon, 11 May 2015 21:06:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Avoid repackaging allarch packages when they RDEPENDS on arch/machine specific
packages. Part of md5sum package mismatch fixes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/layer.conf |  5 +++++
 meta-arago-extras/conf/layer.conf | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 2a5088a..ce5aed7 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -7,3 +7,8 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro = "10"
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+    weston-init->weston \
+    weston-init->kbd \
+"
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index d3064e5..89020db 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -12,3 +12,13 @@ BBFILE_PRIORITY_meta-arago-extras = "10"
 ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+    matrix-multimedia-demo-aac->amsdk-av-files \
+    matrix-multimedia-demo-audiocapture->amsdk-av-files \
+    matrix-multimedia-demo-h264dec->amsdk-av-files \
+    matrix-multimedia-demo-mpeg4aacdec->amsdk-av-files \
+    matrix-multimedia-demo-mpeg4dec->amsdk-av-files \
+    matrix-lighttpd-config->lighttpd \
+    matrix-lighttpd-config->lighttpd-module-setenv \
+"
-- 
2.2.0


