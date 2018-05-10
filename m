Return-Path: <jake@udc0866934>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id ECF81529E2
	for <meta-arago@arago-project.org>;
	Thu, 10 May 2018 14:36:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4AEaULV015678
	for <meta-arago@arago-project.org>; Thu, 10 May 2018 09:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1525962990;
	bh=nJ2Z6OsbTU6qspFVQFfbdEedCJnpVjHCC+N/uuCJGxQ=;
	h=From:To:CC:Subject:Date;
	b=mrceNnQAsEr+BjA0QHe+mUuPTsyciDAvvKzhK2sZE3k+EqLtCXbCQubuOJKbsIcYc
	xQH0AwGmYOPKufEo5brwXMzifUqqFpGUYcgRTtDGSSPW1Z2z1j/v5XMUp++f3jiE2L
	VaHp4cIWQZpGiQMQodTFrdubxCHgJC16RQWfX4Dk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4AEaU0a014893
	for <meta-arago@arago-project.org>; Thu, 10 May 2018 09:36:30 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 10 May 2018 09:36:30 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 10 May 2018 09:36:30 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4AEaUxJ030543;
	Thu, 10 May 2018 09:36:30 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1fGmgH-0007SY-JJ; Thu, 10 May 2018 10:36:29 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 May 2018 10:36:28 -0400
Message-ID: <1525962988-28642-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image: preserve bitbake-cookerdaemon.log
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
X-List-Received-Date: Thu, 10 May 2018 14:36:36 -0000
Content-Type: text/plain

* When stdout/stderr is piped, if there is an error during parsing,
  all that will be printed is "Unable to start bitbake server"
* The bitbake-cookerdaemon.log will contain the error message, so
  preserve it in the LOG_DIR.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/bitbake-test-sdk-image | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index f17b594..de081cf 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -465,6 +465,9 @@ bitbake_sdk_images(){
             fi
         done
 
+        # Move the bitbake-cooker.log as some errors may get hidden in there.
+        mv $build_dir/bitbake-cookerdaemon.log $LOG_DIR/$m-bitbake-cookerdaemon.log
+
         # Only run the build testing if the status of the above builds
         # was "pass"
         if [ "$build_status" == "pass" ]
-- 
1.9.1


