Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CBBC952A8E
	for <meta-arago@arago-project.org>;
	Mon, 15 Feb 2016 17:19:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1FHJZ4L001212
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 11:19:35 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FHJZTL003738
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 11:19:35 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 15 Feb 2016 11:19:35 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FHJZOj011249;
	Mon, 15 Feb 2016 11:19:35 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aVMoB-0000PI-3A; Mon, 15 Feb 2016 12:19:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Feb 2016 12:19:30 -0500
Message-ID: <1455556771-1512-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455556771-1512-1-git-send-email-j-stiffler@ti.com>
References: <1455556771-1512-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] tisdk-server-extra-rootfs-image: Create new server rootfs image
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
X-List-Received-Date: Mon, 15 Feb 2016 17:19:38 -0000
Content-Type: text/plain

* This image is provided in only the tar.gz format for mounting
  over NFS
* This removes the size limitation imposed by the ubifs image format

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/images/tisdk-server-extra-rootfs-image.bb     | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
new file mode 100644
index 0000000..6013160
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
@@ -0,0 +1,10 @@
+require recipes-core/images/tisdk-server-rootfs-image.bb
+
+IMAGE_INSTALL += "\
+    packagegroup-arago-test-addons \
+    packagegroup-arago-tisdk-addons-extra \
+"
+
+export IMAGE_BASENAME = "tisdk-server-extra-rootfs-image"
+
+IMAGE_FSTYPES = "tar.gz"
-- 
1.9.1


