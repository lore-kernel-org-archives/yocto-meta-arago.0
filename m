Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id C41F052980
	for <meta-arago@arago-project.org>;
	Tue,  2 Oct 2012 00:34:16 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so5852584obb.38
	for <meta-arago@arago-project.org>;
	Mon, 01 Oct 2012 17:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=eCBvbttu1EeKqEZhsWOUIZ6cA5gRCYm1mTtENfoU8Eo=;
	b=NL+TpszVeQ6YpsVuulDHVyBlaaChVANVGGvYjtVfo6nnmLS7ZlwaYmiILn6kBEG4Rb
	vg5PD7NEh5X2ENBZ/BeMeCduY7Q1VmG49zJ1xHVf3nrl2EMk0jR1caBkuGyq0EjtirNg
	3bFpEBufOu0Zhx87BFwFUTnRbWDgsRHnlScfcqWsm8+6+wAVDtlxW4E7RP/DdEB45ujI
	+Afv1EVG5H/+ULe3HGcch6NctiuU9Y95nWTkch3KqpWpmb1Qli5LwL/L79q2vmdD/Nme
	Du+XzwhAQfQS/rTVy3+nMv32iX1bDrF80BpYgVIv1CgLLP0RWHEZUvqazzhSOEaZxM87
	esoA==
Received: by 10.60.19.67 with SMTP id c3mr13328229oee.106.1349138056160;
	Mon, 01 Oct 2012 17:34:16 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm17683511obb.23.2012.10.01.17.34.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 17:34:15 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon,  1 Oct 2012 20:01:23 -0500
Message-Id: <1349139683-7110-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] wpa-supplicant: Add TSU exemption
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
X-List-Received-Date: Tue, 02 Oct 2012 00:34:17 -0000

* Add TSU exemption notice for wpa-supplicant

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wpa-supplicant/wpa-supplicant_git.bbappend     |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100755 meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bbappend b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bbappend
new file mode 100755
index 0000000..6fe2023
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bbappend
@@ -0,0 +1,11 @@
+################################################################################
+######################### TSU EXEMPTION REQUIRED ###############################
+################################################################################
+# Versions of wpa_supplicant that are TSU Exempted:
+# wpa_supplicant-0.7.3
+
+# This package requires TSU exemption. Any update to the version of
+# wpa_supplicant must be double checked to see if a new TSU exemption must be made.
+################################################################################
+
+PR_append = "-arago0"
-- 
1.7.0.4


