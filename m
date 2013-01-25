Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by arago-project.org (Postfix) with ESMTPS id 8F11052ADB
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:14 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id h2so1030910oag.7
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ijWF/ogLQIzToEfAIrjnTscoGpw24WzwQ9UQyh41eyI=;
	b=Z/PWByD0GYEnqVTotDcNK36pv4d7BcEmvShfosknBm6IPuN2w0gvcnCrz3RSXBWKuK
	yis0UjP3B5oB5W1sdLbL9FKp+ZqTIU1xbC5doC2SKGx+3SsLCWIihFJgUG+8g5dskFjS
	0jdqPJUyu0jRN7pqOAKlZtjjMohwsk/Its04ABaE+EUFohRb3OU2z02qQVBjPA1jRbLu
	Iw8QfvbJ0cWAwoUttg1R7HrnLhjPBN7ui5HF3X64OlPzz73ep662UbFgT1En6mWZLdpB
	lgkChlR6rADObne/e1jrgqmPfWdFAVtevqI2PXB3mLtEsPF/YWU5vOxeebSDHK7jbToY
	ex1g==
X-Received: by 10.60.168.236 with SMTP id zz12mr5814537oeb.12.1359151094041;
	Fri, 25 Jan 2013 13:58:14 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.11
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:13 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:49 -0600
Message-Id: <1359150851-23602-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 09/31] arago.conf: update preferred versions of wpa-supplicant and hostapd
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:14 -0000

From: Eyal Reizer <eyalr@ti.com>

Update the PREFFERED_VERSION of wpa-supplicant and hostap-daemon to
use version 2.0-devel-ti

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1e39935..4e11251 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -38,8 +38,8 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
 PREFERRED_VERSION_qt4-embedded = "4.8.0"
 PREFERRED_VERSION_qt4-native = "4.8.0"
 PREFERRED_VERSION_qt4-tools-nativesdk = "4.8.0"
-PREFERRED_VERSION_wpa-supplicant = "0.7.3+0.8.0-rc-ti"
-PREFERRED_VERSION_hostap-daemon = "0.7.3+0.8.0-rc-ti"
+PREFERRED_VERSION_wpa-supplicant = "2.0-devel-ti"
+PREFERRED_VERSION_hostap-daemon = "2.0-devel-ti"
 
 # Use v4.08.00.01 of the Graphics SDK
 PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.01"
-- 
1.7.0.4


