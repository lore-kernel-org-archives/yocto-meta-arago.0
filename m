Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB29C52D7B
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 08:16:07 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.28640.1723018560999622284
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 01:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=a4 header.b=J1hfliGr;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: d.schultz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1723018559; x=1725610559;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6gRv+tTqgiAG+1P9Xj8GmOn+MHrLZra+mcUSmGQRriA=;
	b=J1hfliGrZ4G4qT0FeeH/MfuNYGUFkS/5GvjBW+o0eAueK0fSjadt/cI/DHDqC0vF
	pmjj8643D8nIAtiag7w6mj5BbVlLDaMOA45nioPvUPlPMp3P+TdZCv/sZs76h+cb
	IvV03e36RPt4pZbTP+93vFrsqIWmzwMVOrSsDgaM+Rg=;
X-AuditID: ac14000a-03251700000021bc-ce-66b32d3f09d9
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 97.B3.08636.F3D23B66; Wed,  7 Aug 2024 10:15:59 +0200 (CEST)
Received: from ls-radium.phytec (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 7 Aug 2024
 10:15:58 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <meta-arago@lists.yoctoproject.org>
CC: Daniel Schultz <d.schultz@phytec.de>
Subject: [kirkstone/scarthgap/master][PATCH 1/2] meta-arago-extras: gstreamer1.0-plugins-hevc: Fix submodule fetch
Date: Wed, 7 Aug 2024 01:15:43 -0700
Message-ID: <20240807081544.3989185-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsWyRpKBR9ded3Oawe35khavdnWxODB6zDz1
	iDmAMYrLJiU1J7MstUjfLoEr48h29YJnohUNy8+wNDAuFe5i5OSQEDCRuD7tOXMXIxeHkMAS
	JomZDxexQDj3GCV+b3zPDlLFJqAlcWfLXGYQW0RAXeLr099MXYwcHMwCGhLtz5hAwsICRRK/
	px9nBbFZBFQkGqauBSvnFbCSaJnzhAlimbzEzEvf2SHighInZz5hAbGZBTQlWrf/Zoew5SWa
	t84G6xUSUJCYvW0yI0zvtHOvmSHsUIkjm1YzTWAUmIVk1Cwko2YhGbWAkXkVo1BuZnJ2alFm
	tl5BRmVJarJeSuomRlDoiTBw7WDsm+NxiJGJg/EQowQHs5IIb3P4pjQh3pTEyqrUovz4otKc
	1OJDjNIcLErivKs7glOFBNITS1KzU1MLUotgskwcnFINjIVF3Y8Z1HcFm16dOF85h+uGTeVv
	1e/MPVWGD4oEG3enVBkKLZ8be3e16pu9R9+tPd1YldV3MXjCyui2SeEV/w8trffUNDZuvMAi
	wbi7vcS29me+6qy8D1e2G7t/3BM0d+MNq5riv6kFF33scvTmPf4/ofWOoZPBK+GZd2+L9j7P
	3Jakx974V4mlOCPRUIu5qDgRAFsOOYorAgAA
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Aug 2024 08:16:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15502

This gstreamer plugin is unable to geth the submodule 'common' from
freedesktop.org. It looks like the Git server has some issues and the
clone times out. Use the official Github mirror as workaround.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 ...01-Switch-submodule-common-to-github.patch | 24 +++++++++++++++++++
 .../gstreamer1.0-plugins-hevc_git.bb          |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch
new file mode 100644
index 00000000..cc243ca9
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch
@@ -0,0 +1,24 @@
+From d85ca8e83ea0537fd74d8bea3c358a3edddb87ac Mon Sep 17 00:00:00 2001
+From: Daniel Schultz <d.schultz@phytec.de>
+Date: Tue, 6 Aug 2024 11:26:55 +0200
+Subject: [PATCH] Switch submodule common to github
+=E2=80=8B
+The freedesktop.org URL is currently not available. Therefore, this
+plugin won't build. Use the official GStreamer mirror on GitHub.
+=E2=80=8B
+Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
+---
+ .gitmodules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+=E2=80=8B
+diff --git a/.gitmodules b/.gitmodules
+index a6b1eda..80ffbc5 100644
+--- a/.gitmodules
++++ b/.gitmodules
+@@ -1,3 +1,3 @@
+ [submodule "common"]
+ 	path =3D common
+-	url =3D git://anongit.freedesktop.org/gstreamer/common
++	url =3D https://github.com/GStreamer/common
+-- 
+2.34.1
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
index f9d04e3d..d17cb4f2 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2827f94fc0a1adeff4d9702e97ce2979"
 COMPATIBLE_MACHINE =3D "dra7xx"
 
 SRC_URI =3D "git://git.ti.com/git/processor-sdk/gst-plugin-hevc.git;protocol=3Dhttps;branch=3Dmaster \
-	file://0001-configure.ac-stop-using-export-symbols-regex.patch"
+           file://0001-configure.ac-stop-using-export-symbols-regex.patch \
+           file://0001-Switch-submodule-common-to-github.patch \
+"
 SRCREV =3D "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
 
 S =3D "${WORKDIR}/git"
-- 
2.25.1


