Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 6DA575208C
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:41:03 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6212054oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6b5Kj3favHs5TXBDmdGwA+m1yDWxxVAI0X/EnZxIwa8=;
	b=RFiqZdpHLF2NB5PutnmbQ9B5tv+QFR7NU6f1Dr/df8DgkbMK4CVMZ98OGxncFxM4RS
	pxGROdUfyT2OixOc0+eNoX9cuJtkTPrUHjLBpIhaAy0t/OExncz8DtR20C6Wbgzqb2Fk
	llPciTB8wf09DRCEJY9q0GMu3Ua+QOkWjF8ZuDLgdE8ZvpPapfHsryS8DmxCN8LXq2Q/
	ETwy8fTOfxgunb3Cox3WX5kZnebvCUXnJuQKpYBHNC/0LPnTU+YA+GJhv7ssuzhWH5g+
	afZDFiH3yWhfJfNZyngeXhFzrj9llbKPjGpqbCE4AY9Y7Causf2POJes6PfDubC0Uw6u
	+8xQ==
Received: by 10.60.171.203 with SMTP id aw11mr15257158oec.92.1352760062850;
	Mon, 12 Nov 2012 14:41:02 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d7sm4394896oee.2.2012.11.12.14.41.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:41:02 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:40:53 -0600
Message-Id: <1352760055-6119-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352760055-6119-1-git-send-email-fcooper@ti.com>
References: <1352760055-6119-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] arago-source-ipk.conf: Rename qml-playground quick-playground
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
X-List-Received-Date: Mon, 12 Nov 2012 22:41:03 -0000

* Rename qml-playground to quick-playground to match the recipe name.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 312f629..845e8b8 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -49,8 +49,8 @@ SRCIPK_INSTALL_DIR_pn-matrix-gui = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-qml-carinfo = "1"
 SRCIPK_INSTALL_DIR_pn-qml-carinfo = "example-applications/${PN}-${PV}"
 
-CREATE_SRCIPK_pn-qml-playground = "1"
-SRCIPK_INSTALL_DIR_pn-qml-playground = "example-applications/${PN}-${PV}"
+CREATE_SRCIPK_pn-quick-playground = "1"
+SRCIPK_INSTALL_DIR_pn-quick-playground = "example-applications/${PN}-${PV}"
 
 CREATE_SRCIPK_pn-qt-catalog = "1"
 SRCIPK_INSTALL_DIR_pn-qt-catalog = "example-applications/${PN}-${PV}"
-- 
1.7.0.4


