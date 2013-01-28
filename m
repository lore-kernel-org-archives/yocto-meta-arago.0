Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by arago-project.org (Postfix) with ESMTPS id 209EE52A62
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:47 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id ef5so2963981obb.39
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=DGqzg6tjrW5+pLlsNIwi5aqbc+ecfrYiXvDOHxJSrAI=;
	b=m5DOkqzfxxjtucHvBbV7XkNCsXcvG3ezcML4W6S7FviZt7plih6JcEdo3FVbY0H+wL
	GeiwW+HzRzmYifOjOY35mtqBGXCQGKcjDsQGMo/Fmt/zBiUMBM+YBUFmcDIMQhhBYMF0
	eER5BV9Yomrraj8qE1BRCS+53neUZOvvyiiBLpASA+wHNhM7LpWkj7sBcBSTGIzb0rXw
	zUg/Kssjo0TUQvYWtIrwSdFSWufr3yoIjTke7bqhmt8rkjrw8BcM1p31gpnrlvuimCQa
	APSEkNkVjX231Rd7JjWntggKDXgZ2HrXhN5fz/vPEUvw/8m7T6ydIZ7WLW3gl9Iv6Ceh
	IoqA==
X-Received: by 10.182.88.3 with SMTP id bc3mr11720395obb.8.1359393946527;
	Mon, 28 Jan 2013 09:25:46 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.44
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:45 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:05 -0600
Message-Id: <1359393932-31361-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 05/32] arago.conf: Use non GPLv3 version of gettext
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:47 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 8f0906d..42f7060 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -81,6 +81,7 @@ PREFERRED_VERSION_obex = "0.34"
 PREFERRED_VERSION_bluez4 = "4.98"
 PREFERRED_VERSION_bluez-hcidump = "2.2"
 PREFERRED_VERSION_bash = "3.2.48"
+PREFERRED_VERSION_gettext = "0.16.1"
 
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
-- 
1.7.0.4


