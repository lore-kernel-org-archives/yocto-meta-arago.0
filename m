Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0F5B85297E
	for <meta-arago@arago-project.org>;
	Wed,  5 Dec 2018 14:34:18 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB5EY8Di072239
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2018 08:34:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544020448;
	bh=V3INcZm+AiZ7Mg5zaXfMH9nDNLaCatSBrm4IE4gaEhc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lbT3IMQvWJQRQ/WKfK2lKDp1Vd5kEARGbMIJADXpJS2DoKFIZGing0r8c2zba5+PH
	YlX//a3HegT7GW97UQl9iAwWM7cJU1CYtOJ44rXhPb6xYPc/aj3CojjSx0RMTEvB16
	LmdyKg3cppIkbDVDawKD99+J6hKvbhg9YNd8mOsI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB5EY7mc130515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2018 08:34:08 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 5 Dec 2018 08:34:07 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 5 Dec 2018 08:34:07 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB5EY77k023930;
	Wed, 5 Dec 2018 08:34:07 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Dec 2018 09:21:43 -0500
Message-ID: <1544019704-20384-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544019704-20384-1-git-send-email-j-stiffler@ti.com>
References: <1544019704-20384-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 2/3] arago-tiny-image: minimal sysvinit-based filesystem
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
X-List-Received-Date: Wed, 05 Dec 2018 14:34:20 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/images/arago-tiny-image.bb        | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
new file mode 100644
index 0000000..56e9429
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
@@ -0,0 +1,43 @@
+
+# Common pieces for Arago images
+
+LICENSE = "MIT"
+
+COMPATIBLE_MACHINE = "ti-soc"
+
+IMAGE_FEATURES += "package-management splash"
+
+# 4KB per 1 inode should be enough
+EXTRA_IMAGECMD_ext2.gz += "-i 4096"
+
+# Install a small set of utils which can be used for diagnostics
+ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= "parted util-linux e2fsprogs dosfstools devmem2"
+
+IMAGE_INSTALL += " \
+	packagegroup-arago-sysvinit-boot \
+	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
+"
+
+export IMAGE_BASENAME = "arago-tiny-image"
+
+IMAGE_LINGUAS = ""
+
+make_bootfiles_symlinks_relative() {
+    for f in "${IMAGE_ROOTFS}/boot"/*
+    do
+        [ -L "$f" ] || continue
+
+        l=$(readlink "$f")
+        if [ "${l:0:6}" == "/boot/" ]
+        then
+            ln -sf "${l##/boot/}" "$f"
+        elif ["${l:0:1}" == "/" ]
+        then
+            ln -sf "..$l" "$f"
+        fi
+    done
+}
+
+ROOTFS_POSTPROCESS_COMMAND += "make_bootfiles_symlinks_relative;"
+
+inherit core-image
-- 
2.7.4


