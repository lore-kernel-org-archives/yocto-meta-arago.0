Return-Path: <eyalreizer@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by arago-project.org (Postfix) with ESMTPS id 490495298A
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 10:11:38 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w62so4886590wes.24
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 02:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XH08hFOkLY9KdbEh7TdXNBVCHQzKk7H8EtbBovlzsu4=;
	b=RemaRwUeNqzyZIpd/bjmbwRcDyBytv5WHkcF0KC9QaM2REwZs6ldiabGFAslFnVyzi
	M7oZvuJwzoxAFUz4nBdZXMaEbOFlHpPeL6k34Uui4nDH0WAH8UEY0mfJRNn/t59lYmQg
	V+lMZLVWsVG1ZJktaTnOJ0WhlS1eIib5my28MW5zY24rJv4QMz8NNbcP7Tv852lak1en
	WBwx3okTc7dNVpUrLg46haCocoqkKou6wLW19ZBKSxiEuRHzCiJ3PE1eqKDlvBovPSam
	81pP3m8MUxqCh9IGbO02uQKS6INGushQoxVeUqEQUrq6G5+nwBJEAGNEC74HF0Ch9q5V
	rIfw==
X-Received: by 10.180.187.16 with SMTP id fo16mr11380067wic.26.1390817496735; 
	Mon, 27 Jan 2014 02:11:36 -0800 (PST)
Received: from localhost.localdomain (93-172-91-221.bb.netvision.net.il.
	[93.172.91.221])
	by mx.google.com with ESMTPSA id ea4sm27903935wib.7.2014.01.27.02.11.35
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Jan 2014 02:11:36 -0800 (PST)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 27 Jan 2014 12:11:29 +0200
Message-Id: <1390817489-2989-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 2/2] bluetooth-firmware: update for wilink8 sp3.3
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
X-List-Received-Date: Mon, 27 Jan 2014 10:11:38 -0000

* Update for using the latest service pack (3.3) for am335x
* Remove unsupported platforms

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |   13 ++++---------
 1 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
index 2b320da..d788875 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -1,8 +1,6 @@
 DESCRIPTION = "Firmware files for Bluetooth"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
-                    file://am1808/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
-                    file://omap3evm/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
+LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=5f67a65df8b40038a3251b2fe5b912df \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -13,19 +11,16 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RREPLACES_${PN}  = "linux-firmware-wl12xx"
 
-PR = "r2+gitr${SRCPV}"
+PR = "r3+gitr${SRCPV}"
 
-COMPATIBLE_MACHINE = "omap3|omapl138|da850-omapl138-evm|ti33x"
+COMPATIBLE_MACHINE = "ti33x"
 
-SRCREV = "adbc27c11d5c5c8c20a93a8beca647b4a6aaa03b"
+SRCREV = "57a8e569575e742c47dc2452c4932dcfff816442"
 SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
            file://0001-Makefile-allow-building-within-the-OE.patch"
 
 PLATFORM = "unknown"
 PLATFORM_ti33x = "am335x-evm"
-PLATFORM_omap3 = "am37x-evm"
-PLATFORM_omapl138 = "am180x-evm"
-PLATFORM_da850-omapl138-evm = "am180x-evm"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.0.4


