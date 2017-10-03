Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 13E1152AE8
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsL4i005618
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046061;
	bh=s5UUYhS+8u/VKvqfYLoDx/bjVRdsQNkldX3aDO/0DCw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=echjb66qQo+/ikp5FUnVJQJshofTov38ed9THx+ESJjH+Ob/vpUGW/tDPKlLcj3db
	onTaeeSDMoDl1ipjUStak6W7UZ//PjVuCAXHqsgJbJp2iSr7ke9I99/PgKt9948MkN
	8wB9tKj6J5aQq49I/+4ma25Xz1KZPBnM13YrLLE8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsG9o013470
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:16 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFS3013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:16 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:53:54 -0400
Message-ID: <1507046051-57949-7-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 06/23] tisdk-rootfs-image: add packagegroup-arago-tisdk-graphics for omap-a15 unconditionally
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

Note: This has been done for both ti33x and ti43x already.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/images/tisdk-rootfs-image.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/images/tisdk-rootfs-image.bbappend b/recipes-core/images/tisdk-rootfs-image.bbappend
index 7346c0d..4b5230f 100644
--- a/recipes-core/images/tisdk-rootfs-image.bbappend
+++ b/recipes-core/images/tisdk-rootfs-image.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk4"
+PR_append = ".tisdk5"
 
 IMAGE_INSTALL_append_ti43x = " \
 	packagegroup-arago-tisdk-graphics \
@@ -11,5 +11,6 @@ IMAGE_INSTALL_append_ti33x = " \
 
 
 IMAGE_INSTALL_append_omap-a15 = " \
+	packagegroup-arago-tisdk-graphics \
   	packagegroup-arago-tisdk-hmi \
 "
-- 
1.9.1


