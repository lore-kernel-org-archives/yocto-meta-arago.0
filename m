Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 3093A52A16
	for <meta-arago@arago-project.org>;
	Tue, 12 Apr 2016 21:21:07 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5J00FB5HYRCD90@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Apr 2016 16:20:52 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=OHcKQydtSPKzqyCZWPAA:9
Received: by 100.15.86.14 with SMTP id 69c52490; Tue, 12 Apr 2016 21:20:52 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 522AE161F9C;	Tue,
	12 Apr 2016 17:20:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 Apr 2016 17:20:50 -0400
Message-id: <1460496050-927-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] dhcp: drop old bbappend
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
X-List-Received-Date: Tue, 12 Apr 2016 21:21:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend b/meta-arago-distro/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend
deleted file mode 100644
index 2938186..0000000
--- a/meta-arago-distro/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.2.0


