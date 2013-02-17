Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gg0-f179.google.com (mail-gg0-f179.google.com
	[209.85.161.179])
	by arago-project.org (Postfix) with ESMTPS id CE14252A50
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:45 +0000 (UTC)
Received: by mail-gg0-f179.google.com with SMTP id h4so467345ggn.38
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=AjaB2M5U6PMjZ349eWSQjK7hp3IR8jrDtjNh1te6Mwk=;
	b=WkND5vE2q8wbtTbhpawzQWKJTArhchNZRf4CD+gxK9HFa5TvDsyOa2FHsVMi8aX9Oc
	zqedyGRDllIFAztW2sGs0Efkwb3GrLahUf+0I/RstqQdrZSMTD7DYJvVM3FQzr6SeUrH
	EotwNpG0ryIDAmTiSPnxBddH1MYjZF17KhyL9GXxUB+qF5OOwo3SbAJ85NgvjKAbyTsZ
	Q3AJcKfxUGttnkeowPOra6wi+Xtb/bD7vOAlD6fg7vVexx1bumt65VvWF51UNIUi3nx8
	125AVPrX69x8LZ71OWe3gYr+aoheGTEaGQPFXNFX2tvDrFtpXgA+wGqSpnSw1HFQNVXx
	oOiw==
X-Received: by 10.236.134.136 with SMTP id s8mr17150150yhi.13.1361141625402;
	Sun, 17 Feb 2013 14:53:45 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.43
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:44 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:07 -0600
Message-Id: <1361141595-1687-12-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 12/20] packagegroup-arago-tisdk-matrix: Select Graphics demos to use
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:46 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Now that the SDK is only using a select set of Graphics demos we need to pull
  in individually the demos we want to use.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index e94c72b..637ec5b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r10"
+PR = "r11"
 
 inherit packagegroup
 
@@ -36,13 +36,19 @@ MATRIX_QT_APPS_keystone = ""
 MATRIX_APPS = ""
 
 MATRIX_APPS_append_omap3 = "        \
-    matrix-gui-3d-demos             \
+    matrix-3d-demo-chameleon        \
+    matrix-3d-demo-film             \
+    matrix-3d-demo-lantern          \
+    matrix-3d-demo-skull            \
     matrix-gui-multimedia-demos     \
 "
 
 MATRIX_APPS_append_ti33x = "        \
     matrix-gui-ethernet-demos       \
-    matrix-gui-3d-demos             \
+    matrix-3d-demo-chameleon        \
+    matrix-3d-demo-film             \
+    matrix-3d-demo-lantern          \
+    matrix-3d-demo-skull            \
     matrix-gui-multimedia-demos     \
                                     \
     matrix-gui-clocks-275mhz        \
-- 
1.7.0.4


