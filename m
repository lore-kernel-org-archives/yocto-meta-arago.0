Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id CE67B529A2
	for <meta-arago@arago-project.org>;
	Thu,  4 Mar 2021 23:18:32 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 124NIk2X120049;
	Thu, 4 Mar 2021 17:18:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614899926;
	bh=BbxGwH9HxEQy3JqaDbhPTvdcqQhSuhW+7DIBgEcF2sg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MiojAJY6O9iWNH/lyFPSZfCPk9fEgvtZ/QJySkdKQMu0fJRA6b4cEzSA1T3lBwrQg
	QcSq6i8DxLqT4Gr49z5X68BKcWoqC7tRKgna9F8gFPQCpZwIVZXIpY/swWqinzf7f8
	wodY950zWS0WGfy5fkrmOnoto/8zaYyLSIWUAs5A=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 124NIktw095084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Mar 2021 17:18:46 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 4 Mar 2021 17:18:46 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 4 Mar 2021 17:18:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 124NIjma059215;
	Thu, 4 Mar 2021 17:18:45 -0600
Date: Thu, 4 Mar 2021 17:18:45 -0600
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210304231845.xtxge5g7em6r7zmo@crisping>
References: <20210304065200.15811-1-nm@ti.com>
	<20210304184811.GF4892@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210304184811.GF4892@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago <meta-arago@arago-project.org>
Subject: Re: [PATCH dunfell] cryptodev: Move to 1.12 revision
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
X-List-Received-Date: Thu, 04 Mar 2021 23:18:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 13:48-20210304, Denys Dmytriyenko wrote:
> On Thu, Mar 04, 2021 at 12:52:00AM -0600, Nishanth Menon wrote:
> > Cryptodev out of kernel module and suite has yet another set of

[...]

> > +PR_append = ".arago0"
> 
> Same.

Thanks.. Subject to our thread continuing in parallel if a new layer is
needed... just posting for reference a v2 - inline:

-- >8 --
From 7a345806bda670973300e64e32affcf0ceab2d01 Mon Sep 17 00:00:00 2001
From: Nishanth Menon <nm@ti.com>
Date: Thu, 4 Mar 2021 00:26:29 -0600
Subject: [PATCH V2 master/dunfell] cryptodev: Move to 1.12 revision

Cryptodev out of kernel module and suite has yet another set of
challenge with broken API compatibility. However, the complete list of
patches beteween dunfell's default 1.10 and current latest 1.12 revisions:
 e0c25e289d6b (tag: cryptodev-linux-1.12) Release version 1.12
 55c6315058fc Fix build for Linux 5.11-rc1
 2f5e08aebf92 Fix build for Linux 5.9-rc1
 e8263d2d682b remove VLA usage from authenc.c
 dafa42cadc86 Fix for change in Kernel 4.4.168
 f4d3653c8dcb Release version 1.11
 9e765068582a Fix build for Linux 5.8-rc1
 7e72f6758f2d enabled the support for TLS1.1 - AES128-SHA1 - AES256-SHA1
 98b163a23f6b cryptlib.c: fix build on kernel v5.5+
 a1e738aef624 tests: cipher-aead-srtp: Fix cao->dst alignment
 f971e0cd4a0e Fix module loading with Linux v5.0-rc5

We have the following choices
1) just cherry-pick minimum set of kernel patches relevant for kernel
compatibility
OR
2) switch to a newer version with richer set of fixups

Attempting to switch to 1.12 version with minimal changes as a better
option to get a wider swath of kernel compatibility (v5.5 to v5.11), vs
the default of v5.4 kernel in dunfell vanilla.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 .../recipes-kernel/cryptodev/cryptodev-linux_%.bbappend      | 5 +++++
 .../recipes-kernel/cryptodev/cryptodev-module_%.bbappend     | 5 +++++
 .../recipes-kernel/cryptodev/cryptodev-tests_%.bbappend      | 5 +++++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
new file mode 100644
index 000000000000..a4ae187d4082
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
@@ -0,0 +1,5 @@
+# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
+# just pull 1.12 revision, everything else remains the same.
+
+PV = "1.12"
+SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
index f8a35cd73765..a1e1c91978c4 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
@@ -1,3 +1,8 @@
+# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
+# just pull 1.12 revision, everything else remains the same.
+
+PV = "1.12"
 PR_append = ".arago0"
+SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
 
 KERNEL_MODULE_AUTOLOAD += "cryptodev"
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend
new file mode 100644
index 000000000000..a4ae187d4082
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend
@@ -0,0 +1,5 @@
+# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
+# just pull 1.12 revision, everything else remains the same.
+
+PV = "1.12"
+SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
-- 
2.25.1.377.g2d2118b814c1

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

