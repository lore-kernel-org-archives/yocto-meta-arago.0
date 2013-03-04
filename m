Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by arago-project.org (Postfix) with ESMTPS id CAF9D52ACE
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:01:52 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wc20so2155093obb.1
	for <meta-arago@arago-project.org>;
	Mon, 04 Mar 2013 12:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=1EQkyhTP5NQP21SfivTxFSmJ+oB6KYu+yOGYOgOxUnY=;
	b=Si0qTDpvaEjDYaXmMdb2q+t/UkNWm6rhCuQx9od6XTXFKve4Fg8ClN2ywHK6C550eG
	ABQqLoe+OhqUFm/NahxdmhMCZmxmRgVi9jjpO7PT75Ecb99AokHXNvW5YRy2gqRM8+/D
	uqL4Kvpmr9BdsDFLE+F4bkDy+xugo53V8LS9o3XoiOxvlaVziXS+cWgQZg33ebblv64Q
	mKgFg0wxc1xMdTkdsPGs9eC4PqEYG9u1Q6L5SB3Ic1c0i0I7wnDJfzIzCdhQbpSt+IJP
	ByLtoZsrjmcgu22F5EAu85f978At3K47k+BUIPrP6yc0Y8n+Y1AVFD13zEAGI5chK4iQ
	gs/g==
X-Received: by 10.182.39.69 with SMTP id n5mr17091032obk.72.1362427312236;
	Mon, 04 Mar 2013 12:01:52 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j4sm31153357oea.3.2013.03.04.12.01.50
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:01:51 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon,  4 Mar 2013 14:01:28 -0600
Message-Id: <1362427289-18057-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362427289-18057-1-git-send-email-fcooper@ti.com>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 09/10] arago-source-ipk.conf: Remove linux-stable and use linux
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
X-List-Received-Date: Mon, 04 Mar 2013 20:01:53 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* The linux stable recipe from oe-classic is now simply linux.
* Tweak arago-source-ipk.conf to reflect that change.
---
 .../conf/distro/arago-source-ipk.conf              |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 88cd21d..25a5d55 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -129,13 +129,9 @@ SRCIPK_INSTALL_DIR_pn-linux-omap = "board-support/linux-${PV}-${PR}"
 SRCIPK_PACKAGE_ARCH_pn-linux-omap = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux = "1"
-SRCIPK_INSTALL_DIR_pn-linux = "board-support/linux-${PV}-${PR}"
+SRCIPK_INSTALL_DIR_pn-linux = "board-support/linux-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-linux = "${MACHINE_ARCH}"
 
-CREATE_SRCIPK_pn-linux-stable = "1"
-SRCIPK_INSTALL_DIR_pn-linux-stable = "board-support/linux-${PV}-${PR}"
-SRCIPK_PACKAGE_ARCH_pn-linux-stable = "${MACHINE_ARCH}"
-
 CREATE_SRCIPK_pn-linux-omap4 = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omap4 = "board-support/linux-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-linux-omap4 = "${MACHINE_ARCH}"
-- 
1.7.0.4


