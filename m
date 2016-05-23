Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id C99AE529CB
	for <meta-arago@arago-project.org>;
	Mon, 23 May 2016 16:48:01 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7N0028Q2NMLAO0@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 23 May 2016 11:47:47 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=ZaBad1_a5v2XY7BltvAA:9
Received: by 100.15.86.14 with SMTP id 09c32ff8; Mon, 23 May 2016 16:47:46 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2F8D516200B;	Mon,
	23 May 2016 12:47:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 May 2016 12:47:45 -0400
Message-id: <1464022065-1420-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] systemd: fix network unit using slightly different option than the rest
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
X-List-Received-Date: Mon, 23 May 2016 16:48:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd/10-eth.network | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
index ea3bcb3..5d95866 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
@@ -1,6 +1,6 @@
 [Match]
 Name=eth*
-ConditionKernelCommandLine=!root=/dev/nfs
+KernelCommandLine=!root=/dev/nfs
 
 [Network]
 DHCP=yes
-- 
2.2.0


