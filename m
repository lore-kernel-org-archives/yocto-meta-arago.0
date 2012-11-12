Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id E833D5208C
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:41:05 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6212054oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=67RWvfGndR1Gs/s/bQeQIwiyAGzzDJ3OrfWDeCNoUBQ=;
	b=m5/s9qxZMnOOcAgZMXKGj3JOEWIhFNGV3993aKzTgEYquBR7Z62kEqmWBh3oVUgp5F
	tuw42S68CWD2riJt/VFY8U2xGgFHRpiJGOKWt4bqwcphr1oq0vJ1xaqnprDdmRKfUB+6
	+pbFwd+DFJWRMwcWFlULYBcflTh07yy01TdmqBIVVRjZhhTUU9mx5zpsQBNP50GiHCR+
	I80ecZUQzyMHHaAJuLIDoOmrfl/whGERbBL3rd0+0zvIu5J2G5HKc3PahmpbqhlPrBd/
	tCER02eEZ3DKb0Y8EAPvMXHaluwwMquyvyXqhnSCrfKlfeZ0ncByUXhAEPZ8yDYoGJ0c
	y40w==
Received: by 10.60.2.65 with SMTP id 1mr15400835oes.19.1352760065632;
	Mon, 12 Nov 2012 14:41:05 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d7sm4394896oee.2.2012.11.12.14.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:41:05 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:40:54 -0600
Message-Id: <1352760055-6119-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352760055-6119-1-git-send-email-fcooper@ti.com>
References: <1352760055-6119-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] task-arago-tisdk-qte: Add Qt quick-playground application.
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
X-List-Received-Date: Mon, 12 Nov 2012 22:41:06 -0000

* Add quick-playground to the list of Qt applications to include in the Sitara
  SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-qte-sdk-host.bb         |    4 +++-
 .../recipes-core/tasks/task-arago-tisdk-qte.bb     |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-host.bb
index b68d1c7..d42afca 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-host.bb
@@ -1,12 +1,14 @@
 DESCRIPTION = "Task to add Qt embedded related sources into the sdk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 QT_DEMOS = "\
     qt-tstat-src \
+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb
index 63ef58a..56f5178 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb
@@ -1,14 +1,16 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 QT_DEMOS = "\
     qt4-embedded-examples \
     qt4-embedded-demos \
     qt-tstat \
+    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \
 "
 
 RDEPENDS_${PN} = "\
-- 
1.7.0.4


