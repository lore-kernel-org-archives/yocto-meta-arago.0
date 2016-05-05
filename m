Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 119D052A3C
	for <meta-arago@arago-project.org>;
	Thu,  5 May 2016 04:29:47 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6O001YFSGXO290@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 04 May 2016 23:29:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=5R5U5YdR9sQMv4jq17YA:9
Received: by 100.15.86.14 with SMTP id 159d3fe5; Thu, 05 May 2016 04:29:31 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 32A9E161FC8;	Thu,
	5 May 2016 00:29:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 05 May 2016 00:29:20 -0400
Message-id: <1462422560-24519-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] common-csl-ip-rtos: depend on doxygen-native
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
X-List-Received-Date: Thu, 05 May 2016 04:29:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend            | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-distro/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend

diff --git a/meta-arago-distro/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/meta-arago-distro/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
new file mode 100644
index 0000000..e0235ff
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
@@ -0,0 +1 @@
+DEPENDS += "doxygen-native"
-- 
2.2.0


