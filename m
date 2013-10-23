Return-Path: <tom.rini@gmail.com>
Received: from mail-qe0-f42.google.com (mail-qe0-f42.google.com
	[209.85.128.42])
	by arago-project.org (Postfix) with ESMTPS id 6B04E529AF
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 18:48:30 +0000 (UTC)
Received: by mail-qe0-f42.google.com with SMTP id gc15so766177qeb.15
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 11:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=LAxdBAxBVn1GzqrZbm2z7rZOz/fnB9wrofQ6/qsGiRg=;
	b=VNQcMGrpfuIiabSCAn4Rtp83nlzB/hd6thGTGBBKf8CKSytUviksIuMHgYd9ejujFU
	Eyk/MJR0neD14pODfChFk7VEBC0Aqr56i7/ZIaVucFjcCZyRljRl49ZBYT6fZc8tDjND
	hHlD2FN1hdc/VcUPXTxxOJcXhdvo+s136lQwL+T+E67kq0B2QPa4kiGTttsrXVNDW2D+
	NalRVY5mDYXciXPQehZuYvsUhHILydlTsnUJ+fmZ1PD4q3XS90EbPDgDvkOTvX3pVqf+
	PxkUWX63J0x5U/n2dbJG7RBhgiO072BxxG5LXQ3/ClrUyI37YeSsUFb7u+4lSTPmyz4k
	oz3A==
X-Received: by 10.49.50.7 with SMTP id y7mr4118828qen.45.1382554110086;
	Wed, 23 Oct 2013 11:48:30 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-216-211.ec.res.rr.com.
	[174.106.216.211])
	by mx.google.com with ESMTPSA id b10sm55237664qeg.7.2013.10.23.11.48.28
	for <meta-arago@arago-project.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Oct 2013 11:48:29 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 23 Oct 2013 14:48:24 -0400
Message-Id: <1382554104-31011-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1382552778-29138-3-git-send-email-trini@ti.com>
References: <1382552778-29138-3-git-send-email-trini@ti.com>
Subject: [PATCH v2 2/3] udev: Add rule for automount (and handle removal of) SD cards
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
X-List-Received-Date: Wed, 23 Oct 2013 18:48:30 -0000

Add rules to local.rules to call /etc/udev/scripts/mount.sh on insertion
and removal of SD cards, to mount to /media/mmcblkXpY

Signed-off-by: Tom Rini <trini@ti.com>
---
 .../recipes-core/udev/udev/local.rules             |    3 +++
 .../recipes-core/udev/udev_182.bbappend            |    2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules b/meta-arago-distro/recipes-core/udev/udev/local.rules
index d0b0216..45c3a46 100644
--- a/meta-arago-distro/recipes-core/udev/udev/local.rules
+++ b/meta-arago-distro/recipes-core/udev/udev/local.rules
@@ -19,3 +19,6 @@ ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe
 # Create a symlink to any touchscreen input device
 SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"
 
+# Auto-mount any SD cards
+ACTION=="add", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
+ACTION=="remove", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
diff --git a/meta-arago-distro/recipes-core/udev/udev_182.bbappend b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
index 852620e..838cce8 100644
--- a/meta-arago-distro/recipes-core/udev/udev_182.bbappend
+++ b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
@@ -5,4 +5,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago1"
+PR_append = "-arago2"
-- 
1.7.9.5


