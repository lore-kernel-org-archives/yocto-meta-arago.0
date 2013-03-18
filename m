Return-Path: <eyalreizer@gmail.com>
Received: from mail-qe0-f41.google.com (mail-qe0-f41.google.com
	[209.85.128.41])
	by arago-project.org (Postfix) with ESMTPS id 0DB4352A5D
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 13:36:40 +0000 (UTC)
Received: by mail-qe0-f41.google.com with SMTP id 6so3366543qeb.0
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=FeC5GgEwZiBTMaO4IwChkCNL8dSOkBcRp8ipyFwXPM8=;
	b=VpRpq95ox0JtFiPWWXOEm/iVoJK2sh8PbgferO4spvLg9aCzs5vZzXCyECmAAgMQ1k
	XxVD/WIhvP3yhFoYogTsbRa0vzFFhdQYWQGL2/9Udwsbm6E6/GShWluO7SPfwgMTWhRq
	YP63sMW1KbgxIEuiYzpfzeH7POb4ADzAq5vcZPVJ8y6hV2s/t84ZtXYut6/iZ7sawPDL
	TF1uZgir4JL8HrIiavBqYm/4wMRgLiP9r5WqTDYb/Rof0N2X9TdyCUFRPkrsYzr8hSfh
	RzpmTRGuhazziiLLMkVrVJ/4FI7QEkZtXhf17pdHTevPBuGfdOapwYJqGRMtJZA97MdG
	dGUw==
X-Received: by 10.49.127.180 with SMTP id nh20mr22740589qeb.19.1363613799874; 
	Mon, 18 Mar 2013 06:36:39 -0700 (PDT)
Received: from user-VirtualBox.emea.dhcp.ti.com (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ku2sm32421520qeb.4.2013.03.18.06.36.38
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 06:36:39 -0700 (PDT)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 15:35:59 +0200
Message-Id: <1363613762-6537-7-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363613762-6537-1-git-send-email-eyalr@ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
Subject: [PATCH 7/9] bt-firmware: update for including the wl18xx bt firmware
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
X-List-Received-Date: Mon, 18 Mar 2013 13:36:40 -0000

From: Eyal Reizer <eyalr@ti.com>

Update the recipe for including the wl18xx bluetooth firmware
files from SP-2.8 into the target root file system

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
index 569c690..72bcc6c 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -13,11 +13,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RREPLACES_${PN}  = "linux-firmware-wl12xx"
 
-PR = "r0+gitr${SRCREV}"
+PR = "r1+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "omap3|omapl138|da850-omapl138-evm|ti33x"
 
-SRCREV = "db43d1f05efda9777d7ac1ac366637e29e21f77f"
+SRCREV = "adbc27c11d5c5c8c20a93a8beca647b4a6aaa03b"
 SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
            file://0001-Makefile-allow-building-within-the-OE.patch"
 
-- 
1.7.9.5


