Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by arago-project.org (Postfix) with ESMTPS id EE03D529AA
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:30 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h16so9831081oag.5
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=6ffH/5FfadnI8M6D54iQjU43UWtwA/tqVYrnYHIefmw=;
	b=pjuOa27yY5UfLzgYS2bDTaDjYRPd9Y4RjCrIu885mVA8Bry8CEZFWJBo6BRO9eiQwq
	YqsgYTfslJfkDCISc0iVTgbbI4Xs6VVPbkxTUVvS7yVl0CXdI3sAmcHWXxUff/sHGL2s
	br5M4GIiNF1XNXxkNVm4aYbGOFy4EH5oH7vT+la0Lf2PMT2kxwe3q4PocyN2aK0o+ci9
	Z5Z75JZ20rgV3fLee/LM7qJ9krtEQIAOghqzYHMCBFP6fnnPMwSCq64vf32V1yFZIn94
	Pzq3hRRa4h3cs7fwd5Z8s9R2CxW4PkdLTzinXLgrA8QuVzV6RstHThYxOO3m1B4u7Y2m
	WtTQ==
X-Received: by 10.60.24.201 with SMTP id w9mr1601966oef.73.1359037290143;
	Thu, 24 Jan 2013 06:21:30 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.27
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:28 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:06 -0600
Message-Id: <1359037281-12610-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 32/47] task-arago-gst: Remove gst-plugins-ugly
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:31 -0000

* Remove gst-plugins-ugly due to commercial license restrictions

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-gst-sdk-target.bb             |    3 +--
 .../recipes-core/tasks/task-arago-gst.bb           |    6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
index 06b7184..3a737b1 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r1"
+PR = "r2"
 
 inherit task
 
@@ -10,5 +10,4 @@ RDEPENDS_${PN} = "\
     gst-plugins-base-dev \
     gst-plugins-good-dev \
     gst-plugins-bad-dev \
-    gst-plugins-ugly-dev \
 "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
index b1b8f0b..4ff5494 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r1"
+PR = "r2"
 
 inherit task
 
@@ -10,12 +10,10 @@ GSTREAMER = " \
     gst-plugins-base \
     gst-plugins-good \
     gst-plugins-bad \
-    gst-plugins-ugly \
     gst-plugins-base-meta \
     gst-plugins-good-meta \
     gst-plugins-bad-meta \
-    gst-plugins-ugly-meta \
-    "
+"
 
 RDEPENDS_${PN} = "\
     ${GSTREAMER} \
-- 
1.7.0.4


