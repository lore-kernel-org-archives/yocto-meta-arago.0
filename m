Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 13B435208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:07 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JiG+/Nh8jeNQgptaSMxs9xLhZnwYplOWeLg3z4RYD5U=;
	b=BrlkQyKv+aFtONXsKrN6S731PJM5veK+tcQ5xayG7o8solhTDmU+wHbUJCKDitZbrd
	tr+SKPcddsxgjvwVGD0uzbNGSfOOzGqC6uVY+xCCt/9EjjV3CzUrg7jjVCmm9BuKw6cg
	lzen+hgrVztiT2kKmu/2PLmev2jv4L8yrptHqR/7p+f9Xjxf6/RXQmKKY5UGLQAufLr4
	dvGkVuDhZR9keX66SyJIFeiK9xbXmSddq/2OdQhYZwZtTewK3C6XPLhWIk8jqeqopD2B
	Vng79YjzR4zySO1yiLDZ2hd0pl1ZFEuRmtjDA6Qj52Vo5ITbervGqfpl2ubmkMKsrZb/
	UKyA==
Received: by 10.60.31.177 with SMTP id b17mr6573944oei.77.1352080447707;
	Sun, 04 Nov 2012 17:54:07 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:07 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:12 -0600
Message-Id: <1352080417-9792-15-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 17/42] am-sysinfo: Update am-sysinfo to pulled in makefile fix
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:08 -0000

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


