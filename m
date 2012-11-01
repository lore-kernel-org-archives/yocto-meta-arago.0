Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 5B2DD529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:41:21 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2653916oag.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JiG+/Nh8jeNQgptaSMxs9xLhZnwYplOWeLg3z4RYD5U=;
	b=DOwW0hg1trX/uQg/Oa7faEym/3hJHjXByXVMvLwSHpXhFdtD1KBBH9fBa5turZCCMv
	YieG5X/q21OWBh5EQ310ZXd4fnzxh6wXI3mKBlM9A8YonzEKE/K7resUDdDCgdyttwOT
	4+Ky9yKM9wq7+T4TlIgAU44sKndW4CKiRDFWXEJiyzWi9bkLOvh8UDMEAAyu8bKHKrmZ
	4qrwpHzssOzRucXs+XbhlQhKDDGF10jIjvAWtvHAN7B578n2lVgFBYUEkofd5PJ/aHsS
	veKIicniv6fdMybo1LIalvHuiMPq1a5fgSLgzilwrRO+lTxJ/FCY2HCHTov9HLl3RY90
	Iocw==
Received: by 10.60.10.37 with SMTP id f5mr27796131oeb.2.1351795280886;
	Thu, 01 Nov 2012 11:41:20 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m9sm5460377oem.4.2012.11.01.11.41.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:41:20 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:41:17 -0500
Message-Id: <1351795277-4906-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] am-sysinfo: Update am-sysinfo to pulled in makefile fix
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
X-List-Received-Date: Thu, 01 Nov 2012 18:41:21 -0000

* Updated commit addressed an issue that required the makefile to create and
  remove the Release and Debug directory.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index 2ec4e92..a5e0afe 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e7
 SECTION = "system"
 
 PACKAGE_STRIP = "no"
-PR = "r5"
+PR = "r6"
 
 BRANCH ?= "master"
-SRCREV = "f2b325741ebcd440c4b2fc91a65270391224426e"
+SRCREV = "86e936b0a50e450089471b53ae8c68e933c15bbd"
 
 SRC_URI = "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


