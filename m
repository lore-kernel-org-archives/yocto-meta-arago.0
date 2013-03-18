Return-Path: <fcooperjr27@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by arago-project.org (Postfix) with ESMTPS id D417652A51
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 14:02:37 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id u28so2761616qcs.22
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ancgot4NzniADcov9knb7NgGRq2nmF619t0Mk4MOsRM=;
	b=gqi80acKmnZWQSOEDFwT1TMILPapJ+QpMR05AtnPnzPbDWocHQLZvys2tCv/efkBw1
	eHw3GGTbRsG0cshzYr88xX04hIJCOgLJdIGauabGDvA3uiIv5ljQdwOAnm4Jhnti1ddU
	oot827eg+hmEv6LDqd9qQMxhWHE5UJNRHGCHLnYdw74oqE0SvsTdXrQUo+S7yHZzkFNp
	FC5uezM/dEtDdbi5AKD4YkVK8VOR25DsiCUl3YvJNtmWNADtyX5b8LL0HQNd7jvpZUvd
	BZExhpcseYOG0bq4QAPrkFhn1x0M9NdK7AgNmn3Ga5MRe16zn6dAnjkj+3h0eg0x3RJK
	029w==
X-Received: by 10.224.27.77 with SMTP id h13mr19986736qac.23.1363615357318;
	Mon, 18 Mar 2013 07:02:37 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id t3sm32492548qen.5.2013.03.18.07.02.35
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 07:02:36 -0700 (PDT)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 09:02:24 -0500
Message-Id: <1363615345-6416-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363615345-6416-1-git-send-email-fcooper@ti.com>
References: <1363615345-6416-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 3/4] hostap-daemon: update for version r5.sp4.01
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
X-List-Received-Date: Mon, 18 Mar 2013 14:02:39 -0000

From: Eyal Reizer <eyalr@ti.com>

update the recipe for using the version from r5.sp.01 wlan release

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...d-change-conf-file-for-better-oob-startup.patch |   16 ++++++++--------
 .../hostap/hostap-daemon_git.bb                    |    4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
index 9008310..562970e 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -1,6 +1,6 @@
-From 685a744a1dc46853185191eb46a7cae4d49f30d1 Mon Sep 17 00:00:00 2001
+From 66b55f187843bca53cb3b7ef9c8fcd434a72f768 Mon Sep 17 00:00:00 2001
 From: Eyal Reizer <eyalr@ti.com>
-Date: Mon, 19 Nov 2012 09:47:39 +0200
+Date: Thu, 21 Feb 2013 03:55:22 -0800
 Subject: [PATCH] hostapd: change conf file for better sdk out of box startup
 
 Change the default channel to 6 and change the ssid to a more
@@ -14,7 +14,7 @@ Signed-off-by: Eyal Reizer <eyalr@ti.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
-index 494f7ca..9310ef4 100644
+index f71a881..00843aa 100644
 --- a/hostapd/hostapd.conf
 +++ b/hostapd/hostapd.conf
 @@ -83,7 +83,7 @@ ctrl_interface_group=0
@@ -26,15 +26,15 @@ index 494f7ca..9310ef4 100644
  
  # Country code (ISO/IEC 3166-1). Used to set regulatory domain.
  # Set as needed to indicate country in which device is operating.
-@@ -105,7 +105,7 @@ hw_mode=g
- # (default: 0, i.e., not set)
- # Please note that some drivers do not use this value from hostapd and the
+@@ -107,7 +107,7 @@ hw_mode=g
  # channel will need to be configured separately with iwconfig.
+ # When set to 0, automatic channel selection will be engaged. A channel
+ # will be selected from the desired hw_mode.
 -channel=1
 +channel=6
  
- # Beacon interval in kus (1.024 ms) (default: 100; range 15..65535)
- beacon_int=100
+ # Automatic channel selection (ACS) whitelist
+ # (default: not set)
 -- 
 1.7.9.5
 
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
index 3d2d014..424d55d 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
@@ -22,9 +22,9 @@ CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
 # of hostap
 PV = "2.0-devel-ti"
 
-PR = "r1+gitr${SRCPV}"
+PR = "r2+gitr${SRCPV}"
 
-SRCREV = "ol_R5.SP3.05"
+SRCREV = "ol_R5.SP4.01"
 
 SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
 	file://0001-hostapd-change-conf-file-for-better-oob-startup.patch;patchdir=.. \
-- 
1.7.0.4


