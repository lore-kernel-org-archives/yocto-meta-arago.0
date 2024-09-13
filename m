Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC97FC6160
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 16:31:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.77918.1726245081881917708
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Sep 2024 09:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mel6rF/G;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48DGVKp4027614;
	Fri, 13 Sep 2024 11:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726245080;
	bh=wVU+urqyHDn0jcRYC02WpId5iHO2KW8yxvik4VP703Q=;
	h=From:To:Subject:Date;
	b=mel6rF/GQHuAnPkYaoNXVu6iW7LFa8IR1MhjH9k6tWmhuUP2A4dUXQPcoZYUqEVdM
	 I2PbENj6X4aPgs8tb/KQu69fcbuJcqgD/hw7i+2K51twMDDBxeqIkdzqmyvHjx6oqG
	 g82d980OI1nArnC19Nd90JudpA456g2gFq77a0DM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48DGVKDc130787
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Sep 2024 11:31:20 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Sep 2024 11:31:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Sep 2024 11:31:19 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48DGVJOl097071;
	Fri, 13 Sep 2024 11:31:19 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sp9CZ-0002Vo-IQ; Fri, 13 Sep 2024 11:31:19 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] yavta: Patch for 32bit compiles
Date: Fri, 13 Sep 2024 11:31:19 -0500
Message-ID: <20240913163119.9616-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Sep 2024 16:31:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15557

Seeing compile error on 32bit platforms.  Apply patch for the printf
formats to accommodate the longer numbers.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../yavta/0001-yavta-Fix-32-bit-compile.patch | 55 +++++++++++++++++++
 .../v4l2apps/yavta_%.bbappend                 |  7 +++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch
new file mode 100644
index 00000000..bad6dcf6
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-yavta-Fix-32-bit-compile.patch
@@ -0,0 +1,55 @@
+From a588c79237548931300d67a1f174ba01dad954fa Mon Sep 17 00:00:00 2001
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
+ yavta.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/yavta.c b/yavta.c
+index 3bf82b3..1e3b268 100644
+--- a/yavta.c
++++ b/yavta.c
+@@ -2192,7 +2192,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
+ 
+ 		clock_gettime(CLOCK_MONOTONIC, &ts);
+ 		get_ts_flags(buf.flags, &ts_type, &ts_source);
+-		printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
++		printf("%u (%u) [%c] %s %u %u B %lld.%06lld %lld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
+ 			(buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
+ 			v4l2_field_name(buf.field),
+ 			buf.sequence, video_buffer_bytes_used(dev, &buf),
+@@ -2254,7 +2254,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
+ 	bps = size/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
+ 	fps = i/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
+ 
+-	printf("Captured %u frames in %lu.%06lu seconds (%f fps, %f B/s).\n",
++	printf("Captured %u frames in %llu.%06lu seconds (%f fps, %f B/s).\n",
+ 		i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
+ 
+ done:
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


