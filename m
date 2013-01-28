Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by arago-project.org (Postfix) with ESMTPS id 574E952A24
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:13 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id h1so3004374oag.20
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=S2oXfWZQG79LMM8lMvYH4+q56tXqC2qrR899+8ztCCw=;
	b=J4jt5/5tBEnv5X5NxhP2nX1AOX3FCTpXtMSdVo5rsZswun/TLuBvbAKCE8mfHNrRmY
	z4idDs1wLlk3gH0bg8f4pyyN+cNjIeDGDxlAFY0B//oM9CT+4C1EgCEnMeDQ7lBeHvSe
	aCeKcguSRd3ctpVHNlWiIHA+bwMT7vOYX+huhM3CQKxkhIGLrCEvEMRVZs5Hs4wyBqQl
	JUP3a8iP1ThO5svVBYSsVwG617yY6iaxgQ2f0VWytpE7oLMJZ2zOneuzazAnoC+LtReS
	061c2acVb8odeUU41D2EZ11BjpgaihHJB7hHO0XWj+h7As99hU7qdU1B9EXrQopaiEUZ
	8Vow==
X-Received: by 10.60.31.205 with SMTP id c13mr11632107oei.135.1359393972659;
	Mon, 28 Jan 2013 09:26:12 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.10
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:11 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:19 -0600
Message-Id: <1359393932-31361-19-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 19/32] wifi-direct-demo: kill the supplicant before starting
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:13 -0000

From: Eyal Reizer <eyalr@ti.com>

Checks on whether the wpa_supplicant is already running and kills it
before starting.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../files/wifi-direct-demo.desktop                 |    2 +-
 .../wifi-direct-demo/wifi-direct-demo_git.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop
index 606dbba..3873e6b 100644
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop
@@ -4,6 +4,6 @@ Name=WiFi-Direct Demo
 GenericName=Demo App
 Icon=/usr/share/matrix-gui-2.0/apps/wifi-direct-demo/wifi-direct-icon.png
 Type=Application
-Exec=wifi-direct-demo
+Exec=/usr/sbin/kill_wpa_supplicant.sh wifi-direct-demo
 Categories=wifi
 X-ProgramType=gui
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
index 79d1dcc..984df9d 100644
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=75859989545e37968a99b631ef42722e"
 
 COMPATIBLE_MACHINE = "(am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
-PR = "r5"
+PR = "r6"
 
 BRANCH = "master"
 SRCREV = "1d41618cded6d82b285e14b85b59f3320fb22469"
-- 
1.7.0.4


