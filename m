Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by arago-project.org (Postfix) with ESMTPS id 68558529AA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:39 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id j1so1059662oag.1
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=c3ryWa38+/EUQxlHCcrhNhVTDBF3OIJz1ztZ8l15yu0=;
	b=FQVm5M2pIqGrDHSQidpAB4nG0EYAzgnyHFRiWuK4zl4GBzFYxs8RWd4wM4L+S8XmAO
	cep6wT5k2uYTJHfBwsKvGig45TFXqaUUJMlk2GkkDREodci0DyCNCaY3D71ObMskEggY
	oLNJaaLTMIsft0IDnbIqH0M/wZcoYYfSiBAOn6C4qFipa5qV5oGkHHRmbsRurBBj46X/
	W22AGyhDMd25ITElJGO1ofl74/3S+ejg985nrUYQ4iI5LOGNxjNW4GGfzb0e5YKF72cD
	j+NGpuzfyEW/ifRGyeW4mqTzNck9FYoeobQXMh1JgV7ACpSwqFzIPMSQl+5CYU1Iix2b
	3wYw==
X-Received: by 10.60.2.135 with SMTP id 7mr5638453oeu.127.1359151118799;
	Fri, 25 Jan 2013 13:58:38 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:37 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:03 -0600
Message-Id: <1359150851-23602-22-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 23/31] gst-plugins-good: Remove gconf dependency
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:39 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Remove gconf dependency. Gconf was bringing in unneeded GPLv3 components.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../gstreamer/gst-plugins-good_0.10.31.bbappend    |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
index 6f2a76c..0063885 100644
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 # The below changes are meant to mimic the patch
 # "gst-plugins-good: disable (uninstalled) examples" commit
@@ -8,5 +8,7 @@ PR_append = "-arago0"
 # to the denzil branch
 
 DEPENDS := "${@oe_filter_out('gtk+','${DEPENDS}', d)}"
+DEPENDS := "${@oe_filter_out('gconf','${DEPENDS}', d)}"
+DEPENDS := "${@oe_filter_out('gconf-native','${DEPENDS}', d)}"
 
-EXTRA_OECONF += "--disable-examples"
+EXTRA_OECONF += "--disable-examples --disable-gconftool --disable-gconf"
-- 
1.7.0.4


