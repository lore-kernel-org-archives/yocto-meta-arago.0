Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 828E952AB3
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:34 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id x4so4800912obh.38
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Bi/vP5VtpBQrAcMYHe6SwFm25a1AfVdRPKbUTkKiYKg=;
	b=gKWt9yfyCkmNfu3vaKm0T3HJ8Lm9YXfEFXh/Ww2CHVgYEFXBrNndbkNXtLLG6byb+Y
	APoWdsWYNZV6pqeVIGkn+VJlShhRxmXLcLFZZM8QevyUBpvhduLUTKdwWQmtzjfDSgSk
	PSrDsphnujA7bnaB6IR2guSfu3c94/hocdwMxZ1OaExZSL7oJiejHJFycPHAQkxyzJ4r
	E3T8E2c0+uFddkA1xKDfmipEYr72lSVT7P4o08XWvSCQvHIcid7q3kZEcvtySx2sUtiJ
	lCxaFGqlZYIjXlUr/eliYwlCFSf3C1W5AW9gSrZLiw6ajmPxRnmy/dX6UsFcTD4Objb5
	sOYA==
X-Received: by 10.182.212.99 with SMTP id nj3mr10294809obc.11.1358632353933;
	Sat, 19 Jan 2013 13:52:33 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.32
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:32 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:43 -0600
Message-Id: <1358632316-12266-18-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 18/31] bluetooth-gui: Fix segmentation fault on exit
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:34 -0000

From: Eyal Reizer <eyalr@ti.com>

Fix a segmentation fault on exit when the A2DP sink test dialog was not
activated.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../bluetooth-gui/bluetooth-gui.bb                 |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb b/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb
index 9f6217e..9be5ae9 100644
--- a/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb
+++ b/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://src/main.cpp;beginline=1;endline=37;md5=83d75e9470fc1
 COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
 BRANCH = "master"
-SRCREV = "d9fc6f1ab023230170672d5243cbee58d740e7fe"
+SRCREV = "046643eac13b4d6b6fd7525539ef666509df264e"
 
-PR = "r12"
+PR = "r13"
 
-SRC_URI = "git://git.profusion.mobi/users/lucas/BT_Demo.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://www.github.com/TI-ECS/BT_Demo.git;protocol=git;branch=${BRANCH} \
            file://bluetooth-icon.png \
            file://desc_bluetooth.html \
            file://bt_demo.desktop"
-- 
1.7.0.4


