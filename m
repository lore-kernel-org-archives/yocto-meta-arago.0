Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2987FC6172
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 19:40:52 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.82037.1726256445863503924
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Sep 2024 12:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=D/YCpanF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48DJeida088603;
	Fri, 13 Sep 2024 14:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726256444;
	bh=5o48dG84rd1PSvvtjCaK96Wq0pWwGS/cvn42RcnPMp0=;
	h=From:To:Subject:Date;
	b=D/YCpanF5fBT0MXPbeFQrKIOs1zXMyefY0lPUAzmsoeGbctbH/1sZgkA19j/J8STH
	 tdbX5pCl3U4GnGgnm3I91iKVgzWSDw0ubTcD5PaKQ9evdZf+fEfHbae+SBAh963Xl7
	 y2RRW8VS8W8ikhcuCY7GXMhv2hHx8Lo8rj2TZjjk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48DJeil7002332;
	Fri, 13 Sep 2024 14:40:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Sep 2024 14:40:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Sep 2024 14:40:43 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48DJehqj061889;
	Fri, 13 Sep 2024 14:40:43 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1spC9r-0003BZ-OW; Fri, 13 Sep 2024 14:40:43 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] yavta: Patch for 32bit compiles
Date: Fri, 13 Sep 2024 14:40:43 -0500
Message-ID: <20240913194043.12205-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Sep 2024 19:40:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15559

Seeing compile error on 32bit platforms.  Apply patch for the printf
formats to accommodate the longer numbers.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix for 64bit builds.

 .../yavta/0001-yavta-Fix-32-bit-compile.patch | 64 +++++++++++++++++++
 .../v4l2apps/yavta_%.bbappend                 |  7 ++
 2 files changed, 71 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch
new file mode 100644
index 00000000..9fe8f894
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch
@@ -0,0 +1,64 @@
+From 1ae1c9e0420bba033da232df0d17acc0a9874b3d Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Fri, 13 Sep 2024 09:05:29 -0500
+Subject: [master][PATCH] yavta: Fix 32-bit compile
+
+The format for printing various time elements are not working for 64bit
+times on a 32bit compile.
+
+../git/yavta.c:2195:51: error: format '%ld' expects argument of type 'long int', but argument 8 has type '__time64_t' {aka 'long long int'} [-Werror=format=]
+ 2195 |                 printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
+      |                                                 ~~^
+      |                                                   |
+      |                                                   long int
+      |                                                 %lld
+......
+ 2199 |                         buf.timestamp.tv_sec, buf.timestamp.tv_usec,
+      |                         ~~~~~~~~~~~~~~~~~~~~
+      |                                      |
+      |                                      __time64_t {aka long long int}
+
+Change the formats to be lld/llu to accommodate the change for 32bit
+compiles.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ yavta.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/yavta.c b/yavta.c
+index 3bf82b3..0655311 100644
+--- a/yavta.c
++++ b/yavta.c
+@@ -2192,12 +2192,12 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
+ 
+ 		clock_gettime(CLOCK_MONOTONIC, &ts);
+ 		get_ts_flags(buf.flags, &ts_type, &ts_source);
+-		printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
++		printf("%u (%u) [%c] %s %u %u B %lld.%06lld %lld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
+ 			(buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
+ 			v4l2_field_name(buf.field),
+ 			buf.sequence, video_buffer_bytes_used(dev, &buf),
+-			buf.timestamp.tv_sec, buf.timestamp.tv_usec,
+-			ts.tv_sec, ts.tv_nsec/1000, fps,
++			(long long int) buf.timestamp.tv_sec, (long long int) buf.timestamp.tv_usec,
++			(long long int) ts.tv_sec, ts.tv_nsec/1000, fps,
+ 			ts_type, ts_source);
+ 
+ 		last = buf.timestamp;
+@@ -2254,8 +2254,8 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
+ 	bps = size/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
+ 	fps = i/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
+ 
+-	printf("Captured %u frames in %lu.%06lu seconds (%f fps, %f B/s).\n",
+-		i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
++	printf("Captured %u frames in %llu.%06lu seconds (%f fps, %f B/s).\n",
++		i, (long long unsigned int) ts.tv_sec, ts.tv_nsec/1000, fps, bps);
+ 
+ done:
+ 	video_free_buffers(dev);
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend
new file mode 100644
index 00000000..c3c22a55
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI:append = " \
+    file://0001-yavta-Fix-32-bit-compile.patch \
+"
+
+PR:append = ".arago0"
-- 
2.17.1


