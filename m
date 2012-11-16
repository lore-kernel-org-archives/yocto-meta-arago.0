Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 0606A52A90
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2012 04:31:42 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2251875oag.38
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 20:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=c3XR9ByTjzT7/N72SKwhXtmcNmUHD2sBZOjFRTbx9ZQ=;
	b=gIsehM6MfOOxvN9YySvhonKk+pq4PpKDDmSQvZJ4gwr+naxK/zJax0pjHFw6PSNuOw
	y3FfIFduejBl0sAwIzz3G2qE+1DOOzdTbY8mw8wNgzcNfdZv88pdUc9tQ0/NPRZnTdTW
	Z59ipbTK5YSpGZ9QbpsNa1fA2Y0jZq9lDTwC5hLcCRNtkVVEMDaYa/NapbPoNNppCGcC
	4nx8NyDJIM7O8McJSvVHQFx/EZRekGc8ikoyVLQ27b/4SmAO9Mztvt6RWcR/h7ZakJp8
	xTTPi7juE+lyO5+h9DkHI8fraZau6RClKWeubZy14XU6dSn5+M3c51MQ7mQ2OlGviqgS
	Qbug==
Received: by 10.182.49.104 with SMTP id t8mr2942739obn.0.1353040302691;
	Thu, 15 Nov 2012 20:31:42 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm481759oeb.3.2012.11.15.20.31.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 20:31:42 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Nov 2012 22:31:30 -0600
Message-Id: <1353040290-26030-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353040290-26030-1-git-send-email-fcooper@ti.com>
References: <1353040290-26030-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/5] arago.conf: Enable ENTERPRISE_DISTRO flag
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
X-List-Received-Date: Fri, 16 Nov 2012 04:31:43 -0000

* Set ENTERPRISE_DISTRO flag to help insure features that are known to have
  commercial licensing issues are not turned on.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 3e37969..e3797ab 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -83,3 +83,8 @@ POLKITAUTH = ""
 
 # Enable generation of source packages for SDKs
 require arago-source-ipk.conf
+
+# Set ENTERPRISE_DISTRO flag to insure that recipes that have been flagged 
+# do not attempt to enable features that have potential commercial
+# licensing issues.
+ENTERPRISE_DISTRO = "1"
-- 
1.7.0.4


