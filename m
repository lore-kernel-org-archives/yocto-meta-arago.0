Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9558F52AFD
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 19:25:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LJPoNQ054619
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534879550;
	bh=H+ySli9hTwNTNYUnVF7ELJHcp815sAT5kBJRSgDEbJ8=;
	h=From:To:CC:Subject:Date;
	b=oK505r1OTvPc9NJgWmJ/AYDTsH+CsSxp7XwIhKpf7vjRrL6juLiE1KfGoQocHlFmJ
	zYNsFIpMIOY+uDq+1E4TfJ5upX+Kp21Aly8AoZNclz5/VdjrHfG6u/ifcCT3C4nTrR
	JWQFzqgtrSH/B93Ye521pnpOLpU7IWqCYofZCm9o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJPoHU008095
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:25:50 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 14:25:49 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 14:25:50 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJPn9H026051;
	Tue, 21 Aug 2018 14:25:49 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 15:13:54 -0400
Message-ID: <1534878837-20469-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 0/3] Add secondary toolchain to devkit
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
X-List-Received-Date: Tue, 21 Aug 2018 19:26:00 -0000
Content-Type: text/plain

Add a method to install a second toolchain in the devkit for situation
when a chip has multiple cores with different architectures.


Changes from RFC:
* Move all changes to meta-arago-distro
* Move configuration from arago-prefs.inc to toolchain-linaro.inc

Jacob Stiffler (3):
  external-linaro-secondary-sdk-toolchain: secondary toolchain for
    devkit
  packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
  toolchain-linaro: enable SECONDARY_TOOLCHAIN

 meta-arago-distro/conf/distro/include/toolchain-linaro.inc        | 3 +++
 .../recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb  | 4 ++++
 .../packagegroups/packagegroup-arago-cross-canadian.bbappend      | 8 ++++++++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend

-- 
2.7.4


