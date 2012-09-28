Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 0A0FD529A4
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2012 01:46:23 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2448678obb.38
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 18:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FeLS88zHUhvag/gzIES+DK4o6okGjEgcplPPqp6Gdys=;
	b=A/aO2+dk7jtyCRW8NoCAyf3MSHK1WyT0AQ0HKFqblDLKPyl6OwkaqoI3FsWxtOQCyv
	gr1OWP4GLWinGBVK9GPqFHxqUFWAUP0rw6Dnx0ctkSkr5URfcWvBy4Nkg/5A+uCxbJlW
	ysdsnlsMWvAZtAp9y1m+Iu8VyTR3V3An2lf9LssVxyba4SF3ot5DDZE3q1iK/UCFfRfd
	XIZt6QX9/r79w1p78rLdMCRBCOYtzxjFX85FQrngTeRE5BWWvahlkbAOg4pSZlHRG4er
	7JF80HJWiYdBtPCfnQAdIH9oqA0mCz582oyX+DRj6wkG6XQdrdDe3qQ6BrA9uL7uUMU+
	rD7w==
Received: by 10.60.169.100 with SMTP id ad4mr4870759oec.21.1348796782780;
	Thu, 27 Sep 2012 18:46:22 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id bp7sm7190806obc.12.2012.09.27.18.46.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 18:46:22 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Sep 2012 21:12:03 -0500
Message-Id: <1348798323-24170-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] oppserver: Port oppserver recipe
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
X-List-Received-Date: Fri, 28 Sep 2012 01:46:23 -0000

* Port oppserver recipe from arago

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../oppserver/oppserver_1.0.bb                     |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/oppserver/oppserver_1.0.bb

diff --git a/meta-arago-extras/recipes-connectivity/oppserver/oppserver_1.0.bb b/meta-arago-extras/recipes-connectivity/oppserver/oppserver_1.0.bb
new file mode 100644
index 0000000..71f49ab
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/oppserver/oppserver_1.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "OPP Server"
+DEPENDS = "openobex bluez4"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://oppserver.c;beginline=1;endline=37;md5=c0ee352b095c583115f6600c1b4a3f60"
+
+PR = "r0"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/803/5450/oppserver.tar.gz"
+
+S = "${WORKDIR}"
+
+do_install() {
+	oe_runmake 'DEST_DIR=${D}' 'BIN_DIR=${bindir}' install
+}
+
+SRC_URI[md5sum] = "a73b39e9e17153aad488de0f9a25f926"
+SRC_URI[sha256sum] = "c6c4c6c54c1ca6a54b8212e51aa0a2748cebd0c67b1b3560802348fb83b8748e"
-- 
1.7.0.4


