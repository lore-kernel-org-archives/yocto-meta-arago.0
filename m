Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gg0-f169.google.com (mail-gg0-f169.google.com
	[209.85.161.169])
	by arago-project.org (Postfix) with ESMTPS id 2C67D52A1D
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:44 +0000 (UTC)
Received: by mail-gg0-f169.google.com with SMTP id j5so820860ggn.0
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=pGtM9a2dAYa8y11FKnqaqWA5f9YxRLbENvarXFg/MFk=;
	b=BHRQb7RlJhKUgVO+HThWz6bgSAMunLKdX/EV5ab8q3nu+Ofdn8pNMjYx7Zg5JdLIbd
	9SnV+2rNpqVy2KGHy+2kLIkLZfHHYPm3qyQmR9I2otqW0fyH2SmiEtFHSMxYsOuOn1en
	V1T1/PLzP0E6ADNneMm+4b2YUaeT+81AO0S9Zru8D1edgpx5u528jhSa19C6R7IbO7dz
	R2kgeVwsi2FZT0tzoSPI2MY6c5i1bXK/zeTmYoN9cgBU4boBNHb27sNWoX7bwfNYAZ/y
	uKpNFjcrXpoXYaFghfNrRXkaDQh8s9MT5UfnTK0oNJlVJDUvi5RFEHSng4AYQPZldBE7
	57ZA==
X-Received: by 10.236.136.5 with SMTP id v5mr16688546yhi.49.1361141623565;
	Sun, 17 Feb 2013 14:53:43 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.41
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:42 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:06 -0600
Message-Id: <1361141595-1687-11-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 11/20] matrix-gui-3d-demos: Split out Graphics demos
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:44 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Create separate packages to allow each demo to be pulled in individually.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb |   40 ++++++++++++++++++-
 1 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index d40e0d6..e1c3023 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 S = "${WORKDIR}/git/3d_apps"
 
@@ -15,6 +15,40 @@ S = "${WORKDIR}/git/3d_apps"
 #       to the matrix-gui-submenus-3d dependency.  So if matrix v2 moves
 #       into the same layer as libgles this may be acceptable, or perhaps
 #       we can use an RRECOMMENDS instead.
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-3d libgles-omap3-rawdemos"
 
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+PACKAGES = "matrix-3d-demo-chameleon \
+            matrix-3d-demo-coverflow \
+            matrix-3d-demo-film      \
+            matrix-3d-demo-lantern   \
+            matrix-3d-demo-skull     \
+            matrix-3d-demo-shaders   \
+            matrix-3d-demo-vase      \
+"
+
+3D_DEMOS_RDEPENDS = "matrix-gui-apps-images matrix-gui-submenus-3d libgles-omap3-rawdemos"
+
+RDEPENDS_matrix-3d-demo-chameleon = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-coverflow = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-film      = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-lantern   = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-skull     = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-shaders   = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-vase      = "${3D_DEMOS_RDEPENDS}"
+
+# Split the matrix files by 3d demos
+FILES_matrix-3d-demo-chameleon = "${MATRIX_APP_DIR}/3d_chameleon/*"
+FILES_matrix-3d-demo-coverflow = "${MATRIX_APP_DIR}/3d_coverflow/*"
+FILES_matrix-3d-demo-film      = "${MATRIX_APP_DIR}/3d_film/*"
+FILES_matrix-3d-demo-lantern   = "${MATRIX_APP_DIR}/3d_lantern/*"
+FILES_matrix-3d-demo-skull     = "${MATRIX_APP_DIR}/3d_skull/*"
+FILES_matrix-3d-demo-shaders   = "${MATRIX_APP_DIR}/3d_shaders/*"
+FILES_matrix-3d-demo-vase      = "${MATRIX_APP_DIR}/3d_vase/*"
+
+# Split the ${bindir} files by 3d demos
+FILES_matrix-3d-demo-chameleon += "${bindir}/runOGLES2ChameleonMan.sh"
+FILES_matrix-3d-demo-coverflow += "${bindir}/runOGLES2Coverflow.sh"
+FILES_matrix-3d-demo-film      += "${bindir}/runOGLESFilmTV.sh"
+FILES_matrix-3d-demo-lantern   += "${bindir}/runOGLES2MagicLantern.sh"
+FILES_matrix-3d-demo-skull     += "${bindir}/runOGLESEvilSkull.sh"
+FILES_matrix-3d-demo-shaders   += "${bindir}/runOGLES2Shaders.sh"
+FILES_matrix-3d-demo-vase      += "${bindir}/runOGLESVase.sh"
-- 
1.7.0.4


