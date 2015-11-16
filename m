Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 66EB752976
	for <meta-arago@arago-project.org>;
	Mon, 16 Nov 2015 14:55:03 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXW00FQDXFGCEC0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Nov 2015 08:54:52 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=DoBXezo4zUEr8cRSZFsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4586B161D1E;	Mon,
	16 Nov 2015 09:54:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Nov 2015 09:54:51 -0500
Message-id: <1447685691-345-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-source-ipk.conf: enable packaging sources for RT kernel
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
X-List-Received-Date: Mon, 16 Nov 2015 14:55:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 09e6ce4..476ace3 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -147,6 +147,11 @@ SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCA
 SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
 SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging = "true"
 
+CREATE_SRCIPK_pn-linux-ti-staging-rt = "1"
+SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt = "board-support/linux-rt-${PV}${KERNEL_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt = "true"
+SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt = "true"
+
 CREATE_SRCIPK_pn-sitara-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
 SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging = "true"
-- 
2.2.0


