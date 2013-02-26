Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by arago-project.org (Postfix) with ESMTPS id 7CD9952AA3
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 03:33:18 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id i18so4493510oag.29
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2013 19:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=XBl3qpTAD2DXQjxHnQqyVpiV4TtfbBF/Bw/lN3zoyoA=;
	b=CC7AEeKVCN0Joej1keBXe+I00ZuOipk4x/qqyq5HaRHr8YU3dXpJ68OwibUgx01pUb
	XoC8lGuSO8PRsxIdUkPjYy9qPCNljZnCr/v9aAIo8rT904caRMFv9ArcYpzmBEPsEf8+
	+c8F7ohAUgbTvc+KZ5hNaHNALPp6T1X57/3/b1B7LD0UnyHBahCLSRxmTB7hVpJDz4oW
	+09uzBkKGmRYJYG3qPPx2v3JH1KbTp57veIaog9ScDm2LvOwsG8gJ8qtKA+ByqOlVkiL
	QKRZYYaQRmWyFNWclCFSUZXN5A4RHjALhUGyycWAU8QkV2rbRpXnRo3AyBLnJg/ZJ9lz
	ghEw==
X-Received: by 10.182.116.70 with SMTP id ju6mr9823243obb.48.1361849597967;
	Mon, 25 Feb 2013 19:33:17 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id p2sm17587176obb.6.2013.02.25.19.33.16
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 19:33:17 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2013 21:32:54 -0600
Message-Id: <1361849574-7710-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361849574-7710-1-git-send-email-fcooper@ti.com>
References: <1361849574-7710-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 10/10] arago.conf: Use SDK support u-boot for am180x-evm
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
X-List-Received-Date: Tue, 26 Feb 2013 03:33:18 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6b0879d..b7f0e2c 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -58,6 +58,7 @@ PREFERRED_VERSION_u-boot_am335x-evm = "2012.10-psp05.06.00.00"
 
 PREFERRED_VERSION_linux-omapl138-psp_am180x-evm = "2.6.37"
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
+PREFERRED_VERSION_u-boot_am180x-evm = "2010.12-psp03.21.00.04.sdk"
 
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
-- 
1.7.0.4


