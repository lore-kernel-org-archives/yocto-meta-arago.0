Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by arago-project.org (Postfix) with ESMTPS id 24F37529DD
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:44 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id za17so2857664obc.3
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=67RWvfGndR1Gs/s/bQeQIwiyAGzzDJ3OrfWDeCNoUBQ=;
	b=PXQvMiWRkwFaBUljUIjXOCUDKzu2sDlglTuV8wFMOjmhGXF4dTd8ljKQP5h0RG7huN
	ZsFwxmyFzP16ek+EZETAOPSdYzOJbIhCG3tYE4eYvoRltAg/EednSYYGL1SAHhQxfkfb
	l/xMMGETmtRr7I+r+OxzXHqMeYODVVF8preSuMf48MqZwVkI2RqnKUB9mhg54qXHxhpm
	o9l+VgLIJENSteHQlfiF0QLkAm3vDecKFLMe9JUpNEpcbJLxRiy5vDJx5e4pyDXtHmHk
	38mG3m4y6qFo/F6BQwYlZ3n3z+WVMFLvJaicAxsdjBE49x8703dGF8AFG2gx4JKjA5YQ
	fZMw==
X-Received: by 10.182.228.4 with SMTP id se4mr54661obc.60.1358445223511;
	Thu, 17 Jan 2013 09:53:43 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.41
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:42 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:11 -0600
Message-Id: <1358445195-22441-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 08/12] task-arago-tisdk-qte: Add Qt quick-playground application.
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:44 -0000

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


