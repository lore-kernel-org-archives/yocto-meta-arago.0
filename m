Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id E7E485208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:05 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=UuQbM4L/JMq2NLG2QDZsTJlMV4SRwGceFnPgWnuhvy0=;
	b=zPmXg9FwiRcyNpra4WmPd8mNcEQt7Zorl1ZaeHl8TYZKtaUFBHxPdv8juJxWLlLXGn
	2ic6ZN/1xy6dIBRLtfPhQHxf6IGI8OdXz8+R/axvyK1FtzsnsaHJHIbhiIJEZH1bvSh+
	hUEA+gqR8g8GJAdOC8CvYijrb3GmOaVq+Ii9e5uf4h1KNlp8eXB0SMZqQT3956VbWQIA
	6iKNIMTzUBW1u6tV6vKDTLmjs88LkeH5CCIJc6FrAqtH1Y2Ylb5HF5x2zl6qbMQ7oodS
	9QscZdefGfxdPH/LW3S5R9MNTrs9Sh150YOHz1qAwRDVfQd+izcAP4suaXZ9pSkW67gi
	dqOw==
Received: by 10.182.154.70 with SMTP id vm6mr6882930obb.50.1352080445718;
	Sun, 04 Nov 2012 17:54:05 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:05 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:10 -0600
Message-Id: <1352080417-9792-13-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 15/42] wif-direct-demo: Remove unnecessary ${PN} from package list
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:06 -0000

* The current recipe added ${PN} to the PACKAGES variable. By default ${PN} is
  already included in the PACKAGES variable which resulted in the error:
  "ERROR: wifi-direct-demo is listed in PACKAGES multiple times, this leads to
   packaging errors."
* Removing ${PN} from the PACKAGES += statement fixes this issue

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wifi-direct-demo/wifi-direct-demo_git.bb       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
index 328bc41..96322ac 100644
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/main.cpp;md5=cf285050f56a20d116b026c9f8ded4f7"
 
 COMPATIBLE_MACHINE = "(am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "dbus"
 SRCREV = "0950a67d9fe9a70668a993774e65ba9d457d750c"
@@ -35,7 +35,7 @@ do_install () {
        install -m 644 ${WORKDIR}/wifi-direct-demo.desktop ${D}${MATRIX_APP_DIR}/wifi-direct-demo
 }
 
-PACKAGES += "${PN} matrix-gui-wifi-direct-demo"
+PACKAGES += "matrix-gui-wifi-direct-demo"
 
 FILES_${PN} +=" \
 	${bindir}/wifi-direct-demo \
-- 
1.7.0.4


