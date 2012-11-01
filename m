Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id DA432529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:47:22 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2638100obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cp9px8BsP5ZICLTcOl6qnjV7CnPip80ekMYffQbCwRE=;
	b=jhGlx521LC+max88xXK/vA8Gqup6zNKjvBn4wCFtVF1Gm+LlPgpLYYuUCzL/zEQPph
	U3BOQejgW9MVlQ848+7Mmd+UE0aU9D8fAkjRpQ0ZoNPfM61CFiR8G74CP5R5OSRl47v4
	a32oRFWvZslK8M/8qKE1QwnduG7pNW8iDY4V9bsdN+SwjfGhQsQzTFdXkxfkCNj/qSh2
	hxbb2VhdHIGk0BGtX+rLCzkJiiL/Xtfr2itzQ1aI8EEccFhs1lDkdOsrKp5BvLsj92hb
	aMaPD7OaAvvKJd8opF5n/tvFXhaTwJDoZ7qgnzRxlxXmwsrhdT0aiiJEaPLOOnj0IXDV
	n2CA==
Received: by 10.60.14.200 with SMTP id r8mr29506673oec.45.1351795642662;
	Thu, 01 Nov 2012 11:47:22 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id fo6sm6966882obc.20.2012.11.01.11.47.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:47:22 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:47:19 -0500
Message-Id: <1351795639-5706-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] qt4-embedded-gles: Add append to include arago-qt4.inc
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
X-List-Received-Date: Thu, 01 Nov 2012 18:47:23 -0000

* Use the arago-qt4.inc file to pick up some of the shared qt4-embedded
  tweaks.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../qt4/qt4-embedded-gles_4.8.0.bbappend           |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bbappend
new file mode 100644
index 0000000..f9e5810
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bbappend
@@ -0,0 +1,3 @@
+require arago-qt4.inc
+
+PR := "${PR}.0"
-- 
1.7.0.4


