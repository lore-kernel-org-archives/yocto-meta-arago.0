Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004CAC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 09:31:17 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.29560.1723023069361426354
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 02:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=R0mhKynv;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: d.schultz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1723023067; x=1725615067;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7nTJntujaJAlX4hoON+97ZhbE87KuF83hG+KET/cdP0=;
	b=R0mhKynvzlCllWBjQPL26LmoJnhco/lHDWcS6JaKJJHLIdRkU2eUAL1xkknz9aSB
	u6SxwkZt7HuVRv5vijKSt0nqj1kaAah4DTxQ9i4CE8jLdmXUGjs6WZhQgeFii7IF
	eaR0J4H3O26rkD7ZThmAJpIVRgEFqLB1eODfkh43te8=;
X-AuditID: ac14000a-03251700000021bc-29-66b33eda12d8
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id BA.74.08636.ADE33B66; Wed,  7 Aug 2024 11:31:06 +0200 (CEST)
Received: from ls-radium.phytec (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 7 Aug 2024
 11:31:05 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <meta-arago@lists.yoctoproject.org>
CC: Daniel Schultz <d.schultz@phytec.de>
Subject: [kirkstone/scarthgap/master][PATCH v2 1/2] meta-arago-extras: gstreamer1.0-plugins-hevc: Fix submodule fetch
Date: Wed, 7 Aug 2024 02:30:52 -0700
Message-ID: <20240807093053.1083317-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOLMWRmVeSWpSXmKPExsWyRpKBR/eW3eY0g4lnrCxe7epicWD0mHnq
	EXMAYxSXTUpqTmZZapG+XQJXxvHb0gXTxCs6pnexNjCuFOli5OSQEDCR6Dh7h6WLkYtDSGAJ
	k8Sp469YQBJCAvcYJbqbQkFsNgEtiTtb5jKD2CIC6hJfn/5m6mLk4GAW0JBof8YEEhYWKJX4
	97CTHcRmEVCR6Nv4D2wMr4CVxMbzr5khdslLzLz0nR0iLihxcuYTsBpmoHjz1tnMELaExMEX
	L5ghTlCQmL1tMiNM77RzMHNCJbZ+2c40gVFgFpJRs5CMmoVk1AJG5lWMQrmZydmpRZnZegUZ
	lSWpyXopqZsYQYEnwsC1g7FvjschRiYOxkOMEhzMSiK8zeGb0oR4UxIrq1KL8uOLSnNSiw8x
	SnOwKInzru4IThUSSE8sSc1OTS1ILYLJMnFwSjUwuvY4zWcoNK2r89567JH0lX8iBVq+FxZ8
	nPL8XtF2o/IJwiHvI0XmLmQSimxMSHn2o3rS/qN7+j4Zv4te+kOz5OyiuflbSiPC75hfF1BY
	/6Yr9m5/7L9Sp3NH39/X1b30pOsMS//KrL2b7smKrDZbyMu7j/2UwPsVSiIzG60cdE4vMHlk
	e3C1vhJLcUaioRZzUXEiAJE76twqAgAA
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Aug 2024 09:31:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15504

This gstreamer plugin is unable to get the submodule 'common' from
freedesktop.org. It looks like the Git server has some issues and the
clone times out. Use the official Github mirror as workaround.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---

Changes in v2:
* Fixed typo in commit message
* Added Upstream-Status to Pending. It's up to TI if they want to patch these
  repos or keep it here.

 ...01-Switch-submodule-common-to-github.patch | 26 +++++++++++++++++++
 .../gstreamer1.0-plugins-hevc_git.bb          |  4 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch
new file mode 100644
index 00000000..b54ab31d
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch
@@ -0,0 +1,26 @@
+From d85ca8e83ea0537fd74d8bea3c358a3edddb87ac Mon Sep 17 00:00:00 2001
+From: Daniel Schultz <d.schultz@phytec.de>
+Date: Tue, 6 Aug 2024 11:26:55 +0200
+Subject: [PATCH] Switch submodule common to github
+
+The freedesktop.org URL is currently not available. Therefore, this
+plugin won't build. Use the official GStreamer mirror on GitHub.
+
+Upstream-Status: Pending
+
+Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
+---
+ .gitmodules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/.gitmodules b/.gitmodules
+index a6b1eda..80ffbc5 100644
+--- a/.gitmodules
++++ b/.gitmodules
+@@ -1,3 +1,3 @@
+ [submodule "common"]
+ 	path = common
+-	url = git://anongit.freedesktop.org/gstreamer/common
++	url = https://github.com/GStreamer/common
+-- 
+2.34.1
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
index f9d04e3d..d17cb4f2 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
 COMPATIBLE_MACHINE = "dra7xx"
 
 SRC_URI = "git://git.ti.com/git/processor-sdk/gst-plugin-hevc.git;protocol=https;branch=master \
-	file://0001-configure.ac-stop-using-export-symbols-regex.patch"
+           file://0001-configure.ac-stop-using-export-symbols-regex.patch \
+           file://0001-Switch-submodule-common-to-github.patch \
+"
 SRCREV = "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


