Return-Path: <x0038811@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3F1C952978
	for <meta-arago@arago-project.org>;
	Tue, 12 Jun 2018 04:45:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5C4jIcp010946
	for <meta-arago@arago-project.org>; Mon, 11 Jun 2018 23:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528778718;
	bh=ggPa6CZ2vS7UVoAiXoo4UIReMrVkw0arM1u+ghtmWMM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AiRqrI/mayaW9N5WjhRjsQ8OuUAC5+vrF9GPN/MJ+YsI8v25i4yVgSzwqir9uZrPz
	IZ1SNGmYqLZQlGBWv723zKY7dRDb6ILZYzWUVg8awtI4yFbj1RFOJkYq2K0zV+luYK
	2J+fIJNqdRqNeYL9IcMzHGSZu9ylbhZv/rnsUNpg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5C4jIdo005493
	for <meta-arago@arago-project.org>; Mon, 11 Jun 2018 23:45:18 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 11 Jun 2018 23:45:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 11 Jun 2018 23:45:18 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5C4jEKv015281;
	Mon, 11 Jun 2018 23:45:17 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Jun 2018 10:15:10 +0530
Message-ID: <1528778710-2395-3-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528778710-2395-1-git-send-email-x0038811@ti.com>
References: <1528778710-2395-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko V2 2/2] gst-ducati: Update SRCREV with latest commit
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
X-List-Received-Date: Tue, 12 Jun 2018 04:45:24 -0000
Content-Type: text/plain

This update brings in setting display-delay property
for ducati h264decoder.

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 6c6a474..556dc31 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.28"
-SRCREV = "7f3326b81b838fb6c916acd1d6a3090fda12c772"
+PR = "${INC_PR}.29"
+SRCREV = "19e911bb45757d8341ffd7819ca783ca04f5e3b1"
 
 BRANCH ?= "master"
 
-- 
1.9.1


