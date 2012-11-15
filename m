Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 3C4FB52988
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 23:26:02 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eq6so2082777obc.38
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 15:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aADK8A54ddF/V9C7Dzw3IhKGTvqzz36eGq1Flb2hnis=;
	b=iTZ+wfwfc13Jjo6gdX8pyTd5oss2iOnsHnjOB73uXuaVRFovwYCWuuwJGDfEr8bErA
	anZe8ckcxGd6YxDlMKGetnOZ460/UdPBrj6ZOWaEkGIL/gq7Cdgyn+MRlbZ1723jTSAo
	/29Ah4k306jmBsIxqv3h0vcdomkSIRice3tk+fZsnwL7SenkeW+KbcJheW3BVdjtmbqk
	CrlTdbwl153bUtCwSR/yosXLPGoKZRWYa9Htmmhv2Z4tO5jJvlAopgTfCFy4r+JjoH1F
	Oo601XeBuJGMsKtJdbW1Z3bdC/ngK4xX7DW1HJeOnhRey+vm5hPNhaTKHJpOyZwzh3aL
	A3vw==
Received: by 10.60.21.233 with SMTP id y9mr2448348oee.78.1353021961325;
	Thu, 15 Nov 2012 15:26:01 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm13533403oeb.3.2012.11.15.15.25.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 15:26:00 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Nov 2012 17:25:54 -0600
Message-Id: <1353021956-18687-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3] task-arago-qte-sdk-target: Delete unused task
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
X-List-Received-Date: Thu, 15 Nov 2012 23:26:03 -0000

* This task is no longer needed since task-arago-qte-toolchain-target.bb
  provides the same functionality.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-qte-sdk-target.bb             |   28 --------------------
 1 files changed, 0 insertions(+), 28 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb
deleted file mode 100644
index cf444f9..0000000
--- a/meta-arago-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Task to build and install Qt embedded headers and libs into the sdk"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
-
-inherit task
-
-RDEPENDS_${PN} = "\
-    qt4-embedded-dev \
-    qt4-embedded-mkspecs \
-    libqt-embeddedphonon4-dev \
-    libqt-embedded3support4-dev \
-    libqt-embeddedclucene4-dev \
-    libqt-embeddedcore4-dev \
-    libqt-embeddeddbus4-dev \
-    libqt-embeddeddesignercomponents4-dev \
-    libqt-embeddeddesigner4-dev \
-    libqt-embeddeduitools4-dev \
-    libqt-embeddedgui4-dev \
-    libqt-embeddedhelp4-dev \
-    libqt-embeddednetwork4-dev \
-    libqt-embeddedscript4-dev \
-    libqt-embeddedscripttools4-dev \
-    libqt-embeddedsvg4-dev \
-    libqt-embeddedtest4-dev \
-    libqt-embeddedwebkit4-dev \
-    libqt-embeddedxml4-dev \
-"
-- 
1.7.0.4


