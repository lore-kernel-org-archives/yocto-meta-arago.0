Return-Path: <eyalreizer@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by arago-project.org (Postfix) with ESMTPS id 0C3E852A51
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 13:36:46 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id bv4so1672018qab.17
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=jwkdR9d2oxiJCmkHls/Lc5DmWPH5VWaXUuWooTZOBNQ=;
	b=Y2lzSTFR0R90oZ3/F0vhS3CokLXPe19YAMqqPTq5uKpZsPFND0oh1L2lHujzZaZpDY
	7Md7RdrTUPdfkMF5O4h7sc7q23OQyd+EodMaHXmWA7N1SH7r2WbymmnRVm9bRaQKW+/c
	b9p54hCP0kgKlVMjQq3o295u9KI8c4nRau8MNWXfkHhqfe3D6Rp6fdtb3knw1ca+fZUq
	IWJWS8iBJTWaO4+OC+plQVINoZktz9v9jWGIfBY1KWIjiuThRJ6H13Ksso18hG6TMbgv
	SdOW4NVgE+dedsQutBW6ZIruuU20EzERS4bqaCy4YHOOMnUsnkA/uG8ILDb71AwxXrCC
	UPHA==
X-Received: by 10.49.18.232 with SMTP id z8mr22792272qed.0.1363613805865;
	Mon, 18 Mar 2013 06:36:45 -0700 (PDT)
Received: from user-VirtualBox.emea.dhcp.ti.com (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ku2sm32421520qeb.4.2013.03.18.06.36.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 06:36:45 -0700 (PDT)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 15:36:01 +0200
Message-Id: <1363613762-6537-9-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363613762-6537-1-git-send-email-eyalr@ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
Subject: [PATCH 9/9] connectivity packagegroup: add wlconf for wilink8
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
X-List-Received-Date: Mon, 18 Mar 2013 13:36:46 -0000

From: Eyal Reizer <eyalr@ti.com>

Add the wlconf configuration utility which is used for wilink8
only.
The package is added based on the WILINK_VERSION switch added to 
arago.conf

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index d936f83..eedad5d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -28,6 +28,7 @@ WLAN_COMMON = "\
     pulseaudio-module-bluetooth-device \
     eventdump \
     wpa-supplicant \
+    ${@base_contains('WILINK_VERSION','WILINK-8','wlconf','',d)} \
 "
 
 FIRMWARE_AND_DRIVERS = "\
-- 
1.7.9.5


