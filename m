Return-Path: <tom.rini@gmail.com>
Received: from mail-qe0-f52.google.com (mail-qe0-f52.google.com
	[209.85.128.52])
	by arago-project.org (Postfix) with ESMTPS id EF0145299B
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 18:26:29 +0000 (UTC)
Received: by mail-qe0-f52.google.com with SMTP id w7so745575qeb.11
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=DDSHNDHHjKmWmI2WhFm4woES7wNTsy/69oGaQQC1sQw=;
	b=MArj5Ej4ofi5t28jJJm2twd6Q5rCgU5A/6MO0QgZq/fn6Rk4kmie4HbBc5bRAe6aRS
	1JxmUGNwgBlvHGv4JGIq4FyCvQyiSbgxFhCJTO6swStfzJfxBOuoBwef2IFtpeOSMMEO
	va4MddByN9UoUU967FrAbF3MUDa2hfSHP/MR/8Pn+dciCCv6olrPulCdCkFDnq5I2AbL
	+XcooojgnZLOkDw/k6Ph5Foe8MQI0065AD5zly/RkQHiw7979NlP9JheQij6bANFjc6v
	uG6yoPDJDa9SE5cXNSQrjttbH4Y1FPZs0wsiQhNJOhLgfk0dvgtwjA3KcFrgo793MMh6
	oQHQ==
X-Received: by 10.49.130.132 with SMTP id oe4mr4150417qeb.86.1382552789797;
	Wed, 23 Oct 2013 11:26:29 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-216-211.ec.res.rr.com.
	[174.106.216.211])
	by mx.google.com with ESMTPSA id 5sm63987969qao.3.2013.10.23.11.26.28
	for <meta-arago@arago-project.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Oct 2013 11:26:28 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 23 Oct 2013 14:26:16 -0400
Message-Id: <1382552778-29138-3-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1382552778-29138-1-git-send-email-trini@ti.com>
References: <1382552778-29138-1-git-send-email-trini@ti.com>
Subject: [PATCH 2/3] udev: Add rule for automount (and handle removal of) SD cards
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
X-List-Received-Date: Wed, 23 Oct 2013 18:26:30 -0000

Add rules to local.rules to call /etc/udev/scripts/mount.sh on insertion
and removal of SD cards, to mount to /media/mmcblkXpY

Signed-off-by: Tom Rini <trini@ti.com>
---
 .../recipes-core/udev/udev/local.rules             |    3 +++
 1 file changed, 3 insertions(+)

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
-- 
1.7.9.5


