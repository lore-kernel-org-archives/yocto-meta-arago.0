Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by arago-project.org (Postfix) with ESMTPS id BD41952AB3
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:28 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id o6so5040564oag.11
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=lFQvhTp+50ddTy7iq0rVVuX7GiPf3/sqqH40bTr3Qmw=;
	b=Ez/kLF3y1F1l+ldQtzGmO73NNZMaYBO4OJR1PW09xzpu4xz3wXlzuiP7YhZcbVBDOb
	tQ34U+zv4JAwhIK+rFe6DICJdNa2Voikz2LZEjKvZ2KF/5S17ZFZ4CN+E0tPKJDGC76N
	MsWLNJLGZWbVPnRMqPRzT6P5+wyPANxj5T/kysYgFWjirW2POX66iysqRNRVDLVcrjXK
	TG9Hqdj0wiBk8snflZpN0DyOb0Yf//cQvlyVZi9JafPO46MQSpxss1n+uAYjLY8g/MZT
	cQIlDUCjCGgrXtqP4f/AsRLNIN+/n7aB5Rv2XEl/dsaV7envQ7uew4cqQQ9t5mlvbmWb
	pB2w==
X-Received: by 10.60.169.205 with SMTP id ag13mr10527132oec.40.1358632348187; 
	Sat, 19 Jan 2013 13:52:28 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.26
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:27 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:40 -0600
Message-Id: <1358632316-12266-15-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 15/31] bluez-hcidump: Pull in bluez-hcidump from Arago
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:28 -0000

* Pull in bluez-hcidump version 2.4 which was used in the previous Sitara SDK.
* The software and scripts included in this SDK for the WL1271 daughter card
  depends on older versions of various wlan and bluetooth libraries and
  applications.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../bluez/bluez-hcidump_2.2.bb                     |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb

diff --git a/meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb b/meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb
new file mode 100644
index 0000000..57a1a02
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Linux Bluetooth Stack HCI Debugger Tool."
+SECTION = "console"
+PRIORITY = "optional"
+DEPENDS = "bluez4"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
+                    file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
+PR = "r0"
+
+SRC_URI = "http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
+S = "${WORKDIR}/bluez-hcidump-${PV}"
+
+EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
+
+inherit autotools
+
+SRC_URI[md5sum] = "3c298a8be67099fe227f3e4d9de539d5"
+SRC_URI[sha256sum] = "073066d3ec1f7d1c52bb0fe27cde84ea273e1ab3097b27fa1fd45a5992e1a441"
+
-- 
1.7.0.4


