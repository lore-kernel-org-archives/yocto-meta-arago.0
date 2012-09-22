Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id CAE23529A1
	for <meta-arago@arago-project.org>;
	Sat, 22 Sep 2012 00:24:43 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so3676472obb.38
	for <meta-arago@arago-project.org>;
	Fri, 21 Sep 2012 17:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=opZYiWAPeLyuHSpOpjlb9yj8rAfKvbS3yAZwYRfrF/U=;
	b=COOjgRHp5uKjAevFfhFVmmwTYAZqvwQ5TlwisodytFVpeXP0dKotEjzRjpcbsuxp/Y
	oWLaV5fK+CXYZLA0WurynteKhWzpxgJ7/zGAcwOQRCTphfVSpWwi8tTF1ztl7ZBa/NxF
	bhFFIRmL7pWWmy2ZQrf1qyl0cW6kOdHT0lRZLkx+vTaeDfhXewVFVaTI3xiTJVC49gel
	mEb+/civNSUgiLk+pP4aMYVqvQqE0RAQf1dX5bPWRZ6lKMsJgHihmZzpecmq4do5Ryko
	GHEozHptSFcBRLlg8AMu7PFidpZAMJC3mUka09O5WO/VXSGKhjfVOq2aZBeETjBwxah1
	vaAg==
Received: by 10.60.170.47 with SMTP id aj15mr5118621oec.29.1348273482904;
	Fri, 21 Sep 2012 17:24:42 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d4sm9336124obx.3.2012.09.21.17.24.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 17:24:42 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 21 Sep 2012 19:48:06 -0500
Message-Id: <1348274886-27669-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-extras][PATCH] ussp-push: Add ussp-push
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
X-List-Received-Date: Sat, 22 Sep 2012 00:24:44 -0000

* Port ussp-push recipes from oe-classic.
* Adds ussp-push which is a OBEX object pusher for Linux that uses
  the BlueZ bluetooth stack.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ussp-push/ussp-push-0.11/hci_remote_name.patch |   13 ++++++++++++
 .../ussp-push/ussp-push_0.11.bb                    |   21 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb

diff --git a/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch
new file mode 100644
index 0000000..956e048
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch
@@ -0,0 +1,13 @@
+diff -urN ussp-push-0.11/src/obex_socket.c ussp-push-0.11_Demo/src/obex_socket.c
+--- ussp-push-0.11/src/obex_socket.c	2008-08-25 02:18:53.000000000 +0530
++++ ussp-push-0.11_Demo/src/obex_socket.c	2010-04-16 15:11:27.000000000 +0530
+@@ -197,7 +197,8 @@
+	for (i = 0; i < niinf; i++) {
+		char devname[128];
+
+-		if (hci_remote_name(dd, &piinf[i].bdaddr, sizeof(devname) - 1,
++		if (hci_read_remote_name(dd, &piinf[i].bdaddr,
++					sizeof(devname) - 1,
+				    devname, 100000) >= 0) {
+			if (strcasecmp(devname, btname) == 0) {
+				*btaddr = piinf[i].bdaddr;
diff --git a/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb
new file mode 100644
index 0000000..a2ca571
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "OBEX object pusher"
+HOMEPAGE = "http://www.xmailserver.org/ussp-push.html"
+SECTION = "console"
+PRIORITY = "optional"
+DEPENDS = "bluez4 openobex"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+
+PR = "r0"
+
+SRC_URI = "http://www.xmailserver.org/ussp-push-${PV}.tar.gz \
+	       file://hci_remote_name.patch"
+
+S = "${WORKDIR}/ussp-push-${PV}"
+
+EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
+
+inherit autotools
+
+SRC_URI[md5sum] = "5c44983ee27809867041feff6bb4423a"
+SRC_URI[sha256sum] = "bb2748eaed6164812555b4a1e186c4f2820c5ef9ce30f12d7aac28a452719bbd"
-- 
1.7.0.4


