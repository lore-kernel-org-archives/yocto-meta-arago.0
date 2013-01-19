Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by arago-project.org (Postfix) with ESMTPS id E111152AB3
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:49 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id l10so5043128oag.36
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=aADK8A54ddF/V9C7Dzw3IhKGTvqzz36eGq1Flb2hnis=;
	b=KagP2nQBH1pG029t0GSxLXa7HDprFNwMnO9vHlY5mJXHYyv46970kMcmXspUJBaRkj
	WhAIPJ3DiDkvJNsev2pmKuLj9nPo20iISREUtNnzeNFa3ft1BximIwpafvlBRdSPQC7I
	GcvNYP/hDrxxCYUWBU3vDtyroQfFzqz7e6ybBx0b6MPgMwEgQ1CTQGLgHwWeDal4ZwHI
	pQE8YpOAExJns5hXaZWtNaMUOsvH6lURjfBRSMG+ES7h57L0RV8nryRTw2DhfnjymXYD
	VN5zwAil+y/sw6vN4/VLEPwETBXdTSoZKlnRzz98khfIQCY1mffpxxq1XzVxi+N8E+m6
	EquQ==
X-Received: by 10.60.169.205 with SMTP id ag13mr10527567oec.40.1358632369333; 
	Sat, 19 Jan 2013 13:52:49 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.47
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:48 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:52 -0600
Message-Id: <1358632316-12266-27-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 27/31] task-arago-qte-sdk-target: Delete unused task
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:50 -0000

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


