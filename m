Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 363875208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:14 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ZxVg/+Z6F93GzceLTDC/JTZQJiUnFMffr2bgm4n27/k=;
	b=iefsjr2LymKQ27VISJBqrT+7j7KL0J24wXHIEiImhA6gSnhxPA5HRmTMzyRhU9+xw9
	7VvPQdG92mMZ3nodRjmBUDmv9bGSTEIZkG1nT5JwGOzUgrfDjHqM0fX9Yrng1l1gZYYZ
	niynVKp6tpF9brSBdhgHbT3XoQw757esAL7Hzu0C3G1CwYYG6RxeywaDzzd3vCvZP9Eu
	0jKgZPWMhBoIXPDtNPWnV8XTe80sqCopAHd+JqE0g0DeGq2/UYyJs5hnXnJzThu3r+Nf
	a6QVa+8Bs3wxsA3k4Ek62rE0JJj1rGd8pP/+w9Yo8VJsSiD9BVGQeYAJYJZBmn4pmZTv
	aNuQ==
Received: by 10.60.11.105 with SMTP id p9mr6811068oeb.128.1352080453913;
	Sun, 04 Nov 2012 17:54:13 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:13 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:18 -0600
Message-Id: <1352080417-9792-21-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 23/42] arago.conf: Setting PREFERRED_VERSIONS
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:14 -0000

* Setting PREFERRED_VERSIONS to use a specific version of a library or
  application that does not require a GPLv3 license.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 013e496..84d0050 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -67,6 +67,12 @@ PREFERRED_VERSION_udev = "164"
 PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
 PREFERRED_PROVIDER_jpeg_armv5te = "jpeg"
 
+# Setting PREFERRED_VERSIONS due to selecting a specific version of a library or
+# application that does not have a GPLv3 license
+PREFERRED_VERSION_gdbm = "1.8.3"
+PREFERRED_VERSION_readline = "5.2"
+
+
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
 
-- 
1.7.0.4


