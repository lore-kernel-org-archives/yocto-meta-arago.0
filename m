Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by arago-project.org (Postfix) with ESMTPS id 3E2D852AB2
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:25 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id l10so5042995oag.36
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=v0d7FnwRwg8XwuiDgM0Whx2hpffRj4mGfiN0CiH/rKU=;
	b=QwFhHeLrhDusPuMEhbTkz4iRbNFTGHH8/H25IyAy+pgr3S3erdrDGpwnW0X0zywDp2
	wX0oI43bVSjuBcZk0C5KgFOW9MhHVEoZzTQONANd2wzr6KhkTcW50PwnJiitDwIAt13y
	ndw03GB3/Oz3+DD0JOYWjGbPudgMNS/M6BIPwdEDOqgYX64RcKRMH5pGQHykTALcD63Y
	RNLauaBMvcNi7hKXnKdK+c7Oct0plXyMJX0XAsCf9huf4D+M5qCGUsSaUFVZoIpUFToI
	/j/8Zy0BgPjT2n3iZpB7Q3aEWZD6An32ixWJAZpAlb3DoVrx9pgtwEbRJbzspVcmvR/8
	fvJA==
X-Received: by 10.60.27.69 with SMTP id r5mr4319772oeg.102.1358632344695;
	Sat, 19 Jan 2013 13:52:24 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.22
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:23 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:38 -0600
Message-Id: <1358632316-12266-13-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 13/31] bluez4: Add Arago SDK specific patches
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:25 -0000

* Add Arago SDK specific patches.
* Install agent application.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../bluez/bluez4_4.98.bbappend                     |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4_4.98.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.98.bbappend b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.98.bbappend
new file mode 100644
index 0000000..e829d3e
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.98.bbappend
@@ -0,0 +1,22 @@
+PR_append = "-arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
+            file://0001-socket-enable-for-bluez-4_98.patch \
+            file://0001-bluez-enable-source-interface.patch \
+"
+# udev 150-170 provide its on hid2hci tool and udev rules for it. Therefore,
+# disabling hid2hci from bluez4.
+EXTRA_OECONF := "${@oe_filter_out('--enable-hid2hci', '${EXTRA_OECONF}', d)}"
+
+DEPENDS += "libsndfile1"
+
+# Add test/agent for testing
+PACKAGES =+ "bluez4-agent"
+
+do_install_append () {
+    ${TARGET_SYS}-libtool --mode=install install -c 'test/agent' ${D}${bindir}/agent
+}
+
+FILES_bluez4-agent = "${bindir}/agent"
-- 
1.7.0.4


