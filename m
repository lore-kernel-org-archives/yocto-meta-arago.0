Return-Path: <jake@udc0866934>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 871DC520E2
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2019 18:38:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91IbfpX070329
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 13:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569955061;
	bh=UXKo6TgIgndnlKusIelcyFGRzaPptj0bBAXQYfHIKe4=;
	h=From:To:CC:Subject:Date;
	b=VfCKAQF0PCAhlyZQ6LPhqu9wcVpePoHw8T+2NyggbVKXYxnYJEaHIxW0JF28KyZ5p
	/FNw1aYKsf0Ezl4qFOLva3I2XyrXE6s6u2MgHToM+XnftM9EJHI1v948/Mfck9jngN
	Heq2AK1220wjnlapOidn0Kl3Mde5N+fpuTaqpgL4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91IbfbC030977
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 13:37:41 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 13:37:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 13:37:40 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91IbeYn093891;
	Tue, 1 Oct 2019 13:37:40 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1iFN1o-0004SN-5o; Tue, 01 Oct 2019 14:37:40 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Oct 2019 14:37:34 -0400
Message-ID: <1569955054-17100-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] openssl_perf: add sha2 algorithms
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
X-List-Received-Date: Tue, 01 Oct 2019 18:38:52 -0000
Content-Type: text/plain

* Measure performance for sha224, sha256, sha384, and sha512

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../openssl_perf_scripts/openssl_perf.sh                 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh b/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh
index 9da9ae2..03d3f58 100644
--- a/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh
+++ b/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh
@@ -118,6 +118,22 @@ echo "Running sha1 test.  Please Wait..."
 time -v $OPENSSL speed -evp sha1 -engine cryptodev > $TEMP 2>&1
 egrep 'Doing|User|System|Percent|Elapsed' $TEMP
 
+echo "Running sha224 test.  Please Wait..."
+time -v $OPENSSL speed -evp sha224 -engine cryptodev > $TEMP 2>&1
+egrep 'Doing|User|System|Percent|Elapsed' $TEMP
+
+echo "Running sha256 test.  Please Wait..."
+time -v $OPENSSL speed -evp sha256 -engine cryptodev > $TEMP 2>&1
+egrep 'Doing|User|System|Percent|Elapsed' $TEMP
+
+echo "Running sha384 test.  Please Wait..."
+time -v $OPENSSL speed -evp sha384 -engine cryptodev > $TEMP 2>&1
+egrep 'Doing|User|System|Percent|Elapsed' $TEMP
+
+echo "Running sha512 test.  Please Wait..."
+time -v $OPENSSL speed -evp sha512 -engine cryptodev > $TEMP 2>&1
+egrep 'Doing|User|System|Percent|Elapsed' $TEMP
+
 echo "Running md5 test.  Please Wait..."
 time -v $OPENSSL speed -evp md5 -engine cryptodev > $TEMP 2>&1
 egrep 'Doing|User|System|Percent|Elapsed' $TEMP
-- 
1.9.1


