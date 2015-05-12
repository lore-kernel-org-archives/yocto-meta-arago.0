Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 9D6E9529AE
	for <meta-arago@arago-project.org>;
	Tue, 12 May 2015 01:48:42 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NO7009ZBROPKC00@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 May 2015 20:48:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=AawGxMSu c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=PAp29Sf3gKfwpv2jMhEA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BA0DF20076;	Mon,
	11 May 2015 21:48:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 May 2015 21:48:25 -0400
Message-id: <1431395305-14703-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] layer.conf: add oprofile and example to siggen safe deps for matrix-gui-oprofile-demos
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
X-List-Received-Date: Tue, 12 May 2015 01:48:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 2e3ebf3..bbfd594 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -15,5 +15,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
     matrix-gui-multimedia-demos->amsdk-av-files \
+    matrix-gui-oprofile-demos->oprofile \
+    matrix-gui-oprofile-demos->oprofile-example \
     matrix-lighttpd-config->lighttpd \
 "
-- 
2.2.0


