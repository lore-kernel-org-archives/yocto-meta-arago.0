Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by arago-project.org (Postfix) with ESMTPS id 5FB1352A5D
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:42 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id j6so472521oag.8
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=y3/Sg1Ko7qsXkcb2qMljDUyxeevGKklkeao/2TDs9qc=;
	b=Cxhow4qzDYOcRpmQIkfDdys6icPMfKql1+XlviyEr66gWizt7+kSR+MUjJaw5dlbAy
	4ZPyMBDqyuqTMatHxhk289CrbHODeK/lnOUtCODckbnnE/n4Ynn6BmPRtUBxv/O2EZxq
	Z/a/sNkHkVwXZZZBLjABZFhjr/07beQjvyivDT1mHHTOno8GPqB7nlMibQeflwj5jRck
	No591c0D7FXpL+oBgEn4Hy44VGrxwYBi4iqNJBnB0U5LMtvaWftLOINRkGfgbFyaRLQj
	5wClYvsnYAUkFjaptEmThO/o9RKyaPP8SFZmE9CmFvXlbpwZQgHNyb12U00rU8uAmDDF
	Zgbg==
X-Received: by 10.60.169.207 with SMTP id ag15mr11572154oec.120.1359393941371; 
	Mon, 28 Jan 2013 09:25:41 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.39
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:40 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:02 -0600
Message-Id: <1359393932-31361-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 02/32] tiff: Remove xz and lzma dependency
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:43 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Remove xz and lzma dependency to avoid pulling additional GPLv3 software.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-multimedia/tiff/tiff_4.0.1.bbappend    |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/tiff/tiff_4.0.1.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/tiff/tiff_4.0.1.bbappend b/meta-arago-distro/recipes-multimedia/tiff/tiff_4.0.1.bbappend
new file mode 100644
index 0000000..e7b627f
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/tiff/tiff_4.0.1.bbappend
@@ -0,0 +1,6 @@
+PR_append = "-arago0"
+
+# Remove xz/lzma support to avoid pulling in additional GPLv3 licenses
+DEPENDS := "${@oe_filter_out('xz','${DEPENDS}', d)}"
+EXTRA_OECONF += " --disable-lzma"
+
-- 
1.7.0.4


