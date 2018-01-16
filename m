Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 373FA52A82
	for <meta-arago@arago-project.org>;
	Tue, 16 Jan 2018 20:34:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0GKYOSF015892
	for <meta-arago@arago-project.org>; Tue, 16 Jan 2018 14:34:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516134864;
	bh=c1Vi+gossjUX9ihYxo7TDr/3knDLC0k0jBz840oX5EQ=;
	h=From:To:Subject:Date;
	b=eIeezcX5RA95BE5vtEWOGMxhHfGljUzyho26Hs0hJq5+ENb5XW+SothuOT81bYors
	f9JqGRrJU0TT7r7s+vO3Yh1vsRpK0ZIEfdMtyrUYFdRIYdvlxjIYDYw4pH9uGK8uhR
	+Hy3v8cTfvSnjPNl6sNXGhWi4xAQNyl5ZuJhLYxA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0GKYOsF023564
	for <meta-arago@arago-project.org>; Tue, 16 Jan 2018 14:34:24 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 16 Jan 2018 14:34:23 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 16 Jan 2018 14:34:24 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0GKYNlc023211
	for <meta-arago@arago-project.org>; Tue, 16 Jan 2018 14:34:23 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Jan 2018 15:34:21 -0500
Message-ID: <1516134861-19384-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] branding-processor-sdk: Excluding am57x targets from TI_PDK_LIMIT_SOCS
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
X-List-Received-Date: Tue, 16 Jan 2018 20:34:39 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 conf/distro/include/branding-processor-sdk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
index 2fbcb04..ff127d4 100644
--- a/conf/distro/include/branding-processor-sdk.inc
+++ b/conf/distro/include/branding-processor-sdk.inc
@@ -105,3 +105,6 @@ SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
 
 TI_PDK_LIMIT_SOCS_append_am57xx-evm = " am574x"
 TI_PDK_LIMIT_BOARDS_append_am57xx-evm = " idkAM574x"
+
+TI_PDK_LIMIT_SOCS = "dra72x dra75x dra78x"
+
-- 
1.9.1


