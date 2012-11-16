Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 71BCF52A6F
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2012 04:31:39 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2251875oag.38
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 20:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6ffH/5FfadnI8M6D54iQjU43UWtwA/tqVYrnYHIefmw=;
	b=B5ILkUZOznXeUmesbwp3Y1Ni89Fi3XyOggX3x/HZM8zr/0ypa5LqWL2sICF2KaCp+W
	oluTcXhAV7qA3HAEwA9J/li6QreRan3fVd6zDlQV+w5A+2azYpzCnXpLgu1VyJEEaW8u
	8qfV4ZYo7Su2hX1W2Er/2ZxyQ33dP6U89CwTjh8LkJU3jwjMDhKGNqfjXJG9CGp4Q5V4
	nvgAf6pylmLyeF3l+5/8f+yCCUGFfXSbrbsISiLYuAlx1DJsJT4yIdk8MhvppGefWeus
	/w3pAVEI4kxCyEm1TzsS/xcU7SDtDgfPBNwWBF4aOGzfVeUvlvYObLjtxzVadQNCfhxN
	BInQ==
Received: by 10.182.31.50 with SMTP id x18mr2810570obh.56.1353040298622;
	Thu, 15 Nov 2012 20:31:38 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm481759oeb.3.2012.11.15.20.31.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 20:31:37 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Nov 2012 22:31:26 -0600
Message-Id: <1353040290-26030-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/5] task-arago-gst: Remove gst-plugins-ugly
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
X-List-Received-Date: Fri, 16 Nov 2012 04:31:39 -0000

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


