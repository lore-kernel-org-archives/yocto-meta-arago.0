Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id CFB1452AB1
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:17 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=T7ub5s2vD425rHqiIxvCmu7aEZiY6sDjD6gMJvW2gms=;
	b=MLJaTYib58VjZ2W+9BJR1uU5Sqh0Inq12aAoZG2JSV75TGUriCRvFMjehp0b8QG/j9
	S9Mi2Qbh3Rvutav3lMEYnQfeiX6T9LnpMdzix2Hm/a1qso1GLt9tqqvVR2ZCmFwtdlRO
	N7YRk+38RemG6w6wD8oxNVy8rVrfUg8v4aiRy1ysHccHVkjU0Mni7mgz6bzMqFkb3t4c
	h1yoqJoKBfP2K59ugoQqMQ+jCLYR34bTOcPTjE2cEQxw+7uiVzolafqkTSJjcp2wVKU3
	Qj2YlW5170mbOv+qjfT8jXXjpdsg4Tjb4Acog9mj+aK79B9qdJugOOLPSk3UVNKEdp4r
	Tgnw==
Received: by 10.182.202.39 with SMTP id kf7mr6746377obc.37.1352080457543;
	Sun, 04 Nov 2012 17:54:17 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:17 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:22 -0600
Message-Id: <1352080417-9792-25-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 27/42] qt4-embedded: Use new arago-qt4.inc file
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:18 -0000

* Use arago-qt4.inc to provide the common setting changes that are used by both
  qt4-embedded and qt4-embedded-gles

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt4/qt4-embedded_4.8.0.bbappend     |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
index 462a746..f9e5810 100644
--- a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
+++ b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
@@ -1,5 +1,3 @@
-# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
-# For our distribution purposes we only use LGPLv2.1
-LICENSE = "LGPLv2.1"
+require arago-qt4.inc
 
-PR_append = "-arago1"
+PR := "${PR}.0"
-- 
1.7.0.4


