Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id E745E529D6
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 20:19:16 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2006835obb.38
	for <meta-arago@arago-project.org>;
	Fri, 05 Oct 2012 13:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gCgNgEmjXStoEBcaV2A02q6ygQXetvu+ZFkVPUsEL5A=;
	b=WGFZt7phMMjfGBHld+eQFNDRuULZYI/TSVblWExexOuw3T0hY5NM2rjVq7dbdbKRr+
	EYlDt40JfVlfEd9OlDiSXw2oUfnMgZ8qgXtFhhgpXqvVD2UMX1mCIfTEVF7ZM/DU4Zda
	k5IDY/DXoqjWJOeAR/kZ6jAQEUD0H5DXZF6GEMhvHstHBzDRX6wqMDL+M4fghFfk6kaW
	hZnH5JI1iZ7G2225CWm3rLVHilpJ8nplqa1k8qAhAU4gZhW1g66EJdinoRTmOL2133Hh
	ixVSXlMilKzyE/j8aGfoWHAbcpa+J5E4fqpXzciGFF8mo1DpWiza1J9eUzZJJw2Wke64
	b7gQ==
Received: by 10.182.117.74 with SMTP id kc10mr7930298obb.63.1349468356171;
	Fri, 05 Oct 2012 13:19:16 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm9639721obm.21.2012.10.05.13.19.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 13:19:15 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 15:47:47 -0500
Message-Id: <1349470067-26340-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] bt-obex: Port recipe from arago
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
X-List-Received-Date: Fri, 05 Oct 2012 20:19:17 -0000

* Port recipe from Arago.
Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Use proper RDEPENDS syntax.

 .../recipes-connectivity/bt-obex/bt-obex.bb        |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb

diff --git a/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb b/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
new file mode 100644
index 0000000..5c561f9
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "BT Obex - Agentfor OBEXD (OPP/FTP profile)"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+RDEPENDS_${PN} += "bluez4"
+DEPENDS += "glib-2.0 dbus-glib"
+
+PR = "r0+gitr${SRCREV}"
+
+SRCREV = "171181b6ef6c94aefc828dc7fd8de136b9f97532"
+
+SRC_URI = "git://gitorious.org/bluez-tools/bluez-tools.git;protocol=git \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+do_install() {
+       install -d ${D}${bindir}
+       install -m 755 ${S}/src/bt-adapter ${D}${bindir}
+       install -m 755 ${S}/src/bt-agent   ${D}${bindir}
+       install -m 755 ${S}/src/bt-audio   ${D}${bindir}
+       install -m 755 ${S}/src/bt-device  ${D}${bindir}
+       install -m 755 ${S}/src/bt-input   ${D}${bindir}
+       install -m 755 ${S}/src/bt-monitor ${D}${bindir}
+       install -m 755 ${S}/src/bt-network ${D}${bindir}
+       install -m 755 ${S}/src/bt-obex    ${D}${bindir}
+       install -m 755 ${S}/src/bt-serial  ${D}${bindir}
+}
+
+SRC_URI[md5sum] = "36080a767e63e54878cd6bcfb20c4f3b"
+SRC_URI[sha256sum] = "f99fb58562a3d7edef6fd9e63ca04510e241bbdab37fdb122c2c7a112a09100a"
-- 
1.7.0.4


