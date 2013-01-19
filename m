Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by arago-project.org (Postfix) with ESMTPS id AA2E352AB8
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:32 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id n5so5011448oag.3
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=nZLbkDJGgSUwVarrw821mm1vG42SPbX0HmqXF5ME0pY=;
	b=jcrf/lJ5Ga+fMlFqmmu7SxocmdC7kb5YuVeCIcOIMA9epdY5dT4SKPHMG8TLCbgzM7
	la0FxzoBfbss1wPLDG+OPh5WgXDd0yiKVs6QuKRpZ8kR3teLyxnd4WkFvUUOE1gL8yNt
	FPPyiL4FqDQzk3hDmPOWhVHUwK9QHS/QAyFKoq5gL1rkW/FSHWw1cWToZf5MVllKLSeY
	YU9ynhIR24AZzODdl4YvgkzRubNQChRR53WCRfg+p3cjhdtCqXZ8A5jYuTOnGoEyOihr
	IWvvUTwSTzs/Mq2u/+8Fuc89OzIlsbbXzPD0eaTK5ucE3qWPMfI2q5c8HwJHX86fAjSu
	x+6A==
X-Received: by 10.60.32.73 with SMTP id g9mr10631557oei.134.1358632352165;
	Sat, 19 Jan 2013 13:52:32 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.30
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:31 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:42 -0600
Message-Id: <1358632316-12266-17-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 17/31] wifi-direct-demo: fix segmentation error on exit
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:32 -0000

From: Eyal Reizer <eyalr@ti.com>

Fix a segmentation fault caused when exiting the application without
pressing the "Enable WiFi Direct" checkbox

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../wifi-direct-demo/wifi-direct-demo_git.bb       |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
index 96322ac..1db1043 100644
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://src/main.cpp;md5=cf285050f56a20d116b026c9f8ded4f7"
 
 COMPATIBLE_MACHINE = "(am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
-PR = "r3"
+PR = "r4"
 
-BRANCH = "dbus"
-SRCREV = "0950a67d9fe9a70668a993774e65ba9d457d750c"
+BRANCH = "master"
+SRCREV = "9041d6052b43a38e3f06a474822f3f7382bf14a5"
 
-SRC_URI = "git://git.profusion.mobi/users/lucas/wifi-direct-demo.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://www.github.com/TI-ECS/wifi-direct-demo.git;protocol=git;branch=${BRANCH} \
            file://wifi-direct-demo.desktop"
 
 require recipes-core/matrix/matrix-gui-paths.inc
-- 
1.7.0.4


