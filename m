Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 2D57A529AE
	for <meta-arago@arago-project.org>;
	Mon, 11 May 2015 21:38:11 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NO700C1EG2RU530@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 May 2015 16:37:49 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=AawGxMSu c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=6WwC1E4SZSZHZn3zVeUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 012D720091;	Mon,
	11 May 2015 17:37:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 May 2015 17:37:38 -0400
Message-id: <1431380258-28041-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH v2 2/2] layer.conf: mark safe deps from allarch to arch/mach specific packages
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
X-List-Received-Date: Mon, 11 May 2015 21:38:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Avoid repackaging allarch packages when they RDEPENDS on arch/machine specific
packages. Part of md5sum package mismatch fixes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - even though fixing package level issue, siggen operates on recipe level

 meta-arago-distro/conf/layer.conf | 5 +++++
 meta-arago-extras/conf/layer.conf | 5 +++++
 2 files changed, 10 insertions(+)

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
index d3064e5..2e3ebf3 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -12,3 +12,8 @@ BBFILE_PRIORITY_meta-arago-extras = "10"
 ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+    matrix-gui-multimedia-demos->amsdk-av-files \
+    matrix-lighttpd-config->lighttpd \
+"
-- 
2.2.0


