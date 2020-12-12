Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 56F53529C5
	for <meta-arago@arago-project.org>;
	Sat, 12 Dec 2020 16:10:09 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BCGA2f0025968
	for <meta-arago@arago-project.org>; Sat, 12 Dec 2020 10:10:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607789402;
	bh=MZPrpSncLsItAb5lZvxPLCCXCqFqEoDYe4Mo2K/+hl8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Wlq3LyN+6ajiIAzvE4XG8s6HEcmkKbLsAXH1auxP5d7Dd3P/E02nPleQ4JUtVvL1h
	YolBKmb9nNxwGIKVbdpuFpnay+YM92FJ9oAdHAfHJmBBzQidrC7uLUQzV3dAW44/QL
	QYmO19gstdpqlyqC6ApH1YZp5V2w2UPZZPb+L6fY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BCGA21f125070
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 12 Dec 2020 10:10:02 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sat, 12 Dec 2020 10:10:02 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Sat, 12 Dec 2020 10:10:02 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BCGA14q070977;
	Sat, 12 Dec 2020 10:10:01 -0600
To: <praneeth@ti.com>
References: <20201212041813.16398-1-praneeth@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <cb2bb6b1-7116-90d3-92f2-3f66592ef08d@ti.com>
Date: Sat, 12 Dec 2020 10:10:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201212041813.16398-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell PATCH] optee-os: update recipe to pick 3.11
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
X-List-Received-Date: Sat, 12 Dec 2020 16:10:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Praneeth

On 12/11/20 10:18 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
>
> meta-arm where the optee-os_git.bb recipe is present,
> still is on 3.8 version on dunfell branch.
>
> This patch is to upgrade SRCREV to pick 3.11 from
> repo: ti-optee-os.git
> branch: ti-optee-os
>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   ...ide-empty-__getauxval-implementation.patch | 62 +++++++++++++++++++
>   ...t-support-for-libnames-after-libgcc-.patch | 55 ++++++++++++++++
>   ...ke-sure-that-libutils-is-linked-seco.patch | 44 +++++++++++++
>   ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 ++++++++++
>   ...0007-allow-setting-sysroot-for-clang.patch | 29 +++++++++
>   .../optee/optee-os_git.bbappend               | 13 +++-
>   6 files changed, 235 insertions(+), 2 deletions(-)
>   create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
>   create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
>   create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
>   create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
>   create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch

This failed to build

09:58:06 WARNING: optee-os-3.11-r0.arago0 do_fetch: Failed to fetch URL 
file://0006-allow-setting-sysroot-for-libgcc-lookup.patch, attempting 
MIRRORS if available
09:58:06 ERROR: optee-os-3.11-r0.arago0 do_fetch: Fetcher failure: 
Unable to find file 
file://0006-allow-setting-sysroot-for-libgcc-lookup.patch anywhere. The 
paths that were searched were:
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os-3.11/arago
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os/arago
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/files/arago
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os-3.11/am65xx-hs-evm
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os/am65xx-hs-evm
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/files/am65xx-hs-evm
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os-3.11/am65xx
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os/am65xx
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/files/am65xx
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os-3.11/k3
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os/k3
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/files/k3
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os-3.11/ti-soc
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os/ti-soc
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/files/ti-soc
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os-3.11/aarch64
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os/aarch64
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/files/aarch64
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os-3.11/aarch64
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os/aarch64
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/files/aarch64
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os-3.11/
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/optee-os/
09:58:06 
/OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/optee/files/
09:58:06     /OE/arago-dunfell-next-build/downloads
09:58:06 ERROR: optee-os-3.11-r0.arago0 do_fetch: Fetcher failure for 
URL: 'file://0006-allow-setting-sysroot-for-libgcc-lookup.patch'. Unable 
to fetch URL from any source.


