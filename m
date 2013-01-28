Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by arago-project.org (Postfix) with ESMTPS id 5A6ED52A24
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:29 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id dn14so3047154obc.18
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=C6fnlGBp5fy2PSEUGrJ4LHpyotXMK6/zSlgJqWYtnjc=;
	b=NMZ65jtfBTAqHy/Bqhxi00NtUOnZruFBMVSG3YX9h/VOA/LpqbnphWRA/y2B6JnaJY
	bLxOwW1a7iXOFRys2Ir7bhIWnZ/ZqZIDego/SfuXz9Qf+GwjPpwfXximGxt/e3ZVTkFs
	katwJZ4xA4Q4VbhtujKETyiZMBbIkYGuKgrlrgL93YJ9Lkxnj1Z2QTjYVLxZO3xFYzvv
	xkzWRaSI+XbHL0O6B46srHSWnxo4BjNkPlsugEta1/+a7TYclQtjuR34czXZZNwGXbKk
	JTIxTB7v+iwm9lTNV0x8YM3C6U2aflK9F/hKMHz7u1A0FI4ptTnEz9sT1Hhehvx4kfjS
	gG6w==
X-Received: by 10.60.0.136 with SMTP id 8mr11709901oee.35.1359393988906;
	Mon, 28 Jan 2013 09:26:28 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.26
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:27 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:28 -0600
Message-Id: <1359393932-31361-28-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 28/32] qt4-embedded: Add patch to fix QWSLOCK messages
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:29 -0000

From: Jeff Lance <j-lance1@ti.com>

* Semaphores were not being managed properly. Some functions were removing
  semaphores they did not own.
* This patch is based on this web page:
    http://www.mail-archive.com/community@lists.openmoko.org/msg65512.html
* However, all the qDebug statements have been removed.

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc     |    6 +-
 .../qt4/files/0002-qwslock-messages.patch          |   67 ++++++++++++++++++++
 2 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt4/files/0002-qwslock-messages.patch

diff --git a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
index 0faf8ac..0291555 100644
--- a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
+++ b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
@@ -1,7 +1,7 @@
 # Common file for patches or tweaks that are needed by qt4-embedded and
 # qt4-embedded-gles
 
-PR := "${PR}-arago3"
+PR := "${PR}-arago4"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
@@ -10,4 +10,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 # For our distribution purposes we only use LGPLv2.1
 LICENSE = "LGPLv2.1"
 
-SRC_URI += "file://0001-PATCH-make-demos-maximized-for-TISDK-use.patch"
+SRC_URI += "file://0001-PATCH-make-demos-maximized-for-TISDK-use.patch \
+            file://0002-qwslock-messages.patch \
+"
diff --git a/meta-arago-distro/recipes-qt/qt4/files/0002-qwslock-messages.patch b/meta-arago-distro/recipes-qt/qt4/files/0002-qwslock-messages.patch
new file mode 100644
index 0000000..d1355a7
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt4/files/0002-qwslock-messages.patch
@@ -0,0 +1,67 @@
+From f18e63824df6bcbadc99f8efa26aae6c425fd5bc Mon Sep 17 00:00:00 2001
+From: Jeff Lance <j-lance1@ti.com>
+Date: Thu, 13 Dec 2012 07:13:11 -0600
+Subject: [PATCH] Adding patch to fix QWSLOCK message issue
+
+---
+ src/gui/embedded/qwslock.cpp |   11 +++++++----
+ src/gui/embedded/qwslock_p.h |    2 +-
+ 2 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/src/gui/embedded/qwslock.cpp b/src/gui/embedded/qwslock.cpp
+index f9ea000..7d8b6c2 100644
+--- a/src/gui/embedded/qwslock.cpp
++++ b/src/gui/embedded/qwslock.cpp
+@@ -82,10 +82,12 @@ QWSLock::QWSLock(int id) : semId(id)
+ #ifndef QT_NO_QWS_SIGNALHANDLER
+     QWSSignalHandler::instance()->addWSLock(this);
+ #endif
++    owned = false;
+ 
+ #ifndef QT_POSIX_IPC
+     if (semId == -1) {
+         semId = semget(IPC_PRIVATE, 3, IPC_CREAT | 0666);
++        owned = true;
+         if (semId == -1) {
+             perror("QWSLock::QWSLock");
+             qFatal("Unable to create semaphore");
+@@ -100,7 +102,6 @@ QWSLock::QWSLock(int id) : semId(id)
+     }
+ #else
+     sems[0] = sems[1] = sems[2] = SEM_FAILED;
+-    owned = false;
+ 
+     if (semId == -1) {
+         // ### generate really unique IDs
+@@ -134,9 +135,11 @@ QWSLock::~QWSLock()
+ 
+     if (semId != -1) {
+ #ifndef QT_POSIX_IPC
+-        qt_semun semval;
+-        semval.val = 0;
+-        semctl(semId, 0, IPC_RMID, semval);
++        if(owned) {
++            qt_semun semval;
++            semval.val = 0;
++            semctl(semId, 0, IPC_RMID, semval);
++        }
+         semId = -1;
+ #else
+         // emulate the SEM_UNDO behavior for the BackingStore lock
+diff --git a/src/gui/embedded/qwslock_p.h b/src/gui/embedded/qwslock_p.h
+index 71a4cca..7a74710 100644
+--- a/src/gui/embedded/qwslock_p.h
++++ b/src/gui/embedded/qwslock_p.h
+@@ -86,8 +86,8 @@ private:
+     int lockCount[2];
+ #ifdef QT_POSIX_IPC
+     sem_t *sems[3];
+-    bool owned;
+ #endif
++    bool owned;
+ };
+ 
+ QT_END_NAMESPACE
+-- 
+1.7.0.4
+
-- 
1.7.0.4


