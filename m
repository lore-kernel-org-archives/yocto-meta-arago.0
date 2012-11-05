Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 0DBB552A1C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:16 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0Q04ZdmFdZ9AtcHw8OWooRCSIrqtxApyft0qK10WSXA=;
	b=L3w+ftBLWNlZ1ukzHfZY7LEQSxVmM7+TkmDjyeS9Q/L1Ql35B1iWxoCCk3Vck80fK5
	XtdY0V3AC6gYUrBY0wzsMyMB/X5bGlkkXcBaqKv4s1iTlVqC7X+SCAXG81Sq+bO5TYNP
	Ao3CqDvvz0+A3I4rK3Xi7lzqBY1inLER9PibGwULT+rOTXWCSgzybMULRQuBdlgabGQJ
	1Vim2zIdsmtYoG7rzPZ2CXZNisSg7qW3gPCf1ZhvsqzxEkK+7RV+33ax0mNDFL3AUekH
	KtoHbq9gkl/qpUPn7SiuZH0ZrBUFtr0jtgKe4on+SQGJ0ObewSMHqI/YjXsr1bc2KG5/
	UV1w==
Received: by 10.60.7.106 with SMTP id i10mr6571802oea.5.1352080456762;
	Sun, 04 Nov 2012 17:54:16 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:16 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:21 -0600
Message-Id: <1352080417-9792-24-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 26/42] arago-qt4.inc: Introduce arago-qt4.inc file
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:17 -0000

* Some settings and patches are required for both qt4-embedded and
  qt4-embedded-gles. Placing these common changes in a include file.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc

diff --git a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
new file mode 100644
index 0000000..0e80318
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
@@ -0,0 +1,8 @@
+# Common file for patches or tweaks that are needed by qt4-embedded and
+# qt4-embedded-gles
+
+PR := "${PR}-arago2"
+
+# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
+# For our distribution purposes we only use LGPLv2.1
+LICENSE = "LGPLv2.1"
-- 
1.7.0.4


