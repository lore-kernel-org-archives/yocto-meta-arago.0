Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id DDB8F52A4F
	for <meta-arago@arago-project.org>;
	Sat, 23 May 2015 02:21:06 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOS00HX26IGA401@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 22 May 2015 21:20:41 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=PIC4Ikvq c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8 a=lRxpQPx1AAAA:8	a=pKi1nqHu4GpayMXtSwsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CF14F20087;	Fri,
	22 May 2015 22:20:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 22 May 2015 22:20:39 -0400
Message-id: <1432347639-17451-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] layer.conf: add matrix-gui-settings-demos safe deps to am-sysinfo
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
X-List-Received-Date: Sat, 23 May 2015 02:21:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/conf/layer.conf                                      | 1 +
 meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 3e48c5c..8b3609a 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -21,5 +21,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
     matrix-gui-armbenchmarks-demos->arm-benchmarks \
     matrix-gui-armbenchmarks-demos->lmbench \
     matrix-gui-armbenchmarks-demos->nbench-byte \
+    matrix-gui-settings-demos->am-sysinfo \
     matrix-lighttpd-config->lighttpd \
 "
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
index faa64a3..927c8f9 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 inherit allarch
 
-- 
2.2.0


