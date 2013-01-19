Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by arago-project.org (Postfix) with ESMTPS id 305B952ABF
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:39 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id n5so5006098oag.31
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=TXvONXVojmb1sI3bI8AvOuF4aX2bAZlIxcHcKJXk91E=;
	b=pETA2zi+ec+v5JEMKH3EDRAMCjCa+X7lILcKmT6hvoy2rk7H6OWmLmLtrEAGmNfhnR
	aT7vN/kKInsrYz9OtBBWmf3aJaELhDMAG2Uegpvu0lAMnDsNpnsutl5WuEVCg6MfMyQ/
	XHs2nPWDlIrHFiGeLIoEAGVmLp+Oi7zJtcA5JLLUrEbbPebmeOmtK52qtGvqHyvqw0OD
	4UUl3zSfesDKuvS2vbcvWaIaAPo2s2xh67HlptXZdXBbg5Kn8Jy6c5R4xVqYhtDSILIt
	EHx1dVTMjVNOzNjcSSWvwXlRi52CABwnLwy3faksqpfuzXA3iXXDWFkcgermyZruwcA/
	urTw==
X-Received: by 10.60.32.234 with SMTP id m10mr10326075oei.7.1358632358761;
	Sat, 19 Jan 2013 13:52:38 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:37 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:46 -0600
Message-Id: <1358632316-12266-21-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 21/31] task-arago-tisdk-connectivity: Add back battleship demo
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:39 -0000

* Battleship demo build error has been fixed. Add it back to the list of recipes
  to install.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-connectivity.bb         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
index 293b224..06601d6 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r1"
+PR = "r2"
 
 inherit task
 
@@ -51,12 +51,12 @@ BLUETOOTH_STACK = "\
     ussp-push \
 "
 
-# Need to add battleship to the below list once the application has been fixed
 DEMO_APPS = "\
     bluetooth-gui \
     wifi-direct-demo \
     wpa-gui-e \
     wl1271-demo \
+    battleship \
 "
 
 CONNECTIVITY_RDEPENDS = ""
-- 
1.7.0.4


