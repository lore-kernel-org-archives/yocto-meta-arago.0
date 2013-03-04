Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id D5C3452AC5
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:01:48 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so9840967oag.32
	for <meta-arago@arago-project.org>;
	Mon, 04 Mar 2013 12:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=6S0Ch5P7/V6zW0p+tawGYV6bneXQ9102RE9Twcz2SM0=;
	b=qYQZeBcBAVY2ZZxWGYdiWBqIdxsxNXBaeOgkrrAZA2Mcn/ZcNccvi6apfi9JChizX6
	oSGQJMyrfgU5WSiH55Yuw8PVCq7MObL9pPTI+PgzVaulKhieTOKz9rVPslkOQ1TcjWsc
	ohj1pghuuRKAyC1RySyyWwTV43Fb3hfGKWUdP8gZXzuaAr+4JS/XfTP+T8eD6rGCqF9m
	tvZErxw0017G/tVsiClEPyKoFLslQfpwKx0BCGiecQG+8I7Fb/qufLyaIWY57ksjnm0P
	TWbBZbkNlxRpMjSN6p7TWs56I0lQ3QTrjA+TQrLiT395SlibfyV6IRJURCFuk35ZKwk+
	U9NA==
X-Received: by 10.60.169.114 with SMTP id ad18mr17208208oec.105.1362427308419; 
	Mon, 04 Mar 2013 12:01:48 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j4sm31153357oea.3.2013.03.04.12.01.46
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:01:47 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon,  4 Mar 2013 14:01:26 -0600
Message-Id: <1362427289-18057-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362427289-18057-1-git-send-email-fcooper@ti.com>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 07/10] arago.conf: Don't pull in xloader recipe
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
X-List-Received-Date: Mon, 04 Mar 2013 20:01:49 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Xloader recipe is no longer needed. Avoid pulling this recipe in.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 17bb85b..575e89a 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -72,6 +72,9 @@ PREFERRED_PROVIDER_virtual/kernel_beagleboard = "linux"
 PREFERRED_VERSION_linux_beagleboard = "3.3.7"
 PREFERRED_VERSION_u-boot_beagleboard = "2012.04.01"
 
+# Don't pull in xloader since we don't use it
+EXTRA_IMAGEDEPENDS_omap3 := "${@'${EXTRA_IMAGEDEPENDS}'.replace('x-load','')}"
+
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
 PREFERRED_PROVIDER_udev = "udev"
-- 
1.7.0.4


