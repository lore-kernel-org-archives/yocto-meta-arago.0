Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 44E93529AA
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 05:29:43 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2473710oag.38
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 22:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JKt0y/NlKIQl12l7pJ7t6L+KeDdBk/5ZY7rgYxtI018=;
	b=at8w7TXv3khZ9poAGIjxWYJJAkcZZPMpnHdFHj7F2OCxxXcT/goMLhC5PQqfP/wvTi
	EOcMpUixw1tmqImAq/tJkHgbqxT5GE6NK7CQYhld8RVuvCHOc/tCExtTqcQRAL5eU9oS
	mu6DVfTdgKaQQdMt5PeapRUIwRFKgOCjoGmmg7M0ynrSdtMqNAbYryRwiv69u7cDLqsn
	fmbM6EXeHlhgOHwsk/wW3JFEGtyOQGJQ53XTWE2ya+iv2MbzoAgaErjiCM2gewaZ95TI
	XgfXGQLm6ib+VpjnB0btiQBU4WXLdSnCOZjiBArz6jcQ2/ppuzkkL6jKtshlXlI2rfk3
	3yAA==
Received: by 10.182.117.74 with SMTP id kc10mr2600056obb.63.1350019782718;
	Thu, 11 Oct 2012 22:29:42 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k7sm4699393oek.6.2012.10.11.22.29.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 22:29:42 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Oct 2012 01:00:33 -0500
Message-Id: <1350021633-12803-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago.conf: Set PREFERRED_VERSION of the Graphics SDK
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
X-List-Received-Date: Fri, 12 Oct 2012 05:29:44 -0000

* Set the PREVERRED_VERSION of the Graphics SDK to the version used in the
  Arago SDK. This needed since meta-ti has an older version of the Graphics
  SDK set as the default.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 2188fde..9872b0d 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -30,6 +30,10 @@ PREFERRED_VERSION_qt4-tools-nativesdk = "4.8.0"
 PREFERRED_VERSION_wpa-supplicant = "0.7.3+0.8.0-rc-ti"
 PREFERRED_VERSION_hostap-daemon = "0.7.3+0.8.0-rc-ti"
 
+# Use v4.08.00.01 of the Graphics SDK
+PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.01"
+PREFERRED_VERSION_libgles-omap3 = "4.08.00.01"
+
 ARAGO_QT_PROVIDER = "qt4-embedded"
 # Enable Qt+GLES for ARM v7a devices
 ARAGO_QT_PROVIDER_armv7a = "qt4-embedded-gles"
-- 
1.7.0.4


