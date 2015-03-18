Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id D0C9452A0B
	for <meta-arago@arago-project.org>;
	Wed, 18 Mar 2015 04:32:03 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLE00G764KZUS50@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 17 Mar 2015 23:31:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=A7bb5BSD c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=RsiWkGWlsLb9EDfLu-4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 792B3200EF;	Wed,
	18 Mar 2015 00:31:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 18 Mar 2015 00:31:45 -0400
Message-id: <1426653106-24291-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] gstreamer1.0-libav: fix cross-compile failure due to wrong ranlib prefix
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
X-List-Received-Date: Wed, 18 Mar 2015 04:32:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend       | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
new file mode 100644
index 0000000..f32ed69
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
@@ -0,0 +1 @@
+LIBAV_EXTRA_CONFIGURE_COMMON_ARG += "--cross-prefix='${HOST_PREFIX}'"
-- 
2.2.0


