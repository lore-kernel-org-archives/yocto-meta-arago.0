Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 754A85296D
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:34:12 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6205625oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ajKYlqi0tbWf0IQBZptAdz1MMNw46tduAIIsydW2a7g=;
	b=IcpraQLpIAq/qC4MZ0T0DYIGX/NX4o8ijGIRhemL9QEEU0wHSlJYo4jLHNt7Fjjkec
	kbl/Pzh+T8WDMtSb0LG1fpggGrOlv9vtdPJSa9CtBDlE3uMmzReDeHCDGW1OVEXSyYbM
	MPACFxuhtx2A15iQkJKXMEJHoEvolSH05W0iiSMGVLyMIn2oMaRurNzNR77+ijw+1OF7
	dTxkFcPpcTPUFBusgzzmhpjfQwjE6suOvHyBmWf2ArawmiG0hLYzCTukFnNhQKUB7yhf
	d9eD9hoRgi06C81eTz7ck/jG8HwNGC9rga2P/d1Ruw/lZVWoLdRDzQ59wKtIqzdjIa+L
	orXQ==
Received: by 10.182.45.42 with SMTP id j10mr12937760obm.60.1352759652061;
	Mon, 12 Nov 2012 14:34:12 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b5sm8251328obd.18.2012.11.12.14.34.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:34:11 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:34:08 -0600
Message-Id: <1352759648-5276-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] matrix-gui-apps: Add audio capture demo
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
X-List-Received-Date: Mon, 12 Nov 2012 22:34:12 -0000

* Update to the latest Matrix v2 apps commit.
* This updated commit brings in a new audio capture demo.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index ddbc7a7..63e73f2 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "6a0c9776adfef03463535de6c7059d8525a336aa"
+SRCREV = "df5b70b2f7cd97148855fe4d0508789c710bcc4e"
 BRANCH = "master"
-INC_PR = "r5"
+INC_PR = "r6"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.7.0.4


