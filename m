Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170FCC52D7B
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 09:31:18 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.29560.1723023069361426354
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 02:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=hbYZf52K;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: d.schultz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1723023069; x=1725615069;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7Qw5C+seLb0jPZbCukBMrwqOrjEc+R2SgNf5iCo2pYk=;
	b=hbYZf52KC2yM5GUAiU0kYDYQQcJOXmdqJWyvuLuYSGBSZep+FP73AifMOJw50UIb
	LfHRyqGz9bElWdGfC47GCXXchgJHGq0qIwg5Ae5Q0DfXS7XeuqC2SS/CEOhvz/6u
	MhL0PxCySsQyD3cYw/EA+caZzCm4ZIt/U0u8+hR0cEs=;
X-AuditID: ac14000a-03e52700000021bc-2a-66b33edd300c
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id DA.74.08636.DDE33B66; Wed,  7 Aug 2024 11:31:09 +0200 (CEST)
Received: from ls-radium.phytec (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 7 Aug 2024
 11:31:08 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <meta-arago@lists.yoctoproject.org>
CC: Daniel Schultz <d.schultz@phytec.de>
Subject: [kirkstone/scarthgap/master][PATCH v2 2/2] meta-arago-extras: gstreamer1.0-plugins-vpe: Fix submodule fetch
Date: Wed, 7 Aug 2024 02:30:53 -0700
Message-ID: <20240807093053.1083317-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807093053.1083317-1-d.schultz@phytec.de>
References: <20240807093053.1083317-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWyRpKBR/eu3eY0g3VLdS1e7epicWD0mHnq
	EXMAYxSXTUpqTmZZapG+XQJXRs+eR+wFy0Urjr1iaWA8J9TFyMkhIWAisfvYUnYQW0hgCZPE
	oU1AcS4g+x6jxIw1B5lBEmwCWhJ3tswFs0UE1CW+Pv3N1MXIwcEsoCHR/owJJCwsUCJxcusV
	RhCbRUBFYtapVWBxXgEriUeLP7JD7JKXmHnpO5jNKWAtMXfJF0aIvVYSJ3va2CDqBSVOznzC
	AmIzA9U3b53NDGFLSBx88YIZol5BYva2yYwwM6ede80MYYdKbP2ynWkCo9AsJKNmIRk1C8mo
	BYzMqxiFcjOTs1OLMrP1CjIqS1KT9VJSNzGCAlWEgWsHY98cj0OMTByMhxglOJiVRHibwzel
	CfGmJFZWpRblxxeV5qQWH2KU5mBREudd3RGcKiSQnliSmp2aWpBaBJNl4uCUamC0MXrS+K7n
	ba3U73ufy3k25PsaK09qz+uY88488OGL+6oPYs+Y/GXm2VUtcPTwgocxn0+xqYY/486q2hwU
	+X3f4xt/FXobvzXcjX/QHuZqKXU2J9984VJndZ+6za8PR7+32abM9MW4Zk02i0DKK5m62sVm
	65cIRh5QqHh/7VNQePLs7Uda17xWYinOSDTUYi4qTgQALFm740ICAAA=
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Aug 2024 09:31:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15505

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
 .../gstreamer1.0-plugins-vpe_git.bb           |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-Switch-submodule-common-to-github.patch

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-Switch-submodule-common-to-github.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-Switch-submodule-common-to-github.patch
new file mode 100644
index 00000000..43f5493e
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-Switch-submodule-common-to-github.patch
@@ -0,0 +1,26 @@
+From 4dac2d8d41c21577f146a568baa5ff897835f98c Mon Sep 17 00:00:00 2001
+From: Daniel Schultz <d.schultz@phytec.de>
+Date: Wed, 7 Aug 2024 09:50:49 +0200
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
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index 237031b1..2038e2b1 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -14,4 +14,5 @@ SRCREV = "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
 
 SRC_URI = "git://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=https \
            file://0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch \
+           file://0001-Switch-submodule-common-to-github.patch \
 "
-- 
2.25.1


