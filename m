Return-Path: <eyalreizer@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by arago-project.org (Postfix) with ESMTPS id 9372652A5D
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 13:36:23 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id o13so1642383qaj.15
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=kSRhfxI04uvXjTh8dzRIQSy+hDqs/wuMe6ifPtK1c14=;
	b=CHMYRn2puiYivKtE1Lq8wTezX5VIOYQE4naXR1RFfzmHWfvSPCNc2IvcWKvJaSlWK1
	CXYalfOd/2V/YDK3dCU0fNeds/WALmvr5Dm9vtO/nDTuiW9FtRvSkdVPe0DN18ROBehS
	/++gSBKKHCg00hsgi91yiS+2p3QSRyfdrIqpCzVwoFt9QC/tm86WYn7+WR31x49+PUAl
	zos7qZED5nJKmq/3Sq7wnilmEXULh3TSsxh4RmpdHkJf640iFeeaRLKEWE9hpW/Kfzq1
	3+iyGxtWxQw9QZGPCFiSb3+xZ7YlRYFZIk+PFGuB8muY0VS6ynUQ47gCvN1LivZ/2qVP
	O18g==
X-Received: by 10.49.116.235 with SMTP id jz11mr22638536qeb.39.1363613783409; 
	Mon, 18 Mar 2013 06:36:23 -0700 (PDT)
Received: from user-VirtualBox.emea.dhcp.ti.com (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ku2sm32421520qeb.4.2013.03.18.06.36.21
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 06:36:22 -0700 (PDT)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 15:35:54 +0200
Message-Id: <1363613762-6537-2-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363613762-6537-1-git-send-email-eyalr@ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
Subject: [PATCH 2/9] wl18xx-firmware: install Wilink8 wlan firmware files
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
X-List-Received-Date: Mon, 18 Mar 2013 13:36:23 -0000

Add a recipe for installing the Wilink8 wlan firmware files into
the target file system.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
 .../wl18xx-firmware/wl18xx-firmware_git.bb         |   28 ++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
 create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_git.bb

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
new file mode 100644
index 0000000..0bb7ab8
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
@@ -0,0 +1,7 @@
+# Installs the the ti-connectiviy wlan firmware files into the root file system
+
+install:
+	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
+	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
+	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
+
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_git.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_git.bb
new file mode 100644
index 0000000..43c40bb
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Firmware files for use with TI wl18xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
+
+PACKAGE_ARCH = "all"
+
+PR = "r1+gitr${SRCREV}"
+
+PROVIDES += "wl12xx-firmware"
+RPROVIDES += "wl12xx-firmware" 
+
+SRCREV = "ol_r8.a6.01"
+SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
+           file://Makefile \
+          "
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    cp ${WORKDIR}/Makefile ${S}
+    oe_runmake 'DEST_DIR=${D}' install
+}
+
+FILES_${PN} = "/lib/firmware/ti-connectivity/*"
-- 
1.7.9.5


