Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 779B152A7A
	for <meta-arago@arago-project.org>;
	Fri, 17 Aug 2018 14:38:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7HEbsuB031921
	for <meta-arago@arago-project.org>; Fri, 17 Aug 2018 09:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534516675;
	bh=cfwNmWooTnJem0MDKd1dLm1zcHYCzcEhHgQDzi+Gc3c=;
	h=From:To:CC:Subject:Date;
	b=uNvsqMG+0Ja2zb5jCufMphs12KlUJrMu+XtwamGGBYH9f6+mCMEKxENu82FLiOB0M
	oJ3FrDa/YFU3noPvtoeSnAm8HJbBcchk6IfBTp2YY0lSsPu9SZbBMgj27gRtb1J9gL
	WS44ngyQRMAuyKe8LDg0Lv6QSfmtwLGmfqc9X9tU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7HEbsTa012345
	for <meta-arago@arago-project.org>; Fri, 17 Aug 2018 09:37:54 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 17 Aug 2018 09:37:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 17 Aug 2018 09:37:54 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7HEbpBV012531;
	Fri, 17 Aug 2018 09:37:52 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Aug 2018 10:25:50 -0400
Message-ID: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC 0/3] Add secondary toolchain to devkit
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
X-List-Received-Date: Fri, 17 Aug 2018 14:38:02 -0000
Content-Type: text/plain

Add a method to install a second toolchain in the devkit for situation
when a chip has multiple cores with different architectures.

Jacob Stiffler (3):
  external-linaro-secondary-sdk-toolchain: secondary toolchain for
    devkit
  packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
  arago-prefs: enable SECONDARY_TOOLCHAIN

 meta-arago-distro/conf/distro/include/arago-prefs.inc                 | 3 +++
 .../recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb      | 4 ++++
 .../recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb   | 4 ++++
 3 files changed, 11 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb

-- 
2.7.4


