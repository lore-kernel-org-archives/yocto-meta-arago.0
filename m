Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by arago-project.org (Postfix) with ESMTPS id B494F52A92
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:07 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id k1so4971410oag.30
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Y9BI2jcVm96eL5MU6kRtMd/BKymU8PuMAp92NM9kw/s=;
	b=j7g2YTdeKTJNa8wPf3i7gOyuQNeFeNAJYBjwF0Fz/LpURZIKUU3Ppqs2nk3fJZAFE5
	MS/pLVTKo7Ptpt3chJPXTA1xVgBVBCDYJ3CufqjE6ZR0+3uLxDh0rdew0h/pCgROeilR
	XpqrH7v0uYELoSkpwGZXb9OdeO0bjJcBbhphheMcco1LUFWfj1kTTKhCNeO5fWbKue4l
	KQ7ISAXP2VfdshoEmtuBsweGnuExNhYUgefLsbYYoZB/qBJCJ6Intn6N1ma+3BAQY29T
	d5VJPOOMZf5tKIyIC5kMydesxofjCDmDS/76whPXmj6H+NhtF8cxTubvl/0DCEdaa1gT
	y7LA==
X-Received: by 10.60.8.65 with SMTP id p1mr10805820oea.4.1358632327249;
	Sat, 19 Jan 2013 13:52:07 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.05
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:06 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:28 -0600
Message-Id: <1358632316-12266-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 03/31] arago.conf: Use obexd version 0.34
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:08 -0000

* Use obexd version 0.34 that is known to work with the wl12xx daughter card
  software stack.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1a59188..ab8fcae 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -73,6 +73,7 @@ PREFERRED_PROVIDER_jpeg_armv5te = "jpeg"
 PREFERRED_VERSION_gdbm = "1.8.3"
 PREFERRED_VERSION_readline = "5.2"
 
+PREFERRED_VERSION_obex = "0.34"
 
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
-- 
1.7.0.4


