Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id AAD1F529EA
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 02:16:00 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6K0007TWY96N80@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 May 2016 21:15:45 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=ZnpdZ7Og_Se2PUKZ_yoA:9
Received: by 100.15.86.14 with SMTP id 1c0076cb; Tue, 03 May 2016 02:15:45 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C7A2B161FD2;	Mon,
	2 May 2016 22:15:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 May 2016 22:15:44 -0400
Message-id: <1462241744-1543-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] oprofile: drop unneeded bbappend
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
X-List-Received-Date: Tue, 03 May 2016 02:16:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

New recipe/package doesn't need to be made machine-specific

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-kernel/oprofile/oprofile_1.0.0.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/oprofile/oprofile_1.0.0.bbappend

diff --git a/meta-arago-distro/recipes-kernel/oprofile/oprofile_1.0.0.bbappend b/meta-arago-distro/recipes-kernel/oprofile/oprofile_1.0.0.bbappend
deleted file mode 100644
index 1386a89..0000000
--- a/meta-arago-distro/recipes-kernel/oprofile/oprofile_1.0.0.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = "-arago0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.2.0


