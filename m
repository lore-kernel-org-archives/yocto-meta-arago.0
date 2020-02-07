Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id ABF9D529F7
	for <meta-arago@arago-project.org>;
	Fri,  7 Feb 2020 19:09:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 017J77rL070799
	for <meta-arago@arago-project.org>; Fri, 7 Feb 2020 13:07:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581102427;
	bh=VGVpbtRmJ6KJ2PDrXBzdp8AOoDb8zoKQ7IkWcsI1Ad0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DMVn1jTFbvF9hMdEZ8iyZhxRG9ksEV8Cltoj49GW+EWMzy3glHAkvcnnmhbFe3mBJ
	slB7dDNy3AepjJ+C36B0R8lRTmK9UbVeMzyc68HoRkJ8IrqzTvmPk15nNPUxR9QBWF
	9QK396riCN34T2ThY9KSYWMHG4MdG8llJJZK7VGE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 017J77gH019722
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 7 Feb 2020 13:07:07 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 7 Feb 2020 13:07:06 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 7 Feb 2020 13:07:06 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017J765E024656;
	Fri, 7 Feb 2020 13:07:06 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Feb 2020 13:46:28 -0500
Message-ID: <1581101188-9014-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581101188-9014-1-git-send-email-j-stiffler@ti.com>
References: <1581101188-9014-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH 2/2] meta-toolchain-arago-minimal: define minimal devkit/sdk
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
X-List-Received-Date: Fri, 07 Feb 2020 19:09:02 -0000
Content-Type: text/plain

* This minimal sdk can use package management to obtain needed dev
  packages.
* Resulting shar image is ~45 MB
* Usage could be a little more elgant, but if feeds are available,
  the following can be done to install any package availble on a feed:

  $ cat ./sysroots/<target_sysroot>/etc/opkg/* > ./opkg.conf

  $ ./sysroots/<host_sysroot>/usr/bin/opkg --volatile-cache -f ./opkg.conf \
        -t $(mktemp -d) -o ./sysroot/<target_sysroot> update

  $ # To restore current tisdk sysroot (plus unuseable binaries)
  $ ./sysroots/<host_sysroot>/usr/bin/opkg --volatile-cache -f ./opkg.conf \
        -t $(mktemp -d) -o ./sysroot/<target_sysroot> install \
        packagegroup-arago-toolchain-tisdk-target

* This also has the potential to create new rootfs from feeds. Initial
  testing showed problems with setting ownership of files to root. The
  host sysroot does provide pseudo, so it seems possible without using
  root on the host.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-minimal.bb | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-minimal.bb

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-minimal.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-minimal.bb
new file mode 100644
index 0000000..8b7e8bc
--- /dev/null
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-minimal.bb
@@ -0,0 +1,5 @@
+require recipes-core/meta/meta-toolchain-arago-tisdk.bb
+
+TOOLCHAIN_SUFFIX = "-minimal"
+TOOLCHAIN_TARGET_TASK = "packagegroup-arago-toolchain-minimal-target"
+TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-arago-sdk-host nativesdk-buildtools-perl-dummy"
-- 
2.7.4


