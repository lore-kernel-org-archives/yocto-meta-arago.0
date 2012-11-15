Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 2222952A0A
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 23:57:13 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2105502oag.38
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 15:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=GoEPpivjgLM9p4qtGxixwXhZYo6UR00rAL4jbnw7+uw=;
	b=xXpt4aqtDPtoEHYQtJWz9KaURd/RnpT9yyPZ7eP+gXsD8Uo/1LMEHz+AndWaXDkM8+
	hYwx0pcMd8XXKgw6D5B7yt4WlfnEe0gILGCYmHGHPmIJm1IRY1QCmBzyzmXiDjEZnRlz
	UzFTvDJMBSYM+HXqe+FRMoYk/F2QnzBrZ+VP7Kk+oI9tfgoXStkCMD9s3KScgqvAKDv8
	HNbq09CbuNErUX1v1ReScN3YEUaRQRpGEYUvpq2UpMPj33n67jerjyxPPh+oEMivRhRr
	u/Ny9taip2SMp1Q0u+n3gtr5+xin/NvrBQdqiyZKcOqrH216+KbMBD/urr+h15R90XID
	q+2w==
Received: by 10.182.127.102 with SMTP id nf6mr2542531obb.14.1353023832713;
	Thu, 15 Nov 2012 15:57:12 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id hz6sm17313073obb.1.2012.11.15.15.57.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 15:57:12 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Nov 2012 17:57:06 -0600
Message-Id: <1353023826-19449-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353023826-19449-1-git-send-email-fcooper@ti.com>
References: <1353023826-19449-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/3] task-arago-qte-toolchain-target: Add additional packages
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
X-List-Received-Date: Thu, 15 Nov 2012 23:57:13 -0000

* Adding additional packages that were automatically installed with Qt in
  classic Arago but not being done now.
* This insures the packages installed in the old SDK matches the new one.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-qte-toolchain-target.bb       |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
index d919af2..7547e0f 100644
--- a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target.bb
@@ -2,11 +2,17 @@ DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+
+QT_SGX_SUPPORT = "\
+    libqt-embeddedopengl4-dev \
+    libqt-embeddedpvrqwswsegl4-dev \
+"
+
 RDEPENDS_${PN} += " \
         task-core-standalone-sdk-target \
         qt4-embedded-mkspecs \
@@ -30,4 +36,8 @@ RDEPENDS_${PN} += " \
         libqt-embeddedwebkit4-dev \
         libqt-embeddedxml4-dev \
         libsqlite3-dev \
-        "
+        libqt-embeddedxmlpatterns4-dev \
+        libqt-embeddedmultimedia4-dev \
+        libqt-embeddeddeclarative4-dev \
+        ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles','${QT_SGX_SUPPORT}', '', d)} \
+"
-- 
1.7.0.4


