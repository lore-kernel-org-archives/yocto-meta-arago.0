Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by arago-project.org (Postfix) with ESMTPS id 04073529AA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:35 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wc20so1026235obb.22
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=3lSrCRyyHIJ4jU6su8QQin1ZIcmRMoLsq6kOOj8oA00=;
	b=tROFoVGua2vel51kYIXX3yYDOPjTJFbyS+H5kmPqEaMdp1JIskcH1LiyAxQzsskVaM
	WyhGdbrk/xpYWQ/vry5utZ+sNf7rBxmGcduL+dhlWgu5rMuiUEbncjYZHYUe2AqAvhm0
	cuf1PwNDpucupbpCGJ9AUP07Tdo8HG09G4aed9AtKD5iJPS3Zga/3R9+t9Q2iOY8ZDIj
	ose7UHswFAqb4MGE3CoUlvjsnvuXQJp/PCkGfgWbxYE4mS/N8RCh9QShnCZ+NjIH+gvJ
	ITk3t0vf7vF0c6BGnGtGSDIR9C4elhDKBkx/+g377T90ZLJn6Oc9xTXMC2tYppEFIjKy
	IwsQ==
X-Received: by 10.60.21.131 with SMTP id v3mr5787485oee.32.1359151115499;
	Fri, 25 Jan 2013 13:58:35 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.33
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:34 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:01 -0600
Message-Id: <1359150851-23602-20-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 21/31] wl1271-demo: add license file
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:36 -0000

From: Eyal Reizer <eyalr@ti.com>

Add a BSD license file

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../wl12xx-demo/wl1271-demo_git.bb                 |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
index af9cc21..d2eb063 100644
--- a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Initialization and demo application for bluetooth on WL1271 chipset"
 SECTION = "network"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://README.md;md5=7fd458a478fbc8a473a2d5b95c5cb048"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb965abb1955d78452750ca40717999c"
 
 DEPENDS += "openobex"
 RDEPENDS_${PN} += "bluez4 openobex ussp-push obexftp bluez-hcidump"
@@ -9,13 +9,14 @@ RDEPENDS_${PN} += "bluez4 openobex ussp-push obexftp bluez-hcidump"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGE_STRIP = "no"
 
-PR = "r1+gitr${SRCREV}"
+PR = "r2+gitr${SRCREV}"
 
-SRCREV = "c7faa4cd2ef26b72ef2ae3d3d4854ea83a2ee636"
+BRANCH = "wl12xx"
+SRCREV = "7736f86b8c157ffc3e2a0b9e55a97c093faae14e"
 
 COMPATIBLE_MACHINE = "am37x-evm|am180x-evm|da850-omapl138-evm|am335x-evm"
 
-SRC_URI = "git://github.com/TI-ECS/wl1271-bluetooth.git;protocol=git"
+SRC_URI = "git://github.com/TI-ECS/wl1271-bluetooth.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.0.4


