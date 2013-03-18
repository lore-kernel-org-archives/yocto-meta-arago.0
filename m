Return-Path: <eyalreizer@gmail.com>
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by arago-project.org (Postfix) with ESMTPS id A391152A51
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 13:36:19 +0000 (UTC)
Received: by mail-qe0-f51.google.com with SMTP id nd7so3366001qeb.10
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 06:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=VhLqv1Aj+Tn7pfSpD8YkZqctzuhD6KD2tzM5KHuTyQk=;
	b=TVoJDSQjkUpZt4trYfRs4DTIKW4tBt1wDpkrCBdfUKjDGwQQ6apB/qQkQUet++3HG8
	fLXDdOKuzCCHZgJbEjNbx4Im8WXmN3ZDWZY8Z2GKyS3tSyLLN4nKBvuAb8CPOgvAeCgj
	Zlhm62ev1OK/iHNwBSs7/AOiXG0wprHTqwUTW8ochjXlpwu/UhUFvQQklqsSrb8JA4gF
	dVuQq/TSCODN6o3IBPL6ypbsiQX+sLMsCbplfdrogALbxDUus7m0GOjarq079QIA93Fm
	z8fsWmSzKZEhrKyZ5Eq8lyau93R2Gv2hQYIm2bcrvPKx4t0Gm2RK28+M+4GmoL0yRuRk
	hwjw==
X-Received: by 10.224.199.70 with SMTP id er6mr19853596qab.19.1363613779460;
	Mon, 18 Mar 2013 06:36:19 -0700 (PDT)
Received: from user-VirtualBox.emea.dhcp.ti.com (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ku2sm32421520qeb.4.2013.03.18.06.36.17
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 06:36:18 -0700 (PDT)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 15:35:53 +0200
Message-Id: <1363613762-6537-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/9] wlconf: configuration utility for wilink8 wireless driver
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
X-List-Received-Date: Mon, 18 Mar 2013 13:36:19 -0000

Add a recipe for building and installing the wlconf configuration
utility for TI Wilink8 familily of chips.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../recipes-connectivity/wlconf/wlconf_git.bb      |   36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_git.bb

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_git.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_git.bb
new file mode 100644
index 0000000..0d8a057
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Configuration utility for TI wireless drivers"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
+
+PR ="r1"
+PV ="0.0"
+PR_append = "+gitr${SRCREV}"
+
+SRCREV = "ol_r8.a6.01"
+SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
+
+S = "${WORKDIR}/git/wlconf"
+
+EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -d ${D}${bindir}/wlconf/
+	install -d ${D}${bindir}/wlconf/official_inis
+
+	install -m 0755 wlconf ${D}${bindir}/wlconf/
+	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
+	install -m 0755 struct.bin ${D}${bindir}/wlconf/
+	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
+	install -m 0755 README ${D}${bindir}/wlconf/
+	install -m 0755 example.conf ${D}${bindir}/wlconf/
+	install -m 0755 example.ini ${D}${bindir}/wlconf/
+	install -m 0755 ${S}/official_inis/* ${D}${bindir}/wlconf/official_inis
+}
+
+FILES_${PN} += " \
+	${bindir}/wlconf \
+	${bindir}/wlconf/official_inis \
+"
+
+FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
-- 
1.7.9.5


