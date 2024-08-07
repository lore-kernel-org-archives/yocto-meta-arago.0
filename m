Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA67C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 08:16:07 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.28640.1723018560999622284
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 01:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=rjJTbdpL;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: d.schultz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1723018564; x=1725610564;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tGfCL3dExCHycyeYCsKji8mKj00+ScGqJKnQOmaQ7Fw=;
	b=rjJTbdpLc4zlyNVMylIvkenQNxNs66Jcrjct4M+9GSTxfWXz1dC94NbnghLGjWSD
	g7bBe6W2N3KwbG/M/ofXPiKLMUWdVY66dcNpSZwZgQVsysL5pk0eaIOO+qR7bZ5l
	G0+dgqK+iM2AfM7VaAyh2P3Dg4wb7wSevQuXARtAI0k=;
X-AuditID: ac14000a-03251700000021bc-d2-66b32d44eb29
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 28.B3.08636.44D23B66; Wed,  7 Aug 2024 10:16:04 +0200 (CEST)
Received: from ls-radium.phytec (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 7 Aug 2024
 10:16:03 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <meta-arago@lists.yoctoproject.org>
CC: Daniel Schultz <d.schultz@phytec.de>
Subject: [kirkstone/scarthgap/master][PATCH 2/2] meta-arago-extras: gstreamer1.0-plugins-vpe: Fix submodule fetch
Date: Wed, 7 Aug 2024 01:15:44 -0700
Message-ID: <20240807081544.3989185-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807081544.3989185-1-d.schultz@phytec.de>
References: <20240807081544.3989185-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWyRpKBR9dFd3OawaQnAhavdnWxODB6zDz1
	iDmAMYrLJiU1J7MstUjfLoErY9Kq3ewFb4UrJu06zdTAeECwi5GTQ0LARKK17SljFyMXh5DA
	EiaJu5Pb2SGce4wS/UfPs4JUsQloSdzZMpcZxBYRUJf4+vQ3UxcjBwezgIZE+zMmkLCwQKHE
	lBfv2EFsFgEVieZdk9hASngFrCQ+r8iA2CUvMfPSd7ASTgFriR/vjrCAlAgBlSw6mQQS5hUQ
	lDg58wkLiM0MVN68dTYzhC0hcfDFCzBbSEBBYva2yYwwI6ede80MYYdKHNm0mmkCo9AsJKNm
	IRk1C8moBYzMqxiFcjOTs1OLMrP1CjIqS1KT9VJSNzGCAlWEgWsHY98cj0OMTByMhxglOJiV
	RHibwzelCfGmJFZWpRblxxeV5qQWH2KU5mBREudd3RGcKiSQnliSmp2aWpBaBJNl4uCUamBU
	61R6uviUiH9mpT7n66Xpf6eKRuSuN5575Y+I1ftJR1dr2k+cIj8jWfTU3XPuEb4L/a7LFOQd
	dNNS2Z/TnLRtflyyaa3Fk0cxO9sPmcloHlt4L07Y1Hc+f8dbAdXS6pa9Xzab6n+U/bvmaPn8
	5/HlXk8eN+/4kHljulrAhYcX+mW9pn3qWPBWiaU4I9FQi7moOBEAEZ3zEEICAAA=
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Aug 2024 08:16:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15503

This gstreamer plugin is unable to geth the submodule 'common' from
freedesktop.org. It looks like the Git server has some issues and the
clone times out. Use the official Github mirror as workaround.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 ...01-Switch-submodule-common-to-github.patch | 24 +++++++++++++++++++
 .../gstreamer1.0-plugins-vpe_git.bb           |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-Switch-submodule-common-to-github.patch

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-Switch-submodule-common-to-github.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-Switch-submodule-common-to-github.patch
new file mode 100644
index 00000000..841dcf78
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-Switch-submodule-common-to-github.patch
@@ -0,0 +1,24 @@
+From 4dac2d8d41c21577f146a568baa5ff897835f98c Mon Sep 17 00:00:00 2001
+From: Daniel Schultz <d.schultz@phytec.de>
+Date: Wed, 7 Aug 2024 09:50:49 +0200
+Subject: [PATCH] Switch submodule common to github
+
+The freedesktop.org URL is currently not available. Therefore, this
+plugin won't build. Use the official GStreamer mirror on GitHub.
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


