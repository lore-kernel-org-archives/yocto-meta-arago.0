Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 4A9A252A9A
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:31 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=w6vWipcdWpeqi0bFJS/zSHoa0YBbMlkAOB9cc+/maV0=;
	b=XQ2/XoZ9bdPQasITpEoxIuhAC2QTze337nztardBfVUgsbWWp4oK/kYR1WEv7FrWLK
	rvUNODq+93854XX07yn+qes+qipOgKspoNgvjVMTwtHBs2Nu8wSaV5VND2m25+PC3SPE
	uOGOpwwN98nkjzgV6hPpYB6WqJmjxyah8bxzawycFZsxjimre8NwecboMz7H8q5jm/5l
	OhbOYNUYB/aYLwjSqjQdFBvYTcIoT9w5KdCJy4CwGB/KSEVH5ctN1qDQLfubRUMyG1mp
	O2W8aAAMGxrzlPCsCTEnORJdni1VuJEowhfDGEBA28xXoH6OWaF/i0xp0eN845Q5W1Q5
	Yemg==
Received: by 10.60.21.193 with SMTP id x1mr6568309oee.142.1352080471025;
	Sun, 04 Nov 2012 17:54:31 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:30 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:33 -0600
Message-Id: <1352080417-9792-36-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 38/42] busybox: Fix NFS issues
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:31 -0000

* Certain nfs servers were having issues connecting to the board.
* The oe-core patch master "busybox: udhcpc shouldn't be a service" commit id:
  8329c4679ec0ce319d2a81d755a0da5b05474688 seems to have resolved this issue.
* Mimic the changes of that patch here.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
index b8f21dd..b7cd903 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,9 +1,25 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
+PR_append = "-arago2"
+
 SRC_URI += " \
 	file://inetd \
 	file://inetd.conf \
 "
 
-PR_append = "-arago1"
+# Remove ${PN}-udhcpc from the list of init scripts since this was causing issues
+# when using NFS for some machines. This mimics changes from the patch
+# "busybox: udhcpc shouldn't be a service" commit "8329c4679ec0ce319d2a81d755a0da5b05474688"
+# Once the patch mentioned above is pulled into the maintance branch the changes below can be
+# removed.
+
+FILES_${PN}-udhcpc := "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
+
+INITSCRIPT_PACKAGES := "${@oe_filter_out('${PN}-udhcpc','${INITSCRIPT_PACKAGES}', d)}"
+
+do_install_append () {
+	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
+		rm ${D}${sysconfdir}/init.d/busybox-udhcpc
+	fi
+}
-- 
1.7.0.4


