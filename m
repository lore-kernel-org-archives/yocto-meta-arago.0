Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by arago-project.org (Postfix) with ESMTPS id DEF9952A91
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 03:33:16 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id h1so4461453oag.31
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2013 19:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=BxoEe5kMvj294vVmpDxC5kNqFIIoSnQa0HtBQtFyvSQ=;
	b=T+L8AsA9AfINQZwXoZghAgBew+PYF4tlHLN6Qm3sbDWcLvzQJVN5z0PWgFhgBWM/yB
	sHxM6rVur8HWcuLnFimgeqndQz0r255QVmjJt1B0zKGHn9JOueyPR5Nh0JofiL43Mt1P
	GXCkrBilPsRHl03zLUvQ/I+wOh/TelRqEUD1qsSzqHrzXOmuPQVpnwMPDvYl2dm2k/0T
	dkaQOm8I3/P6In79WiLWvYXGs2EnF6Zj7WplsYwJPvXtQkvxmVoyyoxLg8UEr2k4K3WG
	VAz3C6yJy6N1SsKuqXNhvwGyBeSJU7+Hcp3zJPmf969yEqsEwlop9ADx74G2tduZN9YJ
	B8eQ==
X-Received: by 10.60.2.132 with SMTP id 4mr126666oeu.52.1361849596270;
	Mon, 25 Feb 2013 19:33:16 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id p2sm17587176obb.6.2013.02.25.19.33.14
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 19:33:15 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2013 21:32:53 -0600
Message-Id: <1361849574-7710-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361849574-7710-1-git-send-email-fcooper@ti.com>
References: <1361849574-7710-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 09/10] arago.conf: Use SDK supported kernel for am180x-evm
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
X-List-Received-Date: Tue, 26 Feb 2013 03:33:17 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index bc75ff2..6b0879d 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -56,6 +56,10 @@ PREFERRED_VERSION_virtual/kernel_am335x-evm = "3.2.0-psp05.06.00.00"
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


