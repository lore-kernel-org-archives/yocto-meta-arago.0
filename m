Return-Path: <d-senicic1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 860B852A1C
	for <meta-arago@arago-project.org>;
	Fri, 15 Sep 2017 11:38:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8FBcugo012001
	for <meta-arago@arago-project.org>; Fri, 15 Sep 2017 06:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505475536;
	bh=8IpXXzZqxFyuStI2cQQU0FQTpd+gLLZ8joeDKiDGNwE=;
	h=From:To:CC:Subject:Date;
	b=TYQpbLHFZmilU15cyTDNEA7vYOX3I4g4DrOUUET7Nv882ODGI8ctcwg/eua4aVzCC
	MZe4omlTON/hki/xxs/WF/kXUIQnCHQsfP6kaCBb1jTis2A5emdmBQPcLWN1UK59vS
	Bjk92eQ4WsQDvW3oFYFDBOeza0AFTiJtrVJHR7Ow=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8FBcuSb022178
	for <meta-arago@arago-project.org>; Fri, 15 Sep 2017 06:38:56 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 15 Sep 2017 06:38:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 15 Sep 2017 06:38:55 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8FBctpY011931;
	Fri, 15 Sep 2017 06:38:55 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Sep 2017 07:38:52 -0400
Message-ID: <1505475532-20699-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [EXTERNAL][PATCH] opencv: bump SRCREV to fix OpenCL context iniitialization
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
X-List-Received-Date: Fri, 15 Sep 2017 11:38:56 -0000
Content-Type: text/plain

* Initialize OpenCL context only if cmem module is inserted and ti-mctd is running

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
index 1eae97d..bf33a2e 100644
--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
@@ -11,7 +11,7 @@ SRC_URI_append += "\
      file://setupEnv.sh \
 "
 
-SRCREV_opencv = "ffb1eb48afbb1888670f461135c023dcdb6c9aca"
+SRCREV_opencv = "4458601eb2766461f2f9da0d2527ff25ecb20284"
 
 DEPENDS_remove_keystone = "qtbase"
 
-- 
1.9.1


