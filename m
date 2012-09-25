Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 1DE03529A4
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 15:15:35 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so1292461obb.38
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=e16rGM0+J9f2GZH2+ttrreTaioQ0dTVgXWvRFuQ+098=;
	b=Vm0ZHMM8DaF2LMWiaemecmya3BqbEZ6i1/6NRJKY26q1XFz8wWoOJD+v4UO9xEa/5+
	CDZ55WGScoZtk1iUfMBYm2kKr11xe2CcIj/qDNsdsIJvPNLPKELic9QGFxSYhIMrsYfX
	xyGUKtr5MSv9rsUQVQVGQUFID3LY0CbFL5LWNhelfEp8tr0Sc2ARbb9szDAxMC8RVRWf
	suUWYtYkCg6xSWS8geKJ8xQ2ELDjJYE+rXkX6lwSSu77DQ32EuP4ULACgw5ft9y8WIlH
	ejXiKf4Q8f/o7XoKom03zAfZe4iKR2LFdIWdaLSH2jW46CXJO9dsQP/MFZwLmgl4Y0Rb
	Xcwg==
Received: by 10.182.43.40 with SMTP id t8mr12799904obl.93.1348586134431;
	Tue, 25 Sep 2012 08:15:34 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id kc5sm457999obb.21.2012.09.25.08.15.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 08:15:33 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 25 Sep 2012 10:40:18 -0500
Message-Id: <1348587618-25590-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] bluez-tools: Port bluez-tools recipe
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
X-List-Received-Date: Tue, 25 Sep 2012 15:15:35 -0000

* Port bluez-tools recipe from arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../bluez-tools/bluez-tools_git.bb                 |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/bluez-tools/bluez-tools_git.bb

diff --git a/meta-arago-extras/recipes-connectivity/bluez-tools/bluez-tools_git.bb b/meta-arago-extras/recipes-connectivity/bluez-tools/bluez-tools_git.bb
new file mode 100644
index 0000000..0f53343
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/bluez-tools/bluez-tools_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Bluez Tools"
+HOMEPAGE = "http://code.google.com/p/bluez-tools/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+RDEPENDS = "bluez4 obexd"
+DEPENDS = "glib-2.0 dbus-glib"
+
+PR = "r0+gitr${SRCREV}"
+
+SRCREV = "171181b6ef6c94aefc828dc7fd8de136b9f97532"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://gitorious.org/bluez-tools/bluez-tools.git;protocol=git"
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
-- 
1.7.0.4


