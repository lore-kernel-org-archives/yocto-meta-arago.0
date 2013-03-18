Return-Path: <eyalreizer@gmail.com>
Received: from mail-qe0-f48.google.com (mail-qe0-f48.google.com
	[209.85.128.48])
	by arago-project.org (Postfix) with ESMTPS id 1EA4252A51
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 13:36:43 +0000 (UTC)
Received: by mail-qe0-f48.google.com with SMTP id 9so3278901qea.21
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=9ED+82gA1oLNvhabC99DQzwLGSDNmtIVFsXJAmLJ6y0=;
	b=Il4oRRq1h6G3UsEijBgph7dm81+CNtL3uBMm7AGEtyTqkq5ZqKtaxcpFW+mSXIUr8L
	rYMFrvdzmTuDWIuG1j7j4kyiohkC9JeJNQ+7QerlfaWC3Z9wcNc3wYnskxbMciKtPdAR
	pOB95cDNqGcZmvJr3iNSs9/qyDRuD+S73R7IOwdhwt0UbLDFPHhEW8TB+oZKJ4CZpfUh
	r5vwswDODb862DJJyDscKIYs9y+vp21xqCz3dGDOYtj5Ar7hCxnrBnUH32QtrCLeAO9y
	Cy2hEmf0tszOU0VDTGK0FaUuyR/f2TQim59iYHyYJFePEOSlnLTHOCUHZ2KnjCVOt8e+
	OmBw==
X-Received: by 10.49.83.162 with SMTP id r2mr22326598qey.7.1363613802680;
	Mon, 18 Mar 2013 06:36:42 -0700 (PDT)
Received: from user-VirtualBox.emea.dhcp.ti.com (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ku2sm32421520qeb.4.2013.03.18.06.36.41
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 06:36:42 -0700 (PDT)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 15:36:00 +0200
Message-Id: <1363613762-6537-8-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363613762-6537-1-git-send-email-eyalr@ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
Subject: [PATCH 8/9] arago conf: add rule for selecting between wilink chips
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
X-List-Received-Date: Mon, 18 Mar 2013 13:36:43 -0000

From: Eyal Reizer <eyalr@ti.com>

Add a configuration variable for selecting between wilink6 and
wilink8 support.

Based on this variable the right version will be picked for the
recipes which are different between wilink versions.

The default is currently set to "WILINK-6" until the next SDK release
which is going to switch to using WILINK-8.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 44141c1..4835160 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -43,6 +43,13 @@ PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.3"
 PREFERRED_VERSION_wpa-supplicant = "2.0-devel-ti"
 PREFERRED_VERSION_hostap-daemon = "2.0-devel-ti"
 
+WILINK_VERSION = "WILINK-6"
+PREFERRED_PROVIDER_wl12xx-firmware = "${@base_contains('WILINK_VERSION','WILINK-8','wl18xx-firmware','wl12xx-firmware',d)}"
+PREFERRED_PROVIDER_ti-compat-wireless-wl12xx = "${@base_contains('WILINK_VERSION','WILINK-8','ti-compat-wireless-wl18xx','ti-compat-wireless-wl12xx',d)}"
+PREFERRED_PROVIDER_hostap-daemon = "${@base_contains('WILINK_VERSION','WILINK-8','hostap-daemon-wl18xx','hostap-daemon',d)}"
+PREFERRED_PROVIDER_wpa-supplicant = "${@base_contains('WILINK_VERSION','WILINK-8','wpa-supplicant-wl18xx','wpa-supplicant',d)}"
+PREFERRED_PROVIDER_ti-wifi-utils = "${@base_contains('WILINK_VERSION','WILINK-8','ti-wifi-utils-wl18xx','ti-wifi-utils',d)}"
+
 # Use v4.08.00.02 of the Graphics SDK
 PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.02"
 PREFERRED_VERSION_libgles-omap3 = "4.08.00.02"
-- 
1.7.9.5


