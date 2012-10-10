Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 7010552A65
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 19:20:23 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so881691oag.38
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 12:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/EuDu7qYVQd12rAHX9M91PPOuwKkMoKFzBEvsCDBQGY=;
	b=DyW+gkCb+zVPtEmF/fm2lYl8j9byIC1m72MvSw1xI6HLfyDvdt8YAgck7SRUO1/Khd
	ZLBAT0KH39gITLd9noGen8tpyiExJgdlrFGIDPGfQkqL4Xoem5ihoVE7PqQ/inzJ1+Rg
	bbOF2+/Z72jO0QBlvsL+M9C6F06s8jMz9XXCDgMetpCw7sGfcve+zQ8RVsrWJHEdK2/1
	nN6DC9jAloazhiAA7cskciYJsZUqw+rF7DVRPiwcKGY6TDPemds76to9PJ960IPrT/kB
	z94+0+HnC3LYgLLpgQgCqxiWTzNPIRu5gNcxYefnWS4YYM4ecZW4zjcxWdt3TsMS0he8
	Mc+A==
Received: by 10.60.0.194 with SMTP id 2mr19242022oeg.108.1349896822813;
	Wed, 10 Oct 2012 12:20:22 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id q6sm1493775oec.7.2012.10.10.12.20.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 12:20:22 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 10 Oct 2012 14:50:48 -0500
Message-Id: <1349898648-32290-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago.conf: Set Arago's DISTRO_FEATURES
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
X-List-Received-Date: Wed, 10 Oct 2012 19:20:23 -0000

* Explicitly set Arago's DISTRO_FEATURES. This insures certain features
  like X11 aren't accidently being included.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index a99a8df..1bd272f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -6,6 +6,8 @@ TCMODE = "external-arago"
 TCLIBC = "external-arago-toolchain"
 #DEFAULTTUNE = "armv7at-neon"
 
+DISTRO_FEATURES="xattr largefile ipv4 ipv6 nfs smbfs wifi ppp alsa bluetooth ext2 vfat irda pcmcia usbgadget usbhost pci pam tk directfb"
+
 # Locate the toolchain automatically from PATH
 TOOLCHAIN_SYS := "arm-arago-linux-gnueabi"
 TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
-- 
1.7.0.4


