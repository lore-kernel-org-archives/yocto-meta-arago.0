Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 187615208C
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:43:46 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6214751oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/5mYRt0OMqVWjp9pwctCVhQDAut3S60PoukoH7kT3HA=;
	b=OE2cqq31J4/MT/t3LNt53sZSKedxUocklaiKMpYQx4/w1q9FxFRIC5fvZInBjppoJI
	xRFVn/s/pQJ7d86ET9T38hSsI9rObZE9Z7E/Xg/Dg4Vqi9319XtvqOlOtDiWCRhf/Rb6
	aFldvA00yECxPP2Hv5hLwr61vdwDj8ks0flykdtuQ/irfyj7PDVez71mRX1xQ25S65lT
	nfHfOArYxMnNlxrZKpzO4IXnTQN/c8L/Hlm6i8cFo2E1kIvl/7mmCWy6tKF+eFsWtxbz
	BPs0Hniye+EEme1YXgC6ZfyYXpDl5soJT/fV2JmepaYHfAhBtOhi5uK9TM6Ji/sfgeNo
	7KdA==
Received: by 10.60.14.198 with SMTP id r6mr15371518oec.115.1352760225771;
	Mon, 12 Nov 2012 14:43:45 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id fo6sm8271047obc.20.2012.11.12.14.43.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:43:45 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:43:39 -0600
Message-Id: <1352760219-6604-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352760219-6604-1-git-send-email-fcooper@ti.com>
References: <1352760219-6604-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/2] task-arago-tisdk-amsdk: Add screenshoot
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
X-List-Received-Date: Mon, 12 Nov 2012 22:43:46 -0000

* Add screenshot to the list of applications installed in the SDK

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-tisdk-amsdk.bb   |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
index 1351030..d0a07a0 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -16,6 +16,11 @@ OOBE_ti33x += "\
     parse-ip \
 "
 
+EXTRA_APPLICATIONS = "\
+    screenshot \
+"
+
 RDEPENDS_${PN} = "\
     ${OOBE} \
+    ${EXTRA_APPLICATIONS} \
 "
-- 
1.7.0.4


