Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gh0-f169.google.com (mail-gh0-f169.google.com
	[209.85.160.169])
	by arago-project.org (Postfix) with ESMTPS id E44BE52A8E
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:35 +0000 (UTC)
Received: by mail-gh0-f169.google.com with SMTP id r18so474581ghr.14
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=9JMPJ8xJy4cxdbSDfji55K7IlftOXmS6+Jb00i19xys=;
	b=iTcfw34W+EDLd7IiTYXzTtqJW8u95IdgMz6oOjRg6+fGEC9A3IIp8Av9EQde+oHgiW
	2nCuebGyk5yCPf4rSiNeQiLm0xxI3inzqVH55YICjeReBKfoSL4xvz9z+V3NWyOlpP8J
	LCXAJzqWQv/S5Lu2gSha9QmgXRvc++nZJa9APZCtDpKrnwDXDA/5e40SRxBArOAmIQsX
	S+7V3GSrWYI//ZSk9aTp+hypCmtlo5rTf5Oo4RpvL00OfGcNjOHLRHDCdTcqVjHjZsno
	BNWq4uXbdq+oQqwcHZVOQJZZefjXaFJAmQrEth5Il+2AgshYOA0EgzRHeqyThCUnDLCg
	INgQ==
X-Received: by 10.236.138.42 with SMTP id z30mr16925223yhi.101.1361141615592; 
	Sun, 17 Feb 2013 14:53:35 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.33
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:34 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:02 -0600
Message-Id: <1361141595-1687-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 07/20] arago.conf: Use SDK supported kernel for am180x-evm
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:36 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index aa08fe0..031dee4 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -61,6 +61,10 @@ PREFERRED_VERSION_virtual/kernel_am335x-evm = "3.2.0-psp05.06.00.00"
 # Use the SDK supported u-boot version
 PREFERRED_VERSION_u-boot_am335x-evm = "2012.10-psp05.06.00.00"
 
+PREFERRED_VERSION_linux-omapl138-psp_am180x-evm = "2.6.37"
+PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
+
+
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
 PREFERRED_PROVIDER_udev = "udev"
-- 
1.7.0.4


