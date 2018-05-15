Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 21CD55298C
	for <meta-arago@arago-project.org>;
	Tue, 15 May 2018 17:59:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4FHx9Hr020696
	for <meta-arago@arago-project.org>; Tue, 15 May 2018 12:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526407149;
	bh=Jh8ydgOsnrLjx+iBlqSZKiwWfGu5lfzFFylZadlSUQs=;
	h=From:To:CC:Subject:Date;
	b=KIP8QzvXp3XWm2oX0/0Ev5oxy342Fy79SRdjc46waMqna6A5nmrXOFssSj2DZipgl
	vlXnIGAMhoo+pVxLlT/QjMHySmlGs+Aw5dxQq5T810cHXmVdexx0Hn1hDHRj4Ty4pi
	iw0tgnpMd8k6gYvUJs399t5oZjQHnHmBR2ApJ1eU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FHx9lg012539
	for <meta-arago@arago-project.org>; Tue, 15 May 2018 12:59:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 15 May 2018 12:59:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 15 May 2018 12:59:09 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FHx9pl024748;
	Tue, 15 May 2018 12:59:09 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 May 2018 13:59:06 -0400
Message-ID: <1526407146-31748-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] arago.conf: do not package nativesdk-perl into devkit
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
X-List-Received-Date: Tue, 15 May 2018 17:59:15 -0000
Content-Type: text/plain

It causes issues with top level Makefile, host perl works just fine
and is available on pretty much any Linux host.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1ed0c1f..2643b98 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -172,3 +172,6 @@ ENTERPRISE_DISTRO = "1"
 # Arago based SDK. No need to prevent gst-ffmpeg from being used since we
 # disable troublesome software.
 LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav"
+
+# Do not package own copy of perl into devkit, rely on host one
+ASSUME_PROVIDED += "nativesdk-perl"
-- 
1.7.9.5


