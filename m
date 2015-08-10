Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 3D0A452A19
	for <meta-arago@arago-project.org>;
	Mon, 10 Aug 2015 17:55:36 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSV00ADXOFU2260@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 10 Aug 2015 12:55:17 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=tDgrSlVc-MQl9g1kGuAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6CC39161B50;	Mon,
	10 Aug 2015 13:55:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 10 Aug 2015 13:55:04 -0400
Message-id: <1439229304-20245-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ti-llvm3: llvm3.inc got unified into llvm.inc upstream
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
X-List-Received-Date: Mon, 10 Aug 2015 17:55:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb
index 9ae8866..a8eed48 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb
@@ -7,7 +7,6 @@ do_configure_prepend_class-native() {
 }
 
 require recipes-core/llvm/llvm.inc
-require recipes-core/llvm/llvm3.inc
 
 DEPENDS_append_class-native = " llvm-common-native"
 
@@ -100,4 +99,3 @@ llvm_sysroot_preprocess_target() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.2.0


