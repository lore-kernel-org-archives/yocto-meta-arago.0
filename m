Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 2BFD8529C6
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:46:48 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6217172oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=LYLCn+0ZiFnhODPSOdivRkfJR0cWY3TXRfvacVps/mw=;
	b=OE0wUr7AktaG5LuHHwA0KG/oxhrzm5MM/gzRUqSr6mFGMOjcp2RgcAqT/27+6XNx5m
	oGMz84Qakf8LGvswQv5ZQ3pOjU3HC57xUVQXdfboCk9go1rVHMu9VB8rOchxbw8F2pFs
	zNeRzwTWAWyJQYqQQVmBTUkyLzwxiZYft9JFuxTFMFzcD1+70Efwzff4T/2o1Wcz2aGo
	TurWJGagippyh25PvgCmx2mtRN6zv1RhZQWp3wEL94O29/bnsn606b8TLqKsjhQYAbnd
	sK0MmoEQujy0MqyDy/vJ8hwz9ENQvhgcd7NA09KOgE4DXMF6FiUmplj7XU6lB5R7MccN
	boUw==
Received: by 10.60.19.202 with SMTP id h10mr15531659oee.99.1352760407954;
	Mon, 12 Nov 2012 14:46:47 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id nd14sm8285868obb.14.2012.11.12.14.46.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:46:47 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:46:36 -0600
Message-Id: <1352760396-7331-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352760396-7331-1-git-send-email-fcooper@ti.com>
References: <1352760396-7331-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/5] arago.conf: Switch to latest PSP u-boot release
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
X-List-Received-Date: Mon, 12 Nov 2012 22:46:48 -0000

* Switch to the latest PSP u-boot release being developed for the 2012 fourth
  quarter Sitara SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1378255..cca90f6 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -56,7 +56,7 @@ PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x"
 PREFERRED_VERSION_virtual/kernel_am335x-evm = "3.2.0-psp05.06.00.00"
 
 # Use the SDK supported u-boot version
-PREFERRED_VERSION_u-boot_am335x-evm = "2011.09-psp04.06.00.08"
+PREFERRED_VERSION_u-boot_am335x-evm = "2012.10-psp05.06.00.00"
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
-- 
1.7.0.4


