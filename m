Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id A7B2752A65
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 19:24:39 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so886528oag.38
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Lk8PIsdvRd0XM08raeYnONNmQ+PyXln4SO+opaXNMSI=;
	b=itc/CPGdBCHeKxHtpJCYpcZhoWDHB3+/k5v0CG2DgLmi7/yGWB53uI/BY3BEIICFM+
	cSf91W3YF49PzKKMUL4UvTrEGjRShnzoL6jRiJtfgp2QJ/LIB0g97B3mfpwmLajnBN1t
	Y89FqszAgP43XDn2ABykXFK1FmXf4OW5o4kG2ygWI5SrrOgzG5MUwqWntDFwsTELXblt
	iBdqVpJoxB99Bb47xB/TFfhW/Yqh7u0YOVs7EXaNXlorCM3c7T/QRcQ3mxF/g5FX9r1L
	6AuZLatSYS/NZlKaUCe8kB3tIuDBG5x/esuDgNqCe1AhRPojFRQAWZ0uk1U6iwZ2gpin
	yVVw==
Received: by 10.60.5.193 with SMTP id u1mr20205363oeu.111.1349897079249;
	Wed, 10 Oct 2012 12:24:39 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id bp7sm1947959obc.12.2012.10.10.12.24.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 12:24:38 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 10 Oct 2012 14:55:01 -0500
Message-Id: <1349898901-32630-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1349898901-32630-1-git-send-email-fcooper@ti.com>
References: <1349898901-32630-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/2] arago.conf: Select PREFERRED_PROVIDER of qt4-embedded
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
X-List-Received-Date: Wed, 10 Oct 2012 19:24:39 -0000

* Set the PREFERRED_PROVIDER for qt4-embedded depending on
  the ARM architecture. This is needed since the only non armv7
  device we have (am1808) does not have a SGX core therefore can
  not use qt4-embedded-gles

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1bd272f..1ce64ce 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -23,6 +23,12 @@ PREFERRED_VERSION_qt4-tools-nativesdk = "4.8.0"
 PREFERRED_VERSION_wpa-supplicant = "0.7.3+0.8.0-rc-ti"
 PREFERRED_VERSION_hostap-daemon = "0.7.3+0.8.0-rc-ti"
 
+ARAGO_QT_PROVIDER = "qt4-embedded"
+# Enable Qt+GLES for ARM v7a devices
+ARAGO_QT_PROVIDER_armv7a = "qt4-embedded-gles"
+
+PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
+
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
 
-- 
1.7.0.4


