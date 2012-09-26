Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 6473D52A7A
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 19:27:51 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so1024991obb.38
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 12:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=O+PK+gE9uv9KDepLf/vYtC2bJBp/CY0deEWxWi1xL20=;
	b=H9nUAu+pVisVek2xr4Bv8pwWFGXJwPSA/qJv8G0ctV8B9H7VecAOQqQc5gE9UDjT/k
	OfY87yqvGj1Wgpel9kCAZYTK+YM4STktnGnrG/9mVLa231AeNQF0Ued9nrBdm8LN/cXe
	slQOAq4tA8ywnlqNtcOyhw66udM1vn2LFcSyy7UQ3GNYJX4jK5APUMgyl+asxKlOl7OA
	/SavVGiqMkJLHjCjeJisRBRdTiksRJdnVx0PpGFRCwzYT1ExsNMQ5ZQZ0+RutJh1SVP7
	U5bAx1ybyOVzNh11hldK5tXhfmizXXW/EMD10Yp0951+jyQPMxSu98hr+YwKA+ERJPrk
	SgxA==
Received: by 10.182.8.6 with SMTP id n6mr1276669oba.39.1348687670676;
	Wed, 26 Sep 2012 12:27:50 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id kc5sm3707997obb.21.2012.09.26.12.27.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 12:27:49 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 26 Sep 2012 14:53:00 -0500
Message-Id: <1348689180-28996-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-distro][PATCH v2] recipes: TSU exemption notice
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
X-List-Received-Date: Wed, 26 Sep 2012 19:27:52 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* Add TSU exemption notice to applications/libraries that require it.
* Currently investigating the current version of the different software
  to determine if a new TSU exemption is required.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 2 of this patch addresses the following issues:
Removed reference to wpa-supplicant.

 .../openssh/openssh_5.9p1.bbappend                 |   10 ++++++++++
 .../openssl/openssl_1.0.0i.bbappend                |   12 +++++++++++-
 .../dropbear/dropbear_2012.55.bbappend             |   10 ++++++++++
 3 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/openssh/openssh_5.9p1.bbappend
 create mode 100644 meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/openssh/openssh_5.9p1.bbappend b/meta-arago-distro/recipes-connectivity/openssh/openssh_5.9p1.bbappend
new file mode 100644
index 0000000..c0f449e
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/openssh/openssh_5.9p1.bbappend
@@ -0,0 +1,10 @@
+################################################################################
+######################### TSU EXEMPTION REQUIRED ###############################
+################################################################################
+# This package requires TSU exemption. Any update to the version of openssh being
+# appended must be double checked to see if a new TSU exemption must be made.
+#
+# Versions of openssh that are TSU Exempted:
+# openssh-5.6p1
+
+PR_append = "-arago0"
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
index ec5e2f0..3536316 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
@@ -1,6 +1,16 @@
+################################################################################
+######################### TSU EXEMPTION REQUIRED ###############################
+################################################################################
+# Versions of openssl that are TSU Exempted:
+# openssl-1.0.0a
+# openssl-1.0.0d
+#
+# This package requires TSU exemption. Any update to the version of openssl being
+# appended must be double checked to see if a new TSU exemption must be made.
+
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI += " \
             file://find.pl \
diff --git a/meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend
new file mode 100644
index 0000000..f766014
--- /dev/null
+++ b/meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend
@@ -0,0 +1,10 @@
+################################################################################
+######################### TSU EXEMPTION REQUIRED ###############################
+################################################################################
+# Versions of dropbear that are TSU Exempted:
+# dropbear-0.51
+#
+# This package requires TSU exemption. Any update to the version of dropbear being
+# appended must be double checked to see if a new TSU exemption must be made.
+
+PR_append = "-arago0"
-- 
1.7.0.4


