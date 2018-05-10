Return-Path: <jake@udc0866934>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 58A3252978
	for <meta-arago@arago-project.org>;
	Thu, 10 May 2018 16:25:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4AGPp2M005967
	for <meta-arago@arago-project.org>; Thu, 10 May 2018 11:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1525969551;
	bh=WZWx8/FZAPqiAL4L+aYD5DKzYO0xA+1CaRIWKmnZq4A=;
	h=From:To:CC:Subject:Date;
	b=stggQWqDMO8nlSfKQdVO4xOByxrVo7o+JMIxpH1DJLrRsR0tEv5JE0Xl+iW4IWavO
	ylA2jqNSuCESzKftZm1CucbsXblXrsQYw/Q/WddsxH5EK1tLBnL1L3pUG/ujgT/1ah
	otoTWm0byOcydKFk2KLJaFbeLMDqdO1hshe+u+TY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4AGPppe029634
	for <meta-arago@arago-project.org>; Thu, 10 May 2018 11:25:51 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 10 May 2018 11:25:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 10 May 2018 11:25:51 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4AGPpJN015743;
	Thu, 10 May 2018 11:25:51 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1fGoO7-0008Sc-99; Thu, 10 May 2018 12:25:51 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 May 2018 12:25:49 -0400
Message-ID: <1525969549-11664-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-build-scripts][PATCH v2] bitbake-test-sdk-image: preserve bitbake-cookerdaemon.log
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
X-List-Received-Date: Thu, 10 May 2018 16:25:57 -0000
Content-Type: text/plain

* When stdout/stderr is piped, if there is an error during parsing,
  all that will be printed is "Unable to start bitbake server"
* The bitbake-cookerdaemon.log will contain the error message, so
  preserve it in the LOG_DIR.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: Inhibit error if log does not exist.

 lib/oesdk/bitbake-test-sdk-image | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index f17b594..98c8b4e 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -465,6 +465,12 @@ bitbake_sdk_images(){
             fi
         done
 
+        # Move the bitbake-cooker.log as some errors may get hidden in there.
+        #
+        # If it does not exist, then there is not much we can do, so inhibit the
+        # error code.
+        mv $build_dir/bitbake-cookerdaemon.log $LOG_DIR/$m-bitbake-cookerdaemon.log || true
+
         # Only run the build testing if the status of the above builds
         # was "pass"
         if [ "$build_status" == "pass" ]
-- 
1.9.1


