Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 951C7529A4
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2012 01:44:54 +0000 (UTC)
Received: by oagn12 with SMTP id n12so2475363oag.38
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 18:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=nbsZtkhCXx9GgKjNQdr0rE35QOugWbYpL+L+TVKBIcQ=;
	b=Hj7xF06DR1QEeftGxAO0ElPY0ktTT+XgO7BzBX24FOYm99TF3aScI+QIv6oSfs2TRa
	sxD0C5KMu8yqjwFO5hZesx4BDZvqYhKHFrYDB5PUOBUB3qkoKrBIvY1RH9IuCs+3IB7L
	87HnCz5XIEWgb2QzYIffVadkKxdHD8jypbdq27XRtrryClLzG8dJ2zEBoPPT1wZkr+uB
	nyTEtys+kVA63V+Obpb3u0YPxEm1mug/J+V7AGfYa2ym9Ad/kM3l4mnf5vRLyQ/DlsyR
	kw/8lYqklHpdiGt5ekAp4GTEUyPSRD2jQTX7EqXmFtOLDpEbkSOlObBtsg8ca8618iEb
	hyNg==
Received: by 10.60.31.102 with SMTP id z6mr4637457oeh.42.1348796693758;
	Thu, 27 Sep 2012 18:44:53 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id rg10sm7186292obc.14.2012.09.27.18.44.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 18:44:53 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Sep 2012 21:10:34 -0500
Message-Id: <1348798234-24018-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] ti-wifi-utils: Port ti-wifi-utils from arago
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
X-List-Received-Date: Fri, 28 Sep 2012 01:44:55 -0000

* Port ti-wifi-utils recipe from arago

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils_git.bb             |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100755 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
new file mode 100755
index 0000000..77af0b9
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
+
+DEPENDS = "libnl"
+
+PR ="r0+gitr${SRCPV}"
+PV ="0.0"
+
+SRCREV = "ol_R5.00.18"
+SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+export CROSS_COMPILE = "${TARGET_PREFIX}"
+CFLAGS += " -DCONFIG_LIBNL20"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -d ${D}${datadir}/ti/wifi-utils/ini_files/127x
+	install -d ${D}${datadir}/ti/wifi-utils/ini_files/128x
+
+	install -m 0755 calibrator ${D}${bindir}/
+	install -m 0755 ${S}/hw/ini_files/127x/* ${D}${datadir}/ti/wifi-utils/ini_files/127x
+	install -m 0755 ${S}/hw/ini_files/128x/* ${D}${datadir}/ti/wifi-utils/ini_files/128x
+}
+
+FILES_${PN} += " \
+	${datadir}/ti/wifi-utils/ini_files/127x \
+	${datadir}/ti/wifi-utils/ini_files/128x \
+"
-- 
1.7.0.4


