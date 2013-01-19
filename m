Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by arago-project.org (Postfix) with ESMTPS id B1E2552A92
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:56 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id k1so4971681oag.30
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=dY1AYkJrsl3v0fqnB67DPXeMcxLn/mVpLmw5dmAnqFI=;
	b=WvYLUOMjR+46moGE6NDVvTTQ0xuGXGYSohAhzPXzY8PDiNxm6fmJNG3p85ym67HLZY
	FOHPHKnGgX4O9xyaZ67ib+Ose+LOOA0vLTmdQyB+2UHdKIkthINVaEa/e6PM0lX4JS7z
	XDPYeOi9JlVX9K8RVyAn/M7IFHOV5YGVxsixuqKPBY9gslWDBIwlgbcsh7dBZZYYbRpV
	dAPa/B5XdpNGRPIexR5Gro1i8LMORaH+Cd88XibXcQP0/H8uLAqNAXn+C4lx0+XMTyDw
	YQnCjOry8uk9RS3bIkrVxyL6fpBo8YXlVCfsKx+pOMcN0JDfKRhfxZAG8ZxKbRFA5AAI
	2l7Q==
X-Received: by 10.60.29.70 with SMTP id i6mr10819821oeh.38.1358632376192;
	Sat, 19 Jan 2013 13:52:56 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.54
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:55 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:56 -0600
Message-Id: <1358632316-12266-31-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 31/31] task-arago-tisdk-amsdk: Add mount-sdcard init script
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:56 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-tisdk-amsdk.bb   |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
index d0a07a0..aaf02f6 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r1"
+PR = "r2"
 
 inherit task
 
@@ -21,6 +21,7 @@ EXTRA_APPLICATIONS = "\
 "
 
 RDEPENDS_${PN} = "\
+    mount-sdcard \
     ${OOBE} \
     ${EXTRA_APPLICATIONS} \
 "
-- 
1.7.0.4


