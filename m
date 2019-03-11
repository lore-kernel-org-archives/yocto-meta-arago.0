Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 12297529C7
	for <meta-arago@arago-project.org>;
	Mon, 11 Mar 2019 15:52:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2BFq8MH033582
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 10:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552319528;
	bh=ChqEU4NIzuBrTKnFaIpApt9gI1S6drj0KmKoy3nfQFg=;
	h=From:To:CC:Subject:Date;
	b=v0FTb/3N6Z51/+MOzVojnlAMTNMxtDw0jtVrJNKXD0ZUc/CxO3K+XVqReePzh9Lkb
	7HHcI1R2uxE9bSNFePZVPgF7n7+NhrhKuWXBehtuZx5zWCbZCaWWuvpAEO5BUMfluO
	u/VJzwaLLfQsASZuQLdbohhnrb/a7I66kvcWJCtI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2BFq8gl077180
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 10:52:08 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 10:52:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 11 Mar 2019 10:52:07 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2BFq67H031358;
	Mon, 11 Mar 2019 10:52:07 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Mar 2019 11:39:46 -0400
Message-ID: <1552318790-23095-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/rocko][PATCH 0/4] Update open62541 to 0.4-dev
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
X-List-Received-Date: Mon, 11 Mar 2019 15:52:17 -0000
Content-Type: text/plain

The update to 0.4-dev adds pubsub support. This set also backports
mbedtls from meta-openembedded so that encryption can be enabled.

NOTE: The first patch in this set is only applicable to "rocko".

Jacob Stiffler (4):
  mbedtls: upgrade to 2.13.0
  mbedtls: extend to native/nativesdk
  open62541: update to 0.4-dev
  arago.conf: open62541: enable encryption

 meta-arago-distro/conf/distro/arago.conf           |  3 +
 .../recipes-connectivity/mbedtls/mbedtls_2.13.0.bb | 42 ++++++++++++++
 .../mbedtls/mbedtls_2.13.0.bbappend                |  1 +
 ...examples-client-allow-configurable-server.patch | 15 ++---
 ...0001-tests-fix-typing-of-size_t-in-printf.patch | 64 ++++++++++++++++++++++
 .../open62541/open62541_git.bb                     | 37 +++++++++----
 6 files changed, 144 insertions(+), 18 deletions(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bb
 create mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bbappend
 create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541/0001-tests-fix-typing-of-size_t-in-printf.patch

-- 
2.7.4


