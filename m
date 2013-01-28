Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id 4BDBE52A68
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:04 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so1002754oag.32
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Z3rGMxCgC3Kmr78wkeDfOB3dn3RtbbH4jwkdNRpSD5M=;
	b=jGsGl+M+oi2fKiYutSaI16UHtJhb1fa+4Gpjtm1/V8lhazq0FBmW8IlrIjkYNT2J2K
	PsAiOSi5h5yzApYQ8LXXzWBrjM7JVEclS1jHnrww6jpcUJbJW5gJIw7h9oQtoX+6ehwN
	ishExioXE13DERISGhjk460dbHqI7JYefuEJghbL9P2A0ENBJ5Ao62l4RlNw7FzJM0V8
	hzwBJAhgirA4hyCQyzi1MtrP/6GPOAxkcJv1xhcQwkHde7xdizmEtuDYCsgIlWlLf9VB
	Ct/IOsSyJbEf4acVpJVr/8u89tZg/qZW5ui9aSA5TMkhN9kGB0iBdQ+bc8hlxloGsdqY
	IAwg==
X-Received: by 10.182.207.70 with SMTP id lu6mr11490328obc.78.1359393963862;
	Mon, 28 Jan 2013 09:26:03 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.02
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:02 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:14 -0600
Message-Id: <1359393932-31361-14-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 14/32] busybox: Add rtcwake
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:04 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Adding rtcwake application needed by system test.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    2 +-
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 7d3c552..16ebdf0 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -583,7 +583,7 @@ CONFIG_PIVOT_ROOT=y
 CONFIG_RDATE=y
 # CONFIG_RDEV is not set
 # CONFIG_READPROFILE is not set
-# CONFIG_RTCWAKE is not set
+CONFIG_RTCWAKE=y
 # CONFIG_SCRIPT is not set
 # CONFIG_SCRIPTREPLAY is not set
 # CONFIG_SETARCH is not set
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
index bee6201..a6a5a81 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago5"
+PR_append = "-arago6"
 
 SRC_URI += " \
 	file://inetd \
-- 
1.7.0.4


