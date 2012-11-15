Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id A84F252988
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 23:26:04 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2087232oag.38
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 15:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Gi63hpadIKWXYczdt7MYggp+hdodkJMYrtuh53R3JDk=;
	b=Y7ColBXfWUk7SiTT7/ldCufx9x+Y2FF8aOi6tBJYoydZ9MgiksiUjvpYsv2osEfZti
	TPveLTR3eTVdUAPeUhTiWC/WWGL2yYF4eOU7Z8p1V7CbX/or2czTVKJxK2K+pu7I81Su
	NOjdhDwt/KWuHcBbpl6lj+/UmSZfOglPQVHNFIvPG9I7bEknQzDTSsFIKF8PTxQ7GHxU
	HJJ7ozau3yuOKNS77zQgwpuHDdaDGPgJOfItV7V60kch272YfEL+YKydh0+vEir4h23l
	Bpfphnj5zuW1p6IPnty6TCRuC4BH2jzHbBj1dxZM+UQp+S3pQmMmoXkl0b9piEX0cjyq
	PdIg==
Received: by 10.60.4.227 with SMTP id n3mr2303598oen.136.1353021964092;
	Thu, 15 Nov 2012 15:26:04 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm13533403oeb.3.2012.11.15.15.26.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 15:26:03 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Nov 2012 17:25:55 -0600
Message-Id: <1353021956-18687-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353021956-18687-1-git-send-email-fcooper@ti.com>
References: <1353021956-18687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] task-arago-qte: Add additional packages
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
X-List-Received-Date: Thu, 15 Nov 2012 23:26:04 -0000

* Adding additional packages that were automatically installed with Qt in
  classic Arago but not being done now.
* This insures the packages installed in the old SDK matches the new one.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-qte.bb           |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
index 420a061..e2acea5 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
@@ -1,10 +1,17 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 
+QT_SGX_SUPPORT = "\
+    qt4-embedded-plugin-gfxdriver-gfxpvregl \
+    qt4-embedded-gles \
+    libqt-embeddedopengl4 \
+    libqt-embeddedpvrqwswsegl4 \
+"
+
 RDEPENDS_${PN} = "\
     qt4-embedded \
     qt4-embedded-plugin-mousedriver-tslib \
@@ -13,5 +20,8 @@ RDEPENDS_${PN} = "\
     qt4-embedded-plugin-imageformat-gif \
     qt4-embedded-plugin-imageformat-jpeg \
     qt4-embedded-qml-plugins \
-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'qt4-embedded-plugin-gfxdriver-gfxpvregl', '', d)} \
+    libqt-embeddedmultimedia4 \
+    libqt-embeddeddeclarative4 \
+    libqt-embeddedxmlpatterns4 \
+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', '${QT_SGX_SUPPORT}', '', d)} \
 "
-- 
1.7.0.4


