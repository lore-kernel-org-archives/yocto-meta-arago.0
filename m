Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 93DF852ACA
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINZNB007541
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709415;
	bh=2Yu5yfnmhO8H0PIDrb5eXuBHQiC8IjMRSLc6PA9VPoM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TsrRObDmWwvX13RUBScDj8n1uOcO7QpZWisV7ADrL0PMFuFydBe/r/zoxJNdrjZ30
	1W7WiJmgsI4YYpkIEw+3aGjhoXkTmPTbQUvZDQFam0krmpVJjC0+Em3rkuk9Z1j3E9
	iJTxEqXLSk7BQw9KPGlz182QECqbePeEf/Mcw+9I=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINZYg010243
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:35 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:35 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8a006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:15 -0400
Message-ID: <1506709407-16448-12-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 11/refresh_screen: add additional include/lib search path for X11 build
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:40 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/matrix/refresh-screen_2.0.bbappend | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 recipes-core/matrix/refresh-screen_2.0.bbappend

diff --git a/recipes-core/matrix/refresh-screen_2.0.bbappend b/recipes-core/matrix/refresh-screen_2.0.bbappend
new file mode 100644
index 0000000..1ba79f3
--- /dev/null
+++ b/recipes-core/matrix/refresh-screen_2.0.bbappend
@@ -0,0 +1,4 @@
+PR_append = ".tisdk0"
+
+CXXFLAGS_append = " -I${STAGING_DIR_HOST}/usr/local/XSGX/include"
+LDFLAGS_append = " -L${STAGING_DIR_HOST}/usr/local/XSGX/lib -Wl,-rpath-link,${STAGING_DIR_HOST}/usr/local/XSGX/lib"
-- 
1.9.1


