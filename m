Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by arago-project.org (Postfix) with ESMTPS id 069D752A5D
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:14 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id va7so1132510obc.27
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ivYLNgoaGLtoKlw/LQTBdrNdoSl3gg+WyMmx63QA4kY=;
	b=hkjbO9kQnGY2/utUVjBMGCc25l+4J9RhKkZXEthiAtq7VIeg5v5NIk6WmXe8IQ+DBi
	B5QQSfUCGvfOZ6yShnyqKi1sgKG60xWEyhjZW0Y8T4fBvv+RrLI9o57TQxVP1Inp0vB/
	H+cnbJcGd/M6fAG0VLgRjWZOYCi6L9z5ujh9czrgpwNdo0jpF8PAlTsa6kcmufoPZR7B
	AHlfZSPMR7iz3tGyhEpyaMo6YVHuFWg7lcCKh3dU3YiX8Y3PYH7JgE9BaG/RBO4LIuE3
	171+HNm2bzTCsudml1ip2pEfrMb3JA8S2EI8YziwsnJqrnKk7rFtwQmsRERdcf7CANT4
	IOIg==
X-Received: by 10.60.24.97 with SMTP id t1mr11660769oef.6.1359393974332;
	Mon, 28 Jan 2013 09:26:14 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.12
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:13 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:20 -0600
Message-Id: <1359393932-31361-20-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 20/32] battleship: kill wpa_supplicant before launching
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:15 -0000

From: Eyal Reizer <eyalr@ti.com>

Battleship demo may not start in case the wpa_supplicant is running
already, kill it before launching application.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../battleship/battleship_git.bb                   |    2 +-
 .../battleship/files/battleship.desktop            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
index 2c8312f..47cffea 100644
--- a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
+++ b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
@@ -3,7 +3,7 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=75859989545e37968a99b631ef42722e"
 
-PR = "r4"
+PR = "r5"
 
 COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
diff --git a/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop b/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop
index f8ff5a2..da368cc 100644
--- a/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop
+++ b/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop
@@ -4,6 +4,6 @@ Name=Battleship
 GenericName=Demo App
 Icon=/usr/share/matrix-gui-2.0/apps/battleship/battleship-icon.png
 Type=Application
-Exec=battleship
+Exec=/usr/sbin/kill_wpa_supplicant.sh battleship
 Categories=wifi
 X-ProgramType=gui
-- 
1.7.0.4


