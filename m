Return-Path: <tom.rini@gmail.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by arago-project.org (Postfix) with ESMTPS id 9246D529AF
	for <meta-arago@arago-project.org>;
	Tue, 22 Oct 2013 16:43:05 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id ii20so3479901qab.4
	for <meta-arago@arago-project.org>;
	Tue, 22 Oct 2013 09:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=0nR6cN9ub0SJGVSQkufvBb7ubDlsZo8uJmZbUtu4tNE=;
	b=MSJ3ngZ7aHUj8+3s7f3dLpRJq0YnY18OwhgDTxFT/oAGa4jQZnimA8rz1EgiLi9G22
	X9/ziKDZlYzfNk7UmquQj4ev9KnZ9iDil+iIFRlR44B/eipoCj6s5EvEu9lRLXQkEEe/
	SIwgZj5GS3j2w28AToxLhQi+eATTOWW9JS9lQLE8v4dpYeBG3FJitl6quLPlQeouc6Eh
	MPeYCzg5qK0N04eEg7AXaH2L/ri86dWQAX43v56qs/yWHCfU4OuR+VzmvnjOvAmly7Me
	/Den2dOLAQ5NttLIJxdi+/H+7hLXIgu6QkScw7pmj3/NPF2f41HzjJA9di/k6YBwkuzi
	L1dA==
X-Received: by 10.224.138.4 with SMTP id y4mr31410191qat.65.1382460182563;
	Tue, 22 Oct 2013 09:43:02 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-216-211.ec.res.rr.com.
	[174.106.216.211])
	by mx.google.com with ESMTPSA id x1sm51460609qai.6.2013.10.22.09.43.00
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Oct 2013 09:43:01 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 22 Oct 2013 12:43:04 -0400
Message-Id: <1382460184-12671-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
Cc: "Franklin Cooper Jr." <fcooper@ti.com>
Subject: [PATCH] udev: Re-fix touchscreen detection rule
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
X-List-Received-Date: Tue, 22 Oct 2013 16:43:12 -0000

* Fix the rule to detect the touchscreen and create the
  /dev/input/touchscreen0 device node more reliably.  udev knows how to
  detect a touchscreen and sets ID_INPUT_TOUCHSCREEN for us to check
  against.
* This has already been submitted upstream and can be removed
  when meta-arago switches to something that contains this fix, possibly
  Dora.
* The patch has already been submitted to oe-core at:
  http://article.gmane.org/gmane.comp.handhelds.openembedded.core/44297

Cc: Chase Maupin <chase.maupin@ti.com>
Cc: Franklin Cooper Jr. <fcooper@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Tom Rini <trini@ti.com>
---
 .../recipes-core/udev/udev/local.rules             |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules b/meta-arago-distro/recipes-core/udev/udev/local.rules
index d0cbf91..d0b0216 100644
--- a/meta-arago-distro/recipes-core/udev/udev/local.rules
+++ b/meta-arago-distro/recipes-core/udev/udev/local.rules
@@ -17,7 +17,5 @@
 ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
 
 # Create a symlink to any touchscreen input device
-# Trigger based on input type, that the evbit (-e) has EV_SYN and EV_ABS,
-# has an EV_ABS value (-a) which is used for touchscreen type devices.
-SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0"
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"
 
-- 
1.7.9.5


