Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by arago-project.org (Postfix) with ESMTPS id C0820529AA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:54:19 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id n1so901625oag.2
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Uh+fDiNRP9auXqZ47bO4tDclsi7zuU8hH3utaE4XCSE=;
	b=DuXqhK/Ft5yIBcyCBWcEEWTEoiyfJXmAxK3TLJM9XXV87s9g5RzJr3duJZEu3X6II5
	7Wf1KEf5nNZgEoFGHhc0DJkI9zf0OUdHgZL+5YxpmKQMvow9PVtGDK5FaykxoLNyIZ1i
	7+bx00sJIac1NyXm5xqycZkFBw1fIb79B7K4xCxKuTFjUNb/Hh6trb5i1nBhH8ndxZWk
	3Z8kRZpqEBSmSxvxOt37+QWPfnWIjYTjUqIWiXdsXVDdv3zRIj0v8DPEg/4vG0stSb1C
	5SI4CDLW5zmcl6VlNiK+W8l6QMYY5kb10+cQRUfD8xpxNaGA/FkcEIobi6XUgsa6CEzf
	EWcg==
X-Received: by 10.60.169.133 with SMTP id ae5mr5590795oec.74.1359150859224;
	Fri, 25 Jan 2013 13:54:19 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.54.17
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:54:18 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:42 -0600
Message-Id: <1359150851-23602-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 02/31] bluez4: Re-enable hidd tool
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
X-List-Received-Date: Fri, 25 Jan 2013 21:54:20 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* The hidd tool was previously enabled in old Arago. This tool is used by the
  wireless team.
* Replace the disable configuration option with an enable to insure this tool
  is built.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../bluez/bluez4_4.98.bbappend                     |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.98.bbappend b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.98.bbappend
index e829d3e..d111425 100644
--- a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.98.bbappend
+++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.98.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -10,6 +10,8 @@ SRC_URI += "file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
 # disabling hid2hci from bluez4.
 EXTRA_OECONF := "${@oe_filter_out('--enable-hid2hci', '${EXTRA_OECONF}', d)}"
 
+EXTRA_OECONF := "${@'${EXTRA_OECONF}'.replace('--disable-hidd', '--enable-hidd')}"
+
 DEPENDS += "libsndfile1"
 
 # Add test/agent for testing
-- 
1.7.0.4


