Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id CB1C4529C7
	for <meta-arago@arago-project.org>;
	Mon, 23 May 2016 03:51:49 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7M00EKM2PYN350@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 22 May 2016 22:51:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=VFM3r7RLMnCgrZ9uaY0A:9
Received: by 100.15.86.14 with SMTP id 228a3050; Mon, 23 May 2016 03:51:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E0E6F162012;	Sun,
	22 May 2016 23:51:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 22 May 2016 23:51:33 -0400
Message-id: <1463975493-22963-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] systemd: skip network config on nfsroot
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
X-List-Received-Date: Mon, 23 May 2016 03:51:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd/10-eth.network | 1 +
 meta-arago-distro/recipes-core/systemd/systemd_%.bbappend     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
index 93dc1c5..ea3bcb3 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
@@ -1,5 +1,6 @@
 [Match]
 Name=eth*
+ConditionKernelCommandLine=!root=/dev/nfs
 
 [Network]
 DHCP=yes
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index f2e7fbb..ca67eee 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
2.2.0


