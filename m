Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8B21052AF5
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsL7v005615
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046061;
	bh=19mg0qAwRRWu1z3yC+oviyfqEguAMBVxNRhb8Ftm2xw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Sxssu2ik3/e3het5m1rJP5uAvYixyS12nfMsldyXAb8QlejLoc8Bne0IxvKUpeZQM
	WrlsEUu/MLpnk2Qevx1tiRXJkynpjxAQsjSpSBVEZFlU7NbEwrdjh9V84mojcL3SOs
	Rim6Iwm0pyy5jUfd77XwEn88RwtbbE/KdMdbpuh4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsGR0018663
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:16 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:16 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFS1013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:16 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:53:52 -0400
Message-ID: <1507046051-57949-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 04/23] layer.conf: add xsgx-ddk for X11 support
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:32 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 0334463..7b2e9a0 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,3 +7,5 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-processor-sdk"
 BBFILE_PATTERN_meta-processor-sdk := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-processor-sdk = "15"
+
+SIGGEN_EXCLUDERECIPES_ABISAFE_append = " ti-xsgx-ddk-km  ti-xsgx-ddk-um"
-- 
1.9.1


