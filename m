Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by arago-project.org (Postfix) with ESMTPS id 7193B529E1
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:42 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n9so2917229oag.27
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=6b5Kj3favHs5TXBDmdGwA+m1yDWxxVAI0X/EnZxIwa8=;
	b=MJw8zqSroTinMGJQm/rP1oVaR9weI1caNKPKpBcexyNpr5xBeuivI9LcXRtPEGm1/q
	qLFF9SAvSiizM4pNMmxm8ykSnp3b2r7fg+2VN4JC+UplJ2olEYzQn5PGuZrmn2Lrjrul
	sJLc0KaABDDe17rar/lXMDcJJneDmw//BIEmSFCKugdvZ0Mliab46FGWhvQudXsihNtY
	CQ+FON9BwuyYlg0GkL8Y8uPfWYAgDAd/yBuuAfbDw7bW9uPzHpGKCZDqu55fKTUIy7/K
	RXlEk1MQziNIN1ZylJq4N8tAeJG+M6Puu7+0cpu+YHUVjuLdTEJ+PKYtJg+vcJgp4lZY
	FgkQ==
X-Received: by 10.60.1.132 with SMTP id 4mr4522868oem.140.1358445221889;
	Thu, 17 Jan 2013 09:53:41 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.40
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:41 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:10 -0600
Message-Id: <1358445195-22441-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 07/12] arago-source-ipk.conf: Rename qml-playground quick-playground
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:42 -0000

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


