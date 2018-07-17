Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 0A4C7529AE
	for <meta-arago@arago-project.org>;
	Tue, 17 Jul 2018 14:37:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6HEboR1109411
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 09:37:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531838270;
	bh=PGgLoWXAdJMy2hQlTfXzbJ77i92LlEE6ibyLrhf0M/w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=L8EtTDjX/kZ+JgRiFxM+kTsn+2KeViaDqQgFvsrqsTUDxdpgWrV6GovQdP/RgddjW
	I9PSXJkR+bN2P3oIxpop8sfSwRqEjqV/ENwqpWLe9sPXd+fDFndc+v2CfESfubcvjO
	aVgbM3KNBFS+bZSYNZYq0VgsA5i7W79Mw+qRnGIc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6HEboIt032079
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 09:37:50 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 17 Jul 2018 09:37:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 17 Jul 2018 09:37:49 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6HEbnJI019493
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 09:37:49 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Jul 2018 10:37:34 -0400
Message-ID: <1531838254-3725-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531838254-3725-1-git-send-email-e-ruei1@ti.com>
References: <1531838254-3725-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 2/2] matrix-gui-analytics-demos: bump SRCREV to pick up the qwindow change
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
X-List-Received-Date: Tue, 17 Jul 2018 14:37:57 -0000
Content-Type: text/plain

This is just a tentative workaround for the Weston 2.0 display issue.
Weston should be used instead of qwindow-compositor after the Weston 2.0
display problem is fixed.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bbappend | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bbappend b/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bbappend
new file mode 100644
index 0000000..a246ecb
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bbappend
@@ -0,0 +1,4 @@
+PR_append = ".tisdk0"
+
+SRCREV = "5abdf6d0e0fbfc54aab8c8488ec42932351e27b9"
+
-- 
1.9.1


