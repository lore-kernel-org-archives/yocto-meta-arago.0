Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ye0-f176.google.com (mail-ye0-f176.google.com
	[209.85.213.176])
	by arago-project.org (Postfix) with ESMTPS id 0392752A8E
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:37 +0000 (UTC)
Received: by mail-ye0-f176.google.com with SMTP id m1so909754yen.35
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=fOZBt6pzmgxexVxkengDv6y2Odd5tMcxcUIzB9D4clg=;
	b=He7GDp5yIV6lIj17w2AqGHV+46m+E3TvaIvN2QJDfhmTEt6WfHS17/VbJIktDQpJfO
	SsuRhSiY0o55rm6XhPSLxTNVeDN+WB/IWwcpk7LA4cjxRsSmAG+NFl/KrUd0tnOyUA+C
	JyOw9UKY0HFLZ8lMHLrXQnCKPFfwB3GIQO0ZBO8yzSqrN2JjYGIfc1WXEGXGqq51UakL
	NCJSIE1BjmmmuKacR9uYcZ1SRNV6iLI3QKVEVQvU2ymWwaBqpsc4uXokrhHgSlKYn79A
	myXM3MDWelNTOs9SCs3ehJalry0Sj4aAeBAciGQBgEJx9lVGUZSvoIo8wnYQ02/fcoOp
	TCNA==
X-Received: by 10.236.138.161 with SMTP id a21mr16610838yhj.96.1361141617698; 
	Sun, 17 Feb 2013 14:53:37 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.35
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:36 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:03 -0600
Message-Id: <1361141595-1687-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 08/20] arago.conf: Use SDK support u-boot for am180x-evm
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:38 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 031dee4..22c8a0e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -63,6 +63,7 @@ PREFERRED_VERSION_u-boot_am335x-evm = "2012.10-psp05.06.00.00"
 
 PREFERRED_VERSION_linux-omapl138-psp_am180x-evm = "2.6.37"
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
+PREFERRED_VERSION_u-boot_am180x-evm = "2010.12-psp03.21.00.04.sdk"
 
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
-- 
1.7.0.4


