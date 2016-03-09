Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id 62EF952A26
	for <meta-arago@arago-project.org>;
	Wed,  9 Mar 2016 21:47:17 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.150])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3S009QUKIDNX60@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 09 Mar 2016 15:47:02 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=0tGySW8maceftNfHUCUfCA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=rk4-OaFjr638JdsRy8AA:9
Received: by 100.15.86.14 with SMTP id 52d36cdc; Wed, 09 Mar 2016 21:47:02 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4F3A9161EE8;	Wed,
	9 Mar 2016 16:47:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 09 Mar 2016 16:47:00 -0500
Message-id: <1457560020-13398-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] branding-core: fix priority for ti-ipc-rtos package
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
X-List-Received-Date: Wed, 09 Mar 2016 21:47:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 914b334..99bedcf 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -16,4 +16,4 @@ SRCREV_pn-ltp-ddt = "${AUTOREV}"
 ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
 
 # Raise priority for sample IPC FW images
-ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos-fw = "15"
+ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
-- 
2.2.0


