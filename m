Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 069F15208C
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 01:15:32 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1025239oag.38
	for <meta-arago@arago-project.org>;
	Tue, 06 Nov 2012 17:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=J87JD0hBU4ylA81k5aRHZ8a835kNKHDowZIA7o0nR8A=;
	b=hUI85Lt4uRH+zcH3JmxlUT79gUNziXL9dUg1IIitEkN//hbUqTMWmWDueeqCyx/Q0Y
	IRJnCEZMbsco7k3gQPWdAN1g36GW11n35x3hpOczGbzq4zWzuKRRJs5MRBJFyPbC1+Sq
	RIXFXD8/ywbjmNLZI3my00YZsJKO8JUpadOy6rGpD+xcgfersM0upb4QOIjLUEe2j2JB
	MfInah2flKzgsvjiF/lX7mjsLo0wI1SSenKdGGHOWAlkXbU2RwKA2B/P8UAVTpsgAFLl
	25KQEz1CMlQ5ddYX3BYYU4lXSad8yuxuSxDn2F+R0/gHKHq/Sw+BnYRsT5Vj6hfnhjjX
	fgXQ==
Received: by 10.60.172.171 with SMTP id bd11mr519361oec.4.1352250932170;
	Tue, 06 Nov 2012 17:15:32 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id fw9sm22288514obc.19.2012.11.06.17.15.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Nov 2012 17:15:31 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue,  6 Nov 2012 19:15:24 -0600
Message-Id: <1352250925-12259-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] busybox: Enable telnetd
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
X-List-Received-Date: Wed, 07 Nov 2012 01:15:33 -0000

* Enable telnetd to allow someone to connect to the target device via telnet

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    4 ++--
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 31fbec2..f681eb7 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -810,8 +810,8 @@ CONFIG_TCPSVD=y
 CONFIG_TELNET=y
 # CONFIG_FEATURE_TELNET_TTYPE is not set
 CONFIG_FEATURE_TELNET_AUTOLOGIN=y
-# CONFIG_TELNETD is not set
-# CONFIG_FEATURE_TELNETD_STANDALONE is not set
+CONFIG_TELNETD=y
+CONFIG_FEATURE_TELNETD_STANDALONE=y
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 CONFIG_TFTP=y
 CONFIG_TFTPD=y
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
index 35b1243..b2d2540 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 SRC_URI += " \
 	file://inetd \
-- 
1.7.0.4


