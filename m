Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 9CCF352A6F
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2012 21:38:34 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eq6so909893obc.38
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2012 13:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JZttCSkTkJeVEBtW+oVfUEx7/3XVlPzLbCNpJTaZF9c=;
	b=r1BPKHLCxpG3PJsqXEpSLOY9PL1okryV7tgEk9snn3icEnrr+pSpwfzeElxDRrBJEv
	F+qW9d11xWv3aNwzVNf5MDQG6ygCmaWfXqRhBS2CGy/8h/MsfHtsHywsrAo1FFD1iMpI
	KGr0ColZ79znpK0/8tVc4KHeijUrhmB9orjiOMR9Hrkurkw0I9c58RAFpEDPXoQST8P5
	coY39vgqQvQg11yuxvIKqrb+M9BXKKq1wQnMhOTDQTv6GXUHw1fJrV+J1T2kV0SqkFEX
	UpYoZrd0X6xCnCDn+ZWu80rkBzL8UDIqmePhV7dlmTwd5KM6z95HmEmJwqHLY3WsyymT
	cEww==
Received: by 10.60.32.19 with SMTP id e19mr22046777oei.9.1352929111233;
	Wed, 14 Nov 2012 13:38:31 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm10969243oeb.3.2012.11.14.13.38.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 13:38:29 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 14 Nov 2012 15:38:25 -0600
Message-Id: <1352929105-11189-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: d-gerlach@ti.com
Subject: [PATCH] alsa-state: Modified asound.conf to allow playback on dmix and capture from hw
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
X-List-Received-Date: Wed, 14 Nov 2012 21:38:38 -0000

From: dgerlach <d-gerlach@ti.com>

* By default alsa was set to use dmix for both playback and capture. However,
  for capture dmix can not be used.
* Configuring capture to use "hw:0,0" by default which is the external audio
  codec ic.
---
 .../recipes-bsp/alsa-state/alsa-state.bbappend     |    4 ++++
 .../recipes-bsp/alsa-state/alsa-state/asound.conf  |   18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
 create mode 100644 meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf

diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
new file mode 100644
index 0000000..25a9778
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
@@ -0,0 +1,4 @@
+PR_append = "-arago0"
+
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf
new file mode 100644
index 0000000..f3e161b
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf
@@ -0,0 +1,18 @@
+# default dmix configuration
+
+pcm.!default {
+        type asym
+        playback.pcm {
+                type plug
+                slave.pcm "dmix"
+        }
+        capture.pcm {
+                type plug
+                slave.pcm "hw:0,0"
+        }
+}
+
+ctl.mixer0 {
+    type hw
+    card 0
+}
-- 
1.7.0.4


