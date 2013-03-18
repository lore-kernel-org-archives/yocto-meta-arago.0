Return-Path: <eyalreizer@gmail.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by arago-project.org (Postfix) with ESMTPS id 9592D52A6D
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 13:36:33 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id j8so1678243qah.13
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ffKBqUTMJZaFatuYhzxR9qkfBBwBwnGe4XqzTxPFivs=;
	b=va2D/NVJVNERKWWtCziq+xbZ+AgRr5dr+ftEifZ0I2wa8GcSYB4MdyQAfPgdN9heb4
	fQHpqvEABQaZbf4+gHy7iCDwBp8pIvFytOgsKIFjC4su1So7M6/FAvSFi7CkwW5+HUMg
	ir1fBQbdRTitCEfIw7FzQiLbVdG1fhjquYEWm3wwJj5+tFolgCJz8jmRNblsSwWNy+Jy
	Y3wC1bQjTMTarBTsXCz9srGgs3ii5hd0TNG8SffBQJ3I+0IVqmFLZYM9lfqHsrQOnmqJ
	Ca9SpXZFmz+1HM9VHZaCzbsRBgp8SGqB8SA2dwsqIfQ6Ssfq3cLJLUNZ/XyUzIgsGnUG
	qIRA==
X-Received: by 10.224.186.81 with SMTP id cr17mr19524094qab.99.1363613793354; 
	Mon, 18 Mar 2013 06:36:33 -0700 (PDT)
Received: from user-VirtualBox.emea.dhcp.ti.com (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ku2sm32421520qeb.4.2013.03.18.06.36.31
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 06:36:32 -0700 (PDT)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 15:35:57 +0200
Message-Id: <1363613762-6537-5-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363613762-6537-1-git-send-email-eyalr@ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
Subject: [PATCH 5/9] ti-wifi-utils-wl18xx: build the calibrator tool for wilin8
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
X-List-Received-Date: Mon, 18 Mar 2013 13:36:33 -0000

From: Eyal Reizer <eyalr@ti.com>

Add a recipe for building and installing the calibrator tool
used with the wilink8 family of chips.

This package replace the wilink6 package which is provided by the
ti-wifi-utils. Selection between the two is done using a 
"WILINK_VERSION" switch added to arago.conf

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils-wl18xx_git.bb      |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_git.bb

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_git.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_git.bb
new file mode 100644
index 0000000..3d2d6f1
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
+
+DEPENDS = "libnl"
+RDEPENDS = "ti-compat-wireless-wl12xx wl12xx-firmware"
+
+PR ="r1+gitr${SRCREV}"
+PV ="0.0"
+
+SRCREV = "ol_r8.a6.01"
+SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git \
+"
+
+PROVIDES += "ti-wifi-utils"
+RPROVIDES += "ti-wifi-utils"
+
+S = "${WORKDIR}/git"
+
+export CROSS_COMPILE = "${TARGET_PREFIX}"
+CFLAGS += " -DCONFIG_LIBNL20"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 calibrator ${D}${bindir}/
+}
-- 
1.7.9.5


